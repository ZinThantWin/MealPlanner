import 'package:intl/intl.dart';

final class AppHelper {
  static String formatDate(DateTime date) {
    return DateFormat('EEE').format(date);
  }

  static String normalizeDateKey(String date, String day) {
    final DateTime temp = DateTime.parse(date);
    final normalizedDate = DateTime(temp.year, temp.month, temp.day);
    return normalizedDate.toIso8601String() + day;
  }
}
