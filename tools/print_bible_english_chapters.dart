import 'package:bible_agent/models/bible.dart';

void main() {
  BibleBookKey.keys
      .map((k) {
        var eng = k.english.replaceAll(' ', '');
        if (int.tryParse(eng[0]) != null) {
          eng = '_$eng';
        }
        return eng;
      })
      .forEach(print);
}
