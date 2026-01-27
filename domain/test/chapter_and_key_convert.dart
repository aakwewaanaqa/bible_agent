import 'index.dart';

void main() {
  test('BibleChapterNoNameIndex from chapter index', () {
    final result = BibleChapterNoNameIndex.fromNamedIndex(
      index: BibleChapterNamedIndex(book: BibleBookEnum.Exodus, chapter: 1),
    );
    expect(result.pureIndex, equals(51));
  });

  test('Round-trip BibleChapterIndex -> NoNameIndex -> BibleChapterIndex', () {
    final original =
        BibleChapterNamedIndex(book: BibleBookEnum.Romans, chapter: 5);
    final index = BibleChapterNoNameIndex.fromNamedIndex(index: original);
    final back = BibleChapterNamedIndex.fromNoNameIndex(data: index);
    expect(back.book, equals(original.book));
    expect(back.chapter, equals(original.chapter));
  });
}
