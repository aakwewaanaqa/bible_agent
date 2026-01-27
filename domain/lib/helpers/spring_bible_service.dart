import 'package:dio/dio.dart';
import 'package:domain/abstractions/i_bible_service.dart';
import 'package:domain/models/verse.dart';
import 'package:enough_convert/enough_convert.dart';
import 'package:html/dom.dart';

import 'index.dart';

class SpringBibleService implements IBibleService {
  @override
  Future<List<Verse>> fetchBookChapter({
    required BibleChapterNamedIndex index,
  }) async {
    final noNameIndex = BibleChapterNoNameIndex.fromNamedIndex(index: index);
    final pureIndex = noNameIndex.pureIndex;
    final url = Uri.https(
      'springbible.fhl.net',
      '/Bible2/cgic201/read201.cgi',
      {
        'na': '0',
        'chap': '$pureIndex',
        'ver': 'big5',
        'ft': '0',
        'temp': '-1',
        'tight': '1',
      },
    );

    final dio = Dio();
    final rsp = await dio.get(
      url.toString(),
      options: Options(responseType: ResponseType.bytes),
    );

    // old bible from fhl is encoded in big5
    final doc = Document.html(const Big5Codec().decode(rsp.data));
    // body div ol.foreach li
    return doc.querySelector('body div ol').so((ol) {
      return ol!.querySelectorAll('li').mapi((i, li) {
        return Verse(index: (i + 1), text: li.text.trim());
      }).toList();
    });
  }
}
