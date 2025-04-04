import 'package:intl/intl.dart';

String formatDateTime(
  DateTime dateTime, {
  String format = 'dd MMM yyyy',
  String? locale = 'vi_VN',
}) {
  final formatter = DateFormat(format, locale);
  return formatter.format(dateTime);
}

DateTime parseDateString(
  String dateString, {
  String format = 'dd/MM/yyyy',
  String? locale = 'vi_VN',
}) {
  final formatter = DateFormat(format, locale);
  return formatter.parse(dateString);
}
