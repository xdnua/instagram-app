class RegexConstants {
  static RegExp email = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  static RegExp digitsOnly = RegExp(r'^[0-9]*$');

  RegexConstants._();
}
