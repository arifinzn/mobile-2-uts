import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kel7/helpers/extension.dart';

class AppConstants {
  static String appName = 'App_name';

  static Color get backgroundColor => HexColor.fromHex('FFFFFF');
  static Color themeColor = Colors.blue;
  static Color get cardColor => const Color(0xFFF9F9F9);

  static Color get dividerColor => Colors.grey.withOpacity(0.7);

  static Color get borderColor => Colors.grey.withOpacity(0.2);

  static Color get disabledColor => Colors.grey.withOpacity(0.2);

  static Color get shadowColor => Colors.black.withOpacity(0.2);

  static Color get iconColor => const Color(0xFF212121);

  static Color get inputFieldTextColor => const Color(0xFF212121);

  static Color get inputFieldPlaceholderTextColor =>
      const Color(0xFF212121).darken();

  static Color get red => Colors.red;

  static Color get green => Colors.green;

  static Color get grayscale900 => Colors.black;

  static Color get grayscale800 => Colors.black.withOpacity(0.8);

  static Color get grayscale700 => Colors.black.withOpacity(0.7);

  static Color get grayscale600 => Colors.black.withOpacity(0.6);

  static Color get grayscale500 => Colors.black.withOpacity(0.5);

  static Color get grayscale400 => Colors.black.withOpacity(0.4);

  static Color get grayscale300 => Colors.black.withOpacity(0.3);

  static Color get grayscale200 => Colors.black.withOpacity(0.2);

  static Color get grayscale100 => Colors.black.withOpacity(0.1);

  static double horizontalPadding = 24;

  static const secondsInADay = 86400;
  static const secondsInThreeDays = 259200;
  static const secondsInSevenDays = 604800;
}

extension HexColor on Color {
  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  // String messageTimeForChat() {
  //   final difference = DateTime.now().difference(this).inDays;
  //
  //   if (isToday()) {
  //     return DateFormat('hh:mm a').format(this);
  //   } else if (isYesterday()) {
  //     return yesterday;
  //   } else if (difference < 7) {
  //     return DateFormat('EEEE').format(this);
  //   }
  //   return DateFormat('dd-MMM-yyyy').format(this);
  // }

  bool isToday() {
    final now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }

  bool isYesterday() {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return yesterday.day == day &&
        yesterday.month == month &&
        yesterday.year == year;
  }

  String get getTimeAgo {
    final currentTime = DateTime.now();
    final difference = currentTime.difference(this);

    if (difference.inDays >= 365) {
      final years = (difference.inDays / 365).floor();
      return '$years ${years == 1 ? 'year' : 'years'}';
    } else if (difference.inDays >= 30) {
      final months = (difference.inDays / 30).floor();
      return '$months ${months == 1 ? 'month' : 'months'}';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'}';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'}';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'}';
    } else {
      return 'Just now';
    }
  }
}
