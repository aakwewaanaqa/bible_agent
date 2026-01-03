// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fba.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChapterBody _$ChapterBodyFromJson(Map<String, dynamic> json) => ChapterBody(
  translation: json['translation'] == null
      ? null
      : Translation.fromJson(json['translation'] as Map<String, dynamic>),
  book: json['book'] == null
      ? null
      : Book.fromJson(json['book'] as Map<String, dynamic>),
  chapter: json['chapter'] == null
      ? null
      : Chapter.fromJson(json['chapter'] as Map<String, dynamic>),
  numberOfVerses: (json['numberOfVerses'] as num?)?.toInt(),
);

Map<String, dynamic> _$ChapterBodyToJson(ChapterBody instance) =>
    <String, dynamic>{
      'translation': instance.translation?.toJson(),
      'book': instance.book?.toJson(),
      'chapter': instance.chapter?.toJson(),
      'numberOfVerses': instance.numberOfVerses,
    };

Translation _$TranslationFromJson(Map<String, dynamic> json) => Translation(
  id: json['id'] as String?,
  name: json['name'] as String?,
  numberOfBooks: (json['numberOfBooks'] as num?)?.toInt(),
  languageName: json['languageName'] as String?,
);

Map<String, dynamic> _$TranslationToJson(Translation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'numberOfBooks': instance.numberOfBooks,
      'languageName': instance.languageName,
    };

Book _$BookFromJson(Map<String, dynamic> json) => Book(
  id: json['id'] as String?,
  name: json['name'] as String?,
  numberOfChapters: (json['numberOfChapters'] as num?)?.toInt(),
);

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'numberOfChapters': instance.numberOfChapters,
};

Chapter _$ChapterFromJson(Map<String, dynamic> json) => Chapter(
  number: (json['number'] as num?)?.toInt(),
  content:
      (json['content'] as List<dynamic>?)?.map((e) => e as Object).toList() ??
      [],
);

Map<String, dynamic> _$ChapterToJson(Chapter instance) => <String, dynamic>{
  'number': instance.number,
  'content': instance.content,
};

Verse _$VerseFromJson(Map<String, dynamic> json) => Verse(
  type: json['type'] as String?,
  number: (json['number'] as num?)?.toInt(),
  content:
      (json['content'] as List<dynamic>?)?.map((e) => e as Object).toList() ??
      [],
);

Map<String, dynamic> _$VerseToJson(Verse instance) => <String, dynamic>{
  'type': instance.type,
  'number': instance.number,
  'content': instance.content,
};

Poem _$PoemFromJson(Map<String, dynamic> json) =>
    Poem(text: json['text'] as String?, poem: (json['poem'] as num?)?.toInt());

Map<String, dynamic> _$PoemToJson(Poem instance) => <String, dynamic>{
  'text': instance.text,
  'poem': instance.poem,
};

LineBreak _$LineBreakFromJson(Map<String, dynamic> json) =>
    LineBreak(lineBreak: json['lineBreak'] as bool?);

Map<String, dynamic> _$LineBreakToJson(LineBreak instance) => <String, dynamic>{
  'lineBreak': instance.lineBreak,
};

Heading _$HeadingFromJson(Map<String, dynamic> json) =>
    Heading(type: json['type'] as String?, content: json['content'] as String?);

Map<String, dynamic> _$HeadingToJson(Heading instance) => <String, dynamic>{
  'type': instance.type,
  'content': instance.content,
};
