import 'index.dart';

void main() {
  final service = BibleGatewayService();

  /// 測試抓取創世紀 30 章
  test('fetch Genesis chapter 30', () async {
    final index = BibleChapterNamedIndex(
      book: BibleBookEnum.Genisis,
      chapter: 30,
    );
    final verses = await service.fetchBookChapter(index: index);

    expect(verses, isNotEmpty);
    expect(verses.first.index, 1);
    // Genesis 30:1 starts with Rachel's frustration about not having children
    expect(verses.first.text, contains('Rachel'));
    verses.forEach(print);
  });

  /// 測試抓取詩篇 59 篇
  test('fetch Psalm chapter 59', () async {
    final index = BibleChapterNamedIndex(
      book: BibleBookEnum.Psalm,
      chapter: 59,
    );
    final verses = await service.fetchBookChapter(index: index);

    expect(verses, isNotEmpty);
    expect(verses.first.index, 1);
    // Psalm 59 title mentions Saul sending men to watch David's house
    expect(verses.first.text.toLowerCase(), contains('saul'));
    verses.forEach(print);
  });

  /// 測試抓取啟示錄 2 章
  test('fetch Revelation chapter 2', () async {
    final index = BibleChapterNamedIndex(
      book: BibleBookEnum.Revelation,
      chapter: 2,
    );
    final verses = await service.fetchBookChapter(index: index);

    expect(verses, isNotEmpty);
    expect(verses.first.index, 1);
    // Revelation 2:1 mentions the angel of the church in Ephesus
    expect(verses.first.text.toLowerCase(), contains('ephesus'));
    verses.forEach(print);
  });
}
