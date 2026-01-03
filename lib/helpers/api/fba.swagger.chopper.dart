// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fba.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$Fba extends Fba {
  _$Fba([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = Fba;

  @override
  Future<Response<ChapterBody>> _apiTranslationBookChapterJsonGet({
    required String? translation,
    required String? book,
    required String? chapter,
  }) {
    final Uri $url = Uri.parse('/api/${translation}/${book}/${chapter}.json');
    final Request $request = Request('GET', $url, client.baseUrl);
    return client.send<ChapterBody, ChapterBody>($request);
  }
}
