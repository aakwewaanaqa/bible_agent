import 'package:bible_agent/helpers/api/fba.swagger.dart';
import 'package:dio/dio.dart' as d;
import 'package:enough_convert/enough_convert.dart';
import 'package:html/dom.dart';
import 'package:test/scaffolding.dart';

// make a test to look for verses
// 記得要用 dart test test/look_for_verses.dart
// 不然會被擋下網路權限。。
void main() {
  /// the craziest way to get verses from fhl net
  /// 1. make chapter name into chapter index (1-based)
  /// 2. recieve bytes from web call
  /// 3. parse html from bytes
  /// 4. query body div ol foreach li
  /// 5. extract verses from li
  test('look up verses in genesis 2 in fhl net', () async {
    final dio = d.Dio();
    final url = Uri.https(
      'springbible.fhl.net',
      '/Bible2/cgic201/read201.cgi',
      {
        'na': '0',
        'chap': '2',
        'ver': 'big5',
        'ft': '0',
        'temp': '-1',
        'tight': '1',
      },
    );
    final rsp = await dio.get(
      url.toString(),
      options: d.Options(responseType: d.ResponseType.bytes),
    );
    assert(rsp.statusCode == 200);

    // old bible from fhl is encoded in big5
    final doc = Document.html(const Big5Codec().decode(rsp.data));
    // body div ol.foreach li
    doc.querySelectorAll('body div ol').forEach((ol) {
      for (final li in ol.querySelectorAll('li')) {
        print(li.text.trim());
      }
    });
  });

  test('look up verses in genesis 2 in free bible api', () async {
    final dio = d.Dio();
    final translation = 'cmn_cuv';
    final book = 'GEN';
    final chapter = '2';

    // the free bible api used path variables and was utf-8
    final url = Uri.https(
      'bible.helloao.org',
      '/api/$translation/$book/$chapter.json',
    );
    final rsp = await dio.get(url.toString());
    assert(rsp.statusCode == 200);
    // print(rsp.data);
  });

  test('look up verses in genesis 2 by fba', () async {
    final fba = Fba.create(baseUrl: Uri.https('bible.helloao.org'));

    final translation = 'cmn_cuv';
    final book = 'GEN';
    final chapter = '2';
    await fba
        .apiTranslationBookChapterJsonGet(
          translation: translation,
          book: book,
          chapter: chapter,
        )
        .then((rsp) {
          rsp.body?.chapter?.content?.forEach((c) {
            print(c);
          });
        })
        .catchError((e, s) {
          print(e);
          print(s);
        });
  });
}
