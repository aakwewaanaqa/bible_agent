class Verse {
  final int index;
  final String text;

  Verse({
    required this.index,
    required this.text,
  });

  @override
  String toString() {
    return '$index. $text';
  }
}
