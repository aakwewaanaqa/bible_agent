import 'package:dio/dio.dart';
import 'package:domain/abstractions/i_bible_service.dart';
import 'package:domain/models/web_changed_exception.dart';
import 'package:html/dom.dart';
import 'index.dart';

class BibleGatewayService implements IBibleService {
  String _getBookAcronym(BibleBookEnum book) {
    final key = BibleBookSearchKey.keys.firstWhere((k) => k.bookEnum == book);
    return key.acronyms.last; // Use the English acronym
  }

  @override
  Future<List<Verse>> fetchBookChapter({
    required BibleChapterNamedIndex index,
  }) async {
    final acronym = _getBookAcronym(index.book);
    final search = '$acronym${index.chapter}';

    final uri = Uri(
      scheme: 'https',
      host: 'www.biblegateway.com',
      path: '/passage/',
      queryParameters: {
        'search': search,
        'version': 'NIV',
      },
    );

    final dio = Dio();
    final rsp = await dio.get(
      uri.toString(),
    );

    final doc = Document.html(rsp.data);
    final container = doc.querySelector('div.std-text');
    if (container == null) {
      throw WebChangedException('BibleGateway page structure changed');
    }

    // Remove titles, cross-references, footnotes, and verse numbers
    container
        .querySelectorAll(
            'h3, sup.crossreference, sup.footnote, sup.versenum, span.chapternum')
        .forEach((e) => e.remove());

    return container
        .querySelectorAll('span.text')
        .map((e) => e.text)
        .mapi((i, text) {
      return Verse(index: (i + 1), text: text);
    }).toList();
  }
}
