extension StringExtension on String {
  String get toCostFirst => '${this[0]}${this[1]}${this[2]}';
  String get toCostLast => '${this[4]}0';
}
