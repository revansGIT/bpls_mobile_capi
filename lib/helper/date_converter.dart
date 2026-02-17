import 'package:intl/intl.dart';

class DateConverter {
  static String formatDate(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd hh:mm:ss', 'en_US').format(dateTime);
  }

  static String estimatedDate(String dateTime) {
    return DateFormat('dd MMM yyyy', 'en_US').format(DateFormat("yyyy-MM-ddTHH:mm:ss.SSS", 'en_US').parse(dateTime));
  }

  static String estimatedDateTime(String dateTime, {bool isUtc = false}) {
    final utcTime = DateFormat("yyyy-MM-dd HH:mm:ss", 'en_US').parseUtc(dateTime);
    final bdTime = utcTime.add(Duration(hours: 6));
    return DateFormat('dd MMM yyyy hh:mm a', 'en_US').format(isUtc ? utcTime : bdTime);
  }

  static String estimatedTime(String dateTime) {
    DateTime utcTime;
    try {
      utcTime = DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'", 'en_US').parseUtc(dateTime);
    } catch (e) {
      utcTime = DateFormat("yyyy-MM-dd HH:mm:ss.SSSSSS", 'en_US').parseUtc(dateTime);
    }
    final bdTime = utcTime.add(Duration(hours: 6));
    return DateFormat('hh:mm a', 'en_US').format(bdTime);
  }

  static DateTime convertStringToDatetime(String dateTime) {
    return DateFormat("yyyy-MM-ddTHH:mm:ss.SSS", 'en_US').parse(dateTime);
  }

  static DateTime isoStringToLocalDate(String dateTime) {
    return DateFormat('yyyy-MM-ddTHH:mm:ss.SSS', 'en_US').parse(dateTime, true).toLocal();
  }

  static DateTime isoStringToLocalTime(String dateTime) {
    return DateFormat('hh:mm:ss', 'en_US').parse(dateTime);
  }

  static String isoStringToLocalTimeOnly(String dateTime) {
    return DateFormat('hh:mm:ss', 'en_US').format(isoStringToLocalDate(dateTime));
  }

  static String isoStringToLocalAMPM(String dateTime) {
    return DateFormat('hh:mm', 'en_US').format(isoStringToLocalDate(dateTime));
  }

  static String isoStringToLocalDateOnly(String dateTime) {
    return DateFormat('dd/MM/yyyy', 'en_US').format(isoStringToLocalDate(dateTime));
  }

  static String isoStringToLocalDate2Only(String dateTime) {
    return DateFormat('dd MM yyyy', 'en_US').format(isoStringToLocalDate(dateTime));
  }

  static String localDateToIsoString(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy HH:mm a', 'en_US').format(dateTime.toUtc());
  }

  static String localDateToString(String dateTime) {
    return DateFormat('dd/MM/yyyy HH:mm a', 'en_US').format(DateFormat("yyyy-MM-ddTHH:mm:ss.SSS", 'en_US').parse(dateTime));
  }

  static String convertTimeToTime(String time) {
    return DateFormat('hh:mm a', 'en_US').format(DateFormat('hh:mm:ss', 'en_US').parse(time));
  }
}
