import 'package:flutter/material.dart';
import 'colors.dart';

class Styles {
  static ThemeData themeData(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: AppColor.screenBg,
      textTheme: ThemeData.light().textTheme.copyWith(
            bodyLarge: TextStyle(
              fontFamily: '',
              fontSize: 22,
              // color: AppColor.,
            ),
            bodySmall: TextStyle(
              fontFamily: '',
              // color: AppColor.,
              fontSize: 14,
            ),
            bodyMedium: TextStyle(
              fontFamily: '',
              // color: AppColor.,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
    );
  }
}
