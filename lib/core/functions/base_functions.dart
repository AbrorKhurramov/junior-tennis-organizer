import 'dart:io';
import 'package:junior_tennis_organizer/core/constants/constants.dart';
import 'package:intl/intl.dart';
import 'package:money_formatter/money_formatter.dart';

class BaseFunctions {
  BaseFunctions._();

  static bool noTestEnvironment = !Platform.environment.containsKey('FLUTTER_TEST');

  static String moneyFormatWithSymbol(double? sum, {String currency = "so'm", bool abs = true, String separator = ' '}) {
    var amount = MoneyFormatter(
      amount: abs ? (sum ?? 0.0).abs() : sum ?? 0.0,
      settings: MoneyFormatterSettings(
        thousandSeparator: separator,
        symbol: currency,
      ),
    ).output.symbolOnRight;
    return amount.replaceAll('.00', '');
  }

  static String moneyFormat(double? sum, {bool abs = true, String separator = ' '}) {
    var amount = MoneyFormatter(
      amount: abs ? (sum ?? 0.0).abs() : sum ?? 0.0,
      settings: MoneyFormatterSettings(
        thousandSeparator: separator,
      ),
    ).output.withoutFractionDigits;
    return amount.replaceAll('.00', '');
  }

  static String getImage(String? image) {
    return '${Constants.baseFileUrl}/$image';
  }

  static String getWithOutSeparator(String? text, {String separator = ' '}) {
    return text?.replaceAll(separator, '') ?? '';
  }

  static String getWithCountryCode(String? text, {String separator = '-', String countryCode = '+998'}) {
    return "$countryCode${getWithOutSeparator(text, separator: separator)}";
  }

  static String getWithOutPattern(String text, {String pattern = '+'}) {
    return text.replaceAll(pattern, '');
  }

  static String getCountryLocale(String text) {
    return text == "en" ? "US" : text.toUpperCase();
  }

  static String getDateFormat(DateTime date) {
    return DateFormat("dd.MM.yyyy").format(date);
  }

  static String getTimeFromSecond(int second) {
    return '${(second / 60).floor().toString().padLeft(2, '0')}'
        ':${(second % 60).floor().toString().padLeft(2, '0')}';
  }

  static String getTimeFormat(DateTime time) {
    return DateFormat("HH:mm").format(time);
  }

  static String localDateFormat(String? date) {
    if (date == null || date.isEmpty) {
      return '';
    }
    var dateValue = DateFormat("yyyy-MM-ddTHH:mm:ssZ").parseUTC(date);
    return DateFormat("yyyy.MM.dd").format(dateValue);
  }

  static String localDateTimeFormat(String? date) {
    if (date == null || date.isEmpty) {
      return '';
    }
    var dateValue = DateFormat("yyyy-MM-ddTHH:mm:ssZ").parseUTC(date);
    return DateFormat("yyyy.MM.dd HH:mm").format(dateValue);
  }

  static DateTime localDateTime(String? date) {
    if (date == null || date.isEmpty) {
      return DateTime.now().subtract(const Duration(days: 1));
    }
    return DateFormat("yyyy-MM-ddTHH:mm:ssZ").parseUTC(date).toLocal();
  }

  static DateTime parseDateFormat(String? date) {
    if (date == null) {
      return DateTime.now();
    }
    final dateTime = date.replaceAll("T00:00:00Z", "").split("-");
    return DateTime(
      int.parse(dateTime[0]),
      int.parse(dateTime[1]),
      int.parse(dateTime[2]),
    );
  }

  static DateTime parseTimeFormat(String? time) {
    final staticDate = DateTime.now();
    if (time == null) {
      return staticDate.subtract(const Duration(hours: 1));
    }
    final data = time.substring(0, 5);
    return DateTime(
        staticDate.year, staticDate.month, staticDate.day, int.parse(data.split(":").first), int.parse(data.split(":").last));
  }

  static bool isEmail(String mail) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(mail);
  }

  static int parseMoney(String text) {
    return int.parse(text.replaceAll(' ', ''));
  }
}
