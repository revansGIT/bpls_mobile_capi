import 'package:flutter/material.dart';

import 'app.localization.dart';

class StringUtils {
  final BuildContext context;

  StringUtils(this.context);

  static StringUtils of(BuildContext context) {
    return StringUtils(context);
  }

  static bool isEmpty(String? s) => s == null || s.trim().isEmpty;
  static bool isNotEmpty(String? s) => !isEmpty(s);

  static bool isEmail(String? value) {
    if (isEmpty(value)) return false;
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value!);
  }

  dynamic hasUpperCase(String value, {bool returnBool = false}) {
    const String hasUpperCasePattern = r'^(?=.*[A-Z])+';
    final RegExp hasUpperCaseRegex = RegExp(hasUpperCasePattern);
    if (hasUpperCaseRegex.hasMatch(value)) {
      return returnBool ? true : null;
    }
    return returnBool ? false : "should contain at least one upper case";
  }

  dynamic hasLowerCase(String value, {bool returnBool = false}) {
    const String hasLowerCasePattern = r'^(?=.*[a-z])+';
    final RegExp hasLowerCaseRegex = RegExp(hasLowerCasePattern);
    if (hasLowerCaseRegex.hasMatch(value)) {
      return returnBool ? true : null;
    }
    return returnBool ? false : "should contain at least one lower case";
  }

  dynamic hasDigitCase(String value, {bool returnBool = false}) {
    const String hasDigitCasePattern = r'^(?=.*\d)+';
    final RegExp hasDigitCaseRegex = RegExp(hasDigitCasePattern);
    if (hasDigitCaseRegex.hasMatch(value)) {
      return returnBool ? true : null;
    }
    return returnBool ? false : "should contain at least one digit";
  }

  dynamic hasSpecialCharacterCase(String value, {bool returnBool = false}) {
    const String hasDigitCasePattern = r'^(?=.*?[!@#\$&*~])+';
    final RegExp hasDigitCaseRegex = RegExp(hasDigitCasePattern);
    if (hasDigitCaseRegex.hasMatch(value)) {
      return returnBool ? true : null;
    }
    return returnBool ? false : "should contain at least one Special character";
  }

  dynamic hasTheRightLengthCase(
    String? value,
    int theRightLength, {
    bool returnBool = false,
  }) {
    if (value == null || value.isEmpty || value.length < theRightLength) {
      return returnBool
          ? false
          : "Must be at least $theRightLength characters in length";
    }
    return returnBool ? true : null;
  }

  String? isValidPassword(String? value) {
    if (!(hasTheRightLengthCase(value, 8, returnBool: true) as bool)) {
      return AppLocalizations.of(context)!.translate(
        "must be at least 8 characters in length",
        replacement: "Password",
      );
    } else if (!(hasUpperCase(value!, returnBool: true) as bool)) {
      return AppLocalizations.of(context)!.translate(
        "should contain at least one upper case",
        replacement: "Password",
      );
    } else if (!(hasLowerCase(value, returnBool: true) as bool)) {
      return AppLocalizations.of(context)!.translate(
        "should contain at least one lower case",
        replacement: "Password",
      );
    } else if (!(hasDigitCase(value, returnBool: true) as bool)) {
      return AppLocalizations.of(context)!.translate(
        "should contain at least one digit",
        replacement: "Password",
      );
    } else if (!(hasSpecialCharacterCase(value, returnBool: true) as bool)) {
      return AppLocalizations.of(context)!.translate(
        "should contain at least one Special character",
        replacement: "Password",
      );
    }
    return null;
  }

  String? isValidConfirmPasswordPassword(
    String? password,
    String? confirmPassword,
  ) {
    if (password != confirmPassword) {
      return AppLocalizations.of(
        context,
      )!.translate("confirm password is not matched");
    }
    return null;
  }

  static bool isInteger(num value) => (value % 1) == 0;

  // Measures text using an off-screen canvas. It's not fast, but not overly slow either. Use with (mild) caution :)
  static Size measure(
    String text,
    TextStyle style, {
    int maxLines = 1,
    TextDirection direction = TextDirection.ltr,
    double? maxWidth,
  }) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: maxLines,
      textDirection: direction,
    )..layout(maxWidth: maxWidth ?? double.infinity);
    return textPainter.size;
  }

  // Measures longest text item in a list of Strings. Useful for things like Dropdown Menu, where you just want to take up as much space as the content requires.
  static double measureLongest(
    List<String> items,
    TextStyle style, [
    int? maxItems,
  ]) {
    double l = 0;
    if (maxItems != null && maxItems < items.length) {
      items.length = maxItems;
    }
    for (final item in items) {
      final double m = measure(item, style).width;
      if (m > l) l = m;
    }
    return l;
  }

  /// Gracefully handles null values, and skips the suffix when null
  static String safeGet(String value, [String? suffix]) {
    return value + (!isEmpty(value) ? suffix ?? "" : "");
  }

  static String pluralize(String s, int length) {
    if (length == 1) return s;
    return "${s}s";
  }

  static String titleCaseSingle(String s) =>
      '${s[0].toUpperCase()}${s.substring(1)}';
  static String titleCase(String s) =>
      s.split(" ").map(titleCaseSingle).join(" ");

  static String defaultOnEmpty(String value, String fallback) =>
      isEmpty(value) ? fallback : value;

  static bool isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }
}

class HexColor extends Color {
  final String hexColor;
  HexColor(this.hexColor) : super(getColorFromHex(hexColor));

  static int getColorFromHex(String hexColor) {
    if (hexColor.contains("#")) {
      String newHexColor = hexColor.toUpperCase().replaceAll("#", "");
      if (newHexColor.length == 6) {
        // ignore: parameter_assignments
        newHexColor = "FF$newHexColor";
        //print('sdsd ${newHexColor}');
        return int.parse(newHexColor, radix: 16);
      }
      return int.parse('FF252525', radix: 16);
    }
    return int.parse('FF252525', radix: 16);
  }

  Color toColor() {
    return Color(getColorFromHex(hexColor));
  }
}

extension CapExtension on String {
  String get inCaps =>
      isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : '';
  String get allInCaps => toUpperCase();
  String get capitalizeFirstofEach => replaceAll(
    RegExp(' +'),
    ' ',
  ).split(" ").map((str) => str.inCaps).join(" ");
}

extension ArrayHellper on List<String> {
  bool hasAny(items) {
    List needleItems = [];
    if (items is! List) {
      needleItems = [items];
    } else {
      needleItems = items;
    }
    for (int needleIndex = 0; needleIndex < needleItems.length; needleIndex++) {
      for (int haystackIndex = 0; haystackIndex < length; haystackIndex++) {
        if (this[haystackIndex] == needleItems[needleIndex]) {
          return true;
        }
      }
    }
    return false;
  }
}
