// ignore_for_file: constant_identifier_names, unused_field

enum BibleBookEnum {
  Genisis,
  Exodus,
  Leviticus,
  Numbers,
  Deuteronomy,
  Joshua,
  Judges,
  Ruth,
  _1Samuel,
  _2Samuel,
  _1Kings,
  _2Kings,
  _1Chronicles,
  _2Chronicles,
  Ezra,
  Nehemiah,
  Esther,
  Job,
  Psalm,
  Proverbs,
  Ecclesiastes,
  SongOfSongs,
  Isaiah,
  Jeremiah,
  Lamentations,
  Ezekiel,
  Daniel,
  Hosea,
  Joel,
  Amos,
  Obadiah,
  Jonah,
  Micah,
  Nahum,
  Habakkuk,
  Zephaniah,
  Haggai,
  Zechariah,
  Malachi,
  Matthew,
  Mark,
  Luke,
  John,
  Acts,
  Romans,
  _1Corinthians,
  _2Corinthians,
  Galatians,
  Ephesians,
  Philippians,
  Colossians,
  _1Thessalonians,
  _2Thessalonians,
  _1Timothy,
  _2Timothy,
  Titus,
  Philemon,
  Hebrews,
  James,
  _1Peter,
  _2Peter,
  _1John,
  _2John,
  _3John,
  Jude,
  Revelation,
}

/// 尋找聖經的書卷用的關鍵資料，包含縮寫與章節數
/// 不是 API 提供的，是以聖經紙本為參考
/// 硬編的
class BibleBookSearchKey {
  /// 章結數
  final int chapterCount;

  /// 書卷列舉
  final BibleBookEnum bookEnum;

  /// 英文書卷名稱
  final String english;

  /// 中文書卷名稱
  final String chinese;

  /// 書卷縮寫
  final List<String> acronyms;

  const BibleBookSearchKey({
    required this.chapterCount,
    required this.bookEnum,
    required this.english,
    required this.chinese,
    required this.acronyms,
  });

  String get displayString => '$chinese ($english) [${acronyms.join(', ')}]';

