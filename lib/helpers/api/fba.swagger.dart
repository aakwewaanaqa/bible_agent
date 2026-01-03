// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:json_annotation/json_annotation.dart' as json;
import 'package:collection/collection.dart';
import 'dart:convert';

import 'package:chopper/chopper.dart';

import 'client_mapping.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' show MultipartFile;
import 'package:chopper/chopper.dart' as chopper;

part 'fba.swagger.chopper.dart';
part 'fba.swagger.g.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class Fba extends ChopperService {
  static Fba create({
    ChopperClient? client,
    http.Client? httpClient,
    Authenticator? authenticator,
    ErrorConverter? errorConverter,
    Converter? converter,
    Uri? baseUrl,
    List<Interceptor>? interceptors,
  }) {
    if (client != null) {
      return _$Fba(client);
    }

    final newClient = ChopperClient(
      services: [_$Fba()],
      converter: converter ?? $JsonSerializableConverter(),
      interceptors: interceptors ?? [],
      client: httpClient,
      authenticator: authenticator,
      errorConverter: errorConverter,
      baseUrl: baseUrl ?? Uri.parse('http://'),
    );
    return _$Fba(newClient);
  }

  ///Get a specific chapter of a Bible translation
  ///@param translation The translation ID (e.g., 'cmn_cuv')
  ///@param book The book ID (e.g., 'GEN')
  ///@param chapter The chapter number
  Future<chopper.Response<ChapterBody>> apiTranslationBookChapterJsonGet({
    required String? translation,
    required String? book,
    required String? chapter,
  }) {
    generatedMapping.putIfAbsent(
      ChapterBody,
      () => ChapterBody.fromJsonFactory,
    );

    return _apiTranslationBookChapterJsonGet(
      translation: translation,
      book: book,
      chapter: chapter,
    );
  }

  ///Get a specific chapter of a Bible translation
  ///@param translation The translation ID (e.g., 'cmn_cuv')
  ///@param book The book ID (e.g., 'GEN')
  ///@param chapter The chapter number
  @GET(path: '/api/{translation}/{book}/{chapter}.json')
  Future<chopper.Response<ChapterBody>> _apiTranslationBookChapterJsonGet({
    @Path('translation') required String? translation,
    @Path('book') required String? book,
    @Path('chapter') required String? chapter,
  });
}

@JsonSerializable(explicitToJson: true)
class ChapterBody {
  const ChapterBody({
    this.translation,
    this.book,
    this.chapter,
    this.numberOfVerses,
  });

  factory ChapterBody.fromJson(Map<String, dynamic> json) =>
      _$ChapterBodyFromJson(json);

  static const toJsonFactory = _$ChapterBodyToJson;
  Map<String, dynamic> toJson() => _$ChapterBodyToJson(this);

