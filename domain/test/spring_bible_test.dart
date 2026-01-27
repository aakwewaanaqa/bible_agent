import 'package:domain/helpers/index.dart';
import 'package:test/test.dart';

void main() async {
  final service = SpringBibleService();

  test('抓取創世記 30 章', () async {
    final verses = await service.fetchBookChapter(
      index: BibleChapterNamedIndex(
        book: BibleBookEnum.Genisis,
        chapter: 30,
      ),
    );
    expect(verses, isNotEmpty);
    print('創世記 30 章共 ${verses.length} 節');
    print('第一節: ${verses.first}');
    verses.forEach(print);
  });

  test('抓取詩篇 59 篇', () async {
    final verses = await service.fetchBookChapter(
      index: BibleChapterNamedIndex(
        book: BibleBookEnum.Psalm,
        chapter: 59,
      ),
    );
    expect(verses, isNotEmpty);
    print('詩篇 59 篇共 ${verses.length} 節');
    print('第一節: ${verses.first}');
    verses.forEach(print);
  });

  test('抓取啟示錄 2 章', () async {
    final verses = await service.fetchBookChapter(
      index: BibleChapterNamedIndex(
        book: BibleBookEnum.Revelation,
        chapter: 2,
      ),
    );
    expect(verses, isNotEmpty);
    print('啟示錄 2 章共 ${verses.length} 節');
    print('第一節: ${verses.first}');
    verses.forEach(print);
  });
}