  static const keys = [
    BibleBookSearchKey(
      chapterCount: 50,
      bookEnum: BibleBookEnum.Genisis,
      english: 'Genisis',
      chinese: '創世記',
      acronyms: ['創', 'Gen'],
    ),
    BibleBookSearchKey(
      chapterCount: 40,
      bookEnum: BibleBookEnum.Exodus,
      english: 'Exodus',
      chinese: '出埃及記',
      acronyms: ['出', 'Exo', 'Exod'],
    ),
    BibleBookSearchKey(
      chapterCount: 27,
      bookEnum: BibleBookEnum.Leviticus,
      english: 'Leviticus',
      chinese: '利未記',
      acronyms: ['利', 'Lev'],
    ),
    BibleBookSearchKey(
      chapterCount: 36,
      bookEnum: BibleBookEnum.Numbers,
      english: 'Numbers',
      chinese: '民數記',
      acronyms: ['民', 'Num'],
    ),
    BibleBookSearchKey(
      chapterCount: 34,
      bookEnum: BibleBookEnum.Deuteronomy,
      english: 'Deuteronomy',
      chinese: '申命記',
      acronyms: ['申', 'Deut'],
    ),
    BibleBookSearchKey(
      chapterCount: 24,
      bookEnum: BibleBookEnum.Joshua,
      english: 'Joshua',
      chinese: '約書亞記',
      acronyms: ['書', 'Josh'],
    ),
    BibleBookSearchKey(
      chapterCount: 21,
      bookEnum: BibleBookEnum.Judges,
      english: 'Judges',
      chinese: '士師記',
      acronyms: ['士', 'Judg'],
    ),
    BibleBookSearchKey(
      chapterCount: 4,
      bookEnum: BibleBookEnum.Ruth,
      english: 'Ruth',
      chinese: '路得記',
      acronyms: ['得', 'Ruth'],
    ),
    BibleBookSearchKey(
      chapterCount: 31,
      bookEnum: BibleBookEnum._1Samuel,
      english: '1 Samuel',
      chinese: '撒母耳記上',
      acronyms: ['撒上', '1Sam'],
    ),
    BibleBookSearchKey(
      chapterCount: 24,
      bookEnum: BibleBookEnum._2Samuel,
      english: '2 Samuel',
      chinese: '撒母耳記下',
      acronyms: ['撒下', '2Sam'],
    ),
    BibleBookSearchKey(
      chapterCount: 22,
      bookEnum: BibleBookEnum._1Kings,
      english: '1 Kings',
      chinese: '列王紀上',
      acronyms: ['王上', '1Kgs'],
    ),
    BibleBookSearchKey(
      chapterCount: 25,
      bookEnum: BibleBookEnum._2Kings,
      english: '2 Kings',
      chinese: '列王紀下',
      acronyms: ['王下', '2Kgs'],
    ),
    BibleBookSearchKey(
      chapterCount: 29,
      bookEnum: BibleBookEnum._1Chronicles,
      english: '1 Chronicles',
      chinese: '歷代志上',
      acronyms: ['代上', '1Chron'],
    ),
    BibleBookSearchKey(
      chapterCount: 36,
      bookEnum: BibleBookEnum._2Chronicles,
      english: '2 Chronicles',
      chinese: '歷代志下',
      acronyms: ['代下', '2Chron'],
    ),
    BibleBookSearchKey(
      chapterCount: 10,
      bookEnum: BibleBookEnum.Ezra,
      english: 'Ezra',
      chinese: '以斯拉記',
      acronyms: ['拉', 'Ezra'],
    ),
    BibleBookSearchKey(
      chapterCount: 13,
      bookEnum: BibleBookEnum.Nehemiah,
      english: 'Nehemiah',
      chinese: '尼希米記',
      acronyms: ['尼', 'Neh'],
    ),
    BibleBookSearchKey(
      chapterCount: 10,
      bookEnum: BibleBookEnum.Esther,
      english: 'Esther',
      chinese: '以斯貼記',
      acronyms: ['斯', 'Est'],
    ),
    BibleBookSearchKey(
      chapterCount: 42,
      bookEnum: BibleBookEnum.Job,
      english: 'Job',
      chinese: '約伯記',
      acronyms: ['伯', 'Job'],
    ),
    BibleBookSearchKey(
      chapterCount: 150,
      bookEnum: BibleBookEnum.Psalm,
      english: 'Psalm',
      chinese: '詩篇',
      acronyms: ['詩', 'Ps'],
    ),
    BibleBookSearchKey(
      chapterCount: 31,
      bookEnum: BibleBookEnum.Proverbs,
      english: 'Proverbs',
      chinese: '箴言',
      acronyms: ['箴', 'Prov'],
    ),
    BibleBookSearchKey(
      chapterCount: 12,
      bookEnum: BibleBookEnum.Ecclesiastes,
      english: 'Ecclesiastes',
      chinese: '傳道書',
      acronyms: ['傳', 'Eccl'],
    ),
    BibleBookSearchKey(
      chapterCount: 8,
      bookEnum: BibleBookEnum.SongOfSongs,
      english: 'Song of Songs',
      chinese: '雅歌',
      acronyms: ['歌', 'Song'],
    ),
    BibleBookSearchKey(
      chapterCount: 66,
      bookEnum: BibleBookEnum.Isaiah,
      english: 'Isaiah',
      chinese: '以賽亞書',
      acronyms: ['賽', 'Isa'],
    ),
    BibleBookSearchKey(
      chapterCount: 52,
      bookEnum: BibleBookEnum.Jeremiah,
      english: 'Jeremiah',
      chinese: '耶利米書',
      acronyms: ['耶', 'Jer'],
    ),
    BibleBookSearchKey(
      chapterCount: 5,
      bookEnum: BibleBookEnum.Lamentations,
      english: 'Lamentations',
      chinese: '耶利米哀歌',
      acronyms: ['哀', 'Lam'],
    ),
    BibleBookSearchKey(
      chapterCount: 48,
      bookEnum: BibleBookEnum.Ezekiel,
      english: 'Ezekiel',
      chinese: '以西結書',
      acronyms: ['結', 'Ezek'],
    ),
    BibleBookSearchKey(
      chapterCount: 12,
      bookEnum: BibleBookEnum.Daniel,
      english: 'Daniel',
      chinese: '但以理書',
      acronyms: ['但', 'Dan'],
    ),
    BibleBookSearchKey(
      chapterCount: 14,
      bookEnum: BibleBookEnum.Hosea,
      english: 'Hosea',
      chinese: '何西阿書',
      acronyms: ['何', 'Hos'],
    ),
    BibleBookSearchKey(
      chapterCount: 3,
      bookEnum: BibleBookEnum.Joel,
      english: 'Joel',
      chinese: '約珥書',
      acronyms: ['珥', 'Joel'],
    ),
    BibleBookSearchKey(
      chapterCount: 9,
      bookEnum: BibleBookEnum.Amos,
      english: 'Amos',
      chinese: '阿摩司書',
      acronyms: ['摩', 'Amos'],
    ),
    BibleBookSearchKey(
      chapterCount: 1,
      bookEnum: BibleBookEnum.Obadiah,
      english: 'Obadiah',
      chinese: '俄巴底亞書',
      acronyms: ['俄', 'Obad'],
    ),
    BibleBookSearchKey(
      chapterCount: 4,
      bookEnum: BibleBookEnum.Jonah,
      english: 'Jonah',
      chinese: '約拿書',
      acronyms: ['拿', 'Jonah'],
    ),
    BibleBookSearchKey(
      chapterCount: 7,
      bookEnum: BibleBookEnum.Micah,
      english: 'Micah',
      chinese: '彌迦書',
      acronyms: ['彌', 'Mic'],
    ),
    BibleBookSearchKey(
      chapterCount: 3,
      bookEnum: BibleBookEnum.Nahum,
      english: 'Nahum',
      chinese: '那鴻書',
      acronyms: ['鴻', 'Nah'],
    ),
    BibleBookSearchKey(
      chapterCount: 3,
      bookEnum: BibleBookEnum.Habakkuk,
      english: 'Habakkuk',
      chinese: '哈巴谷書',
      acronyms: ['哈', 'Hab'],
    ),
    BibleBookSearchKey(
      chapterCount: 3,
      bookEnum: BibleBookEnum.Zephaniah,
      english: 'Zephaniah',
      chinese: '西番雅書',
      acronyms: ['番', 'Zeph'],
    ),
    BibleBookSearchKey(
      chapterCount: 2,
      bookEnum: BibleBookEnum.Haggai,
      english: 'Haggai',
      chinese: '哈該書',
      acronyms: ['該', 'Hag'],
    ),
    BibleBookSearchKey(
      chapterCount: 14,
      bookEnum: BibleBookEnum.Zechariah,
      english: 'Zechariah',
      chinese: '撒迦利亞書',
      acronyms: ['亞', 'Zech'],
    ),
    BibleBookSearchKey(
      chapterCount: 4,
      bookEnum: BibleBookEnum.Malachi,
      english: 'Malachi',
      chinese: '瑪拉基書',
      acronyms: ['瑪', 'Mal'],
    ),
    BibleBookSearchKey(
      chapterCount: 28,
      bookEnum: BibleBookEnum.Matthew,
      english: 'Matthew',
      chinese: '馬太福音',
      acronyms: ['太', 'Matt'],
    ),
    BibleBookSearchKey(
      chapterCount: 16,
      bookEnum: BibleBookEnum.Mark,
      english: 'Mark',
      chinese: '馬可福音',
      acronyms: ['可', 'Mark'],
    ),
    BibleBookSearchKey(
      chapterCount: 24,
      bookEnum: BibleBookEnum.Luke,
      english: 'Luke',
      chinese: '路加福音',
      acronyms: ['路', 'Luke'],
    ),
    BibleBookSearchKey(
      chapterCount: 21,
      bookEnum: BibleBookEnum.John,
      english: 'John',
      chinese: '約翰福音',
      acronyms: ['約', 'John'],
    ),
    BibleBookSearchKey(
      chapterCount: 28,
      bookEnum: BibleBookEnum.Acts,
      english: 'Acts',
      chinese: '使徒行傳',
      acronyms: ['徒', 'Acts'],
    ),
    BibleBookSearchKey(
      chapterCount: 16,
      bookEnum: BibleBookEnum.Romans,
      english: 'Romans',
      chinese: '羅馬書',
      acronyms: ['羅', 'Rom'],
    ),
    BibleBookSearchKey(
      chapterCount: 16,
      bookEnum: BibleBookEnum._1Corinthians,
      english: '1 Corinthians',
      chinese: '哥林多前書',
      acronyms: ['林前', '1Cor'],
    ),
    BibleBookSearchKey(
      chapterCount: 13,
      bookEnum: BibleBookEnum._2Corinthians,
      english: '2 Corinthians',
      chinese: '哥林多後書',
      acronyms: ['林後', '2Cor'],
    ),
    BibleBookSearchKey(
      chapterCount: 6,
      bookEnum: BibleBookEnum.Galatians,
      english: 'Galatians',
      chinese: '加拉太書',
      acronyms: ['加', 'Gal'],
    ),
    BibleBookSearchKey(
      chapterCount: 6,
      bookEnum: BibleBookEnum.Ephesians,
      english: 'Ephesians',
      chinese: '以弗所書',
      acronyms: ['弗', 'Eph'],
    ),
    BibleBookSearchKey(
      chapterCount: 4,
      bookEnum: BibleBookEnum.Philippians,
      english: 'Philippians',
      chinese: '腓立比書',
      acronyms: ['腓', 'Phil'],
    ),
    BibleBookSearchKey(
      chapterCount: 4,
      bookEnum: BibleBookEnum.Colossians,
      english: 'Colossians',
      chinese: '歌羅西書',
      acronyms: ['西', 'Col'],
    ),
    BibleBookSearchKey(
      chapterCount: 5,
      bookEnum: BibleBookEnum._1Thessalonians,
      english: '1 Thessalonians',
      chinese: '帖撒羅尼迦前書',
      acronyms: ['帖前', '1Thess'],
    ),
    BibleBookSearchKey(
      chapterCount: 3,
      bookEnum: BibleBookEnum._2Thessalonians,
      english: '2 Thessalonians',
      chinese: '帖撒羅尼迦後書',
      acronyms: ['帖後', '2Thess'],
    ),
    BibleBookSearchKey(
      chapterCount: 6,
      bookEnum: BibleBookEnum._1Timothy,
      english: '1 Timothy',
      chinese: '提摩太前書',
      acronyms: ['提前', '1Tim'],
    ),
    BibleBookSearchKey(
      chapterCount: 4,
      bookEnum: BibleBookEnum._2Timothy,
      english: '2 Timothy',
      chinese: '提摩太後書',
      acronyms: ['提後', '2Tim'],
    ),
    BibleBookSearchKey(
      chapterCount: 3,
      bookEnum: BibleBookEnum.Titus,
      english: 'Titus',
      chinese: '提多書',
      acronyms: ['多', 'Titus'],
    ),
    BibleBookSearchKey(
      chapterCount: 1,
      bookEnum: BibleBookEnum.Philemon,
      english: 'Philemon',
      chinese: '腓利門書',
      acronyms: ['門', 'Philem'],
    ),
    BibleBookSearchKey(
      chapterCount: 13,
      bookEnum: BibleBookEnum.Hebrews,
      english: 'Hebrews',
      chinese: '希伯來書',
      acronyms: ['來', 'Heb'],
    ),
    BibleBookSearchKey(
      chapterCount: 5,
      bookEnum: BibleBookEnum.James,
      english: 'James',
      chinese: '雅各書',
      acronyms: ['雅', 'James'],
    ),
    BibleBookSearchKey(
      chapterCount: 5,
      bookEnum: BibleBookEnum._1Peter,
      english: '1 Peter',
      chinese: '彼得前書',
      acronyms: ['彼前', '1Pet'],
    ),
    BibleBookSearchKey(
      chapterCount: 3,
      bookEnum: BibleBookEnum._2Peter,
      english: '2 Peter',
      chinese: '彼得後書',
      acronyms: ['彼後', '2Pet'],
    ),
    BibleBookSearchKey(
      chapterCount: 5,
      bookEnum: BibleBookEnum._1John,
      english: '1 John',
      chinese: '約翰一書',
      acronyms: ['約一', '1John'],
    ),
    BibleBookSearchKey(
      chapterCount: 1,
      bookEnum: BibleBookEnum._2John,
      english: '2 John',
      chinese: '約翰二書',
      acronyms: ['約二', '2John'],
    ),
    BibleBookSearchKey(
      chapterCount: 1,
      bookEnum: BibleBookEnum._3John,
      english: '3 John',
      chinese: '約翰三書',
      acronyms: ['約三', '3John'],
    ),
    BibleBookSearchKey(
      chapterCount: 1,
      bookEnum: BibleBookEnum.Jude,
      english: 'Jude',
      chinese: '猶大書',
      acronyms: ['猶', 'Jude'],
    ),
    BibleBookSearchKey(
      chapterCount: 22,
      bookEnum: BibleBookEnum.Revelation,
      english: 'Revelation',
      chinese: '啟示錄',
      acronyms: ['啟', 'Rev'],
    ),
  ];
}

class BibleChapterNamedIndex {
  BibleBookEnum book;
  int chapter;

  BibleChapterNamedIndex({required this.book, required this.chapter});

  factory BibleChapterNamedIndex.fromNoNameIndex({
    required BibleChapterNoNameIndex data,
  }) {
    int remaining = data.pureIndex;
    for (final key in BibleBookSearchKey.keys) {
      if (remaining <= key.chapterCount) {
        return BibleChapterNamedIndex(book: key.bookEnum, chapter: remaining);
      } else {
        remaining -= key.chapterCount;
      }
    }
    throw Exception('Invalid pure index: ${data.pureIndex}');
  }
}

class BibleChapterNoNameIndex {
  /// 這是從創世紀一直排到啟示錄的總章節索引，從1開始
  int pureIndex;

  BibleChapterNoNameIndex({required this.pureIndex});

  factory BibleChapterNoNameIndex.fromNamedIndex({
    required BibleChapterNamedIndex index,
  }) {
    int i = 0;
    for (final key in BibleBookSearchKey.keys) {
      if (key.bookEnum == index.book) {
        i += index.chapter;
        break;
      } else {
        i += key.chapterCount;
      }
    }
    return BibleChapterNoNameIndex(pureIndex: i);
  }
}
