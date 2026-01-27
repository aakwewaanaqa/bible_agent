import '../models/index.dart';

abstract interface class IBibleService {
  Future<List<Verse>> fetchBookChapter({
    required BibleChapterNamedIndex index,
  });
}