  @JsonKey(name: 'translation')
  final Translation? translation;
  @JsonKey(name: 'book')
  final Book? book;
  @JsonKey(name: 'chapter')
  final Chapter? chapter;
  @JsonKey(name: 'numberOfVerses')
  final int? numberOfVerses;
  static const fromJsonFactory = _$ChapterBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ChapterBody &&
            (identical(other.translation, translation) ||
                const DeepCollectionEquality().equals(
                  other.translation,
                  translation,
                )) &&
            (identical(other.book, book) ||
                const DeepCollectionEquality().equals(other.book, book)) &&
            (identical(other.chapter, chapter) ||
                const DeepCollectionEquality().equals(
                  other.chapter,
                  chapter,
                )) &&
            (identical(other.numberOfVerses, numberOfVerses) ||
                const DeepCollectionEquality().equals(
                  other.numberOfVerses,
                  numberOfVerses,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(translation) ^
      const DeepCollectionEquality().hash(book) ^
      const DeepCollectionEquality().hash(chapter) ^
      const DeepCollectionEquality().hash(numberOfVerses) ^
      runtimeType.hashCode;
}

extension $ChapterBodyExtension on ChapterBody {
  ChapterBody copyWith({
    Translation? translation,
    Book? book,
    Chapter? chapter,
    int? numberOfVerses,
  }) {
    return ChapterBody(
      translation: translation ?? this.translation,
      book: book ?? this.book,
      chapter: chapter ?? this.chapter,
      numberOfVerses: numberOfVerses ?? this.numberOfVerses,
    );
  }

  ChapterBody copyWithWrapped({
    Wrapped<Translation?>? translation,
    Wrapped<Book?>? book,
    Wrapped<Chapter?>? chapter,
    Wrapped<int?>? numberOfVerses,
  }) {
    return ChapterBody(
      translation: (translation != null ? translation.value : this.translation),
      book: (book != null ? book.value : this.book),
      chapter: (chapter != null ? chapter.value : this.chapter),
      numberOfVerses: (numberOfVerses != null
          ? numberOfVerses.value
          : this.numberOfVerses),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Translation {
  const Translation({
    this.id,
    this.name,
    this.numberOfBooks,
    this.languageName,
  });

  factory Translation.fromJson(Map<String, dynamic> json) =>
      _$TranslationFromJson(json);

  static const toJsonFactory = _$TranslationToJson;
  Map<String, dynamic> toJson() => _$TranslationToJson(this);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'numberOfBooks')
  final int? numberOfBooks;
  @JsonKey(name: 'languageName')
  final String? languageName;
  static const fromJsonFactory = _$TranslationFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Translation &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.numberOfBooks, numberOfBooks) ||
                const DeepCollectionEquality().equals(
                  other.numberOfBooks,
                  numberOfBooks,
                )) &&
            (identical(other.languageName, languageName) ||
                const DeepCollectionEquality().equals(
                  other.languageName,
                  languageName,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(numberOfBooks) ^
      const DeepCollectionEquality().hash(languageName) ^
      runtimeType.hashCode;
}

extension $TranslationExtension on Translation {
  Translation copyWith({
    String? id,
    String? name,
    int? numberOfBooks,
    String? languageName,
  }) {
    return Translation(
      id: id ?? this.id,
      name: name ?? this.name,
      numberOfBooks: numberOfBooks ?? this.numberOfBooks,
      languageName: languageName ?? this.languageName,
    );
  }

  Translation copyWithWrapped({
    Wrapped<String?>? id,
    Wrapped<String?>? name,
    Wrapped<int?>? numberOfBooks,
    Wrapped<String?>? languageName,
  }) {
    return Translation(
      id: (id != null ? id.value : this.id),
      name: (name != null ? name.value : this.name),
      numberOfBooks: (numberOfBooks != null
          ? numberOfBooks.value
          : this.numberOfBooks),
      languageName: (languageName != null
          ? languageName.value
          : this.languageName),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Book {
  const Book({this.id, this.name, this.numberOfChapters});

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  static const toJsonFactory = _$BookToJson;
  Map<String, dynamic> toJson() => _$BookToJson(this);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'numberOfChapters')
  final int? numberOfChapters;
  static const fromJsonFactory = _$BookFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Book &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.numberOfChapters, numberOfChapters) ||
                const DeepCollectionEquality().equals(
                  other.numberOfChapters,
                  numberOfChapters,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(numberOfChapters) ^
      runtimeType.hashCode;
}

extension $BookExtension on Book {
  Book copyWith({String? id, String? name, int? numberOfChapters}) {
    return Book(
      id: id ?? this.id,
      name: name ?? this.name,
      numberOfChapters: numberOfChapters ?? this.numberOfChapters,
    );
  }

  Book copyWithWrapped({
    Wrapped<String?>? id,
    Wrapped<String?>? name,
    Wrapped<int?>? numberOfChapters,
  }) {
    return Book(
      id: (id != null ? id.value : this.id),
      name: (name != null ? name.value : this.name),
      numberOfChapters: (numberOfChapters != null
          ? numberOfChapters.value
          : this.numberOfChapters),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Chapter {
  const Chapter({this.number, this.content});

  factory Chapter.fromJson(Map<String, dynamic> json) =>
      _$ChapterFromJson(json);

  static const toJsonFactory = _$ChapterToJson;
  Map<String, dynamic> toJson() => _$ChapterToJson(this);

  @JsonKey(name: 'number')
  final int? number;
  @JsonKey(name: 'content', defaultValue: <Object>[])
  final List<Object>? content;
  static const fromJsonFactory = _$ChapterFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Chapter &&
            (identical(other.number, number) ||
                const DeepCollectionEquality().equals(other.number, number)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality().equals(other.content, content)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(number) ^
      const DeepCollectionEquality().hash(content) ^
      runtimeType.hashCode;
}

extension $ChapterExtension on Chapter {
  Chapter copyWith({int? number, List<Object>? content}) {
    return Chapter(
      number: number ?? this.number,
      content: content ?? this.content,
    );
  }

  Chapter copyWithWrapped({
    Wrapped<int?>? number,
    Wrapped<List<Object>?>? content,
  }) {
    return Chapter(
      number: (number != null ? number.value : this.number),
      content: (content != null ? content.value : this.content),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Verse {
  const Verse({this.type, this.number, this.content});

  factory Verse.fromJson(Map<String, dynamic> json) => _$VerseFromJson(json);

  static const toJsonFactory = _$VerseToJson;
  Map<String, dynamic> toJson() => _$VerseToJson(this);

  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: 'number')
  final int? number;
  @JsonKey(name: 'content', defaultValue: <Object>[])
  final List<Object>? content;
  static const fromJsonFactory = _$VerseFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Verse &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.number, number) ||
                const DeepCollectionEquality().equals(other.number, number)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality().equals(other.content, content)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(number) ^
      const DeepCollectionEquality().hash(content) ^
      runtimeType.hashCode;
}

extension $VerseExtension on Verse {
  Verse copyWith({String? type, int? number, List<Object>? content}) {
    return Verse(
      type: type ?? this.type,
      number: number ?? this.number,
      content: content ?? this.content,
    );
  }

  Verse copyWithWrapped({
    Wrapped<String?>? type,
    Wrapped<int?>? number,
    Wrapped<List<Object>?>? content,
  }) {
    return Verse(
      type: (type != null ? type.value : this.type),
      number: (number != null ? number.value : this.number),
      content: (content != null ? content.value : this.content),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Poem {
  const Poem({this.text, this.poem});

  factory Poem.fromJson(Map<String, dynamic> json) => _$PoemFromJson(json);

  static const toJsonFactory = _$PoemToJson;
  Map<String, dynamic> toJson() => _$PoemToJson(this);

  @JsonKey(name: 'text')
  final String? text;
  @JsonKey(name: 'poem')
  final int? poem;
  static const fromJsonFactory = _$PoemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Poem &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)) &&
            (identical(other.poem, poem) ||
                const DeepCollectionEquality().equals(other.poem, poem)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(text) ^
      const DeepCollectionEquality().hash(poem) ^
      runtimeType.hashCode;
}

extension $PoemExtension on Poem {
  Poem copyWith({String? text, int? poem}) {
    return Poem(text: text ?? this.text, poem: poem ?? this.poem);
  }

  Poem copyWithWrapped({Wrapped<String?>? text, Wrapped<int?>? poem}) {
    return Poem(
      text: (text != null ? text.value : this.text),
      poem: (poem != null ? poem.value : this.poem),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class LineBreak {
  const LineBreak({this.lineBreak});

  factory LineBreak.fromJson(Map<String, dynamic> json) =>
      _$LineBreakFromJson(json);

  static const toJsonFactory = _$LineBreakToJson;
  Map<String, dynamic> toJson() => _$LineBreakToJson(this);

  @JsonKey(name: 'lineBreak')
  final bool? lineBreak;
  static const fromJsonFactory = _$LineBreakFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is LineBreak &&
            (identical(other.lineBreak, lineBreak) ||
                const DeepCollectionEquality().equals(
                  other.lineBreak,
                  lineBreak,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(lineBreak) ^ runtimeType.hashCode;
}

extension $LineBreakExtension on LineBreak {
  LineBreak copyWith({bool? lineBreak}) {
    return LineBreak(lineBreak: lineBreak ?? this.lineBreak);
  }

  LineBreak copyWithWrapped({Wrapped<bool?>? lineBreak}) {
    return LineBreak(
      lineBreak: (lineBreak != null ? lineBreak.value : this.lineBreak),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Heading {
  const Heading({this.type, this.content});

  factory Heading.fromJson(Map<String, dynamic> json) =>
      _$HeadingFromJson(json);

  static const toJsonFactory = _$HeadingToJson;
  Map<String, dynamic> toJson() => _$HeadingToJson(this);

  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: 'content')
  final String? content;
  static const fromJsonFactory = _$HeadingFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Heading &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality().equals(other.content, content)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(content) ^
      runtimeType.hashCode;
}

extension $HeadingExtension on Heading {
  Heading copyWith({String? type, String? content}) {
    return Heading(type: type ?? this.type, content: content ?? this.content);
  }

  Heading copyWithWrapped({Wrapped<String?>? type, Wrapped<String?>? content}) {
    return Heading(
      type: (type != null ? type.value : this.type),
      content: (content != null ? content.value : this.content),
    );
  }
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  FutureOr<chopper.Response<ResultType>> convertResponse<ResultType, Item>(
    chopper.Response response,
  ) async {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    if (ResultType == String) {
      return response.copyWith();
    }

    if (ResultType == DateTime) {
      return response.copyWith(
        body:
            DateTime.parse((response.body as String).replaceAll('"', ''))
                as ResultType,
      );
    }

    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
      body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType,
    );
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}
