// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'colors.dart';

class Styles {
  static ThemeData themeData(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: AppColor.screenBg,
      textTheme: ThemeData.light().textTheme.copyWith(
            bodyLarge: TextStyle(
              fontFamily: 'Lora-SemiBold',
              fontSize: 22,
              color: AppColor.lightFont,
            ),
            bodySmall: TextStyle(
              fontFamily: 'Lora-Regular',
              color: AppColor.lightFont,
              fontSize: 14,
            ),
            bodyMedium: TextStyle(
              fontFamily: 'Lora-Medium',
              color: AppColor.lightFont,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            //////////// app bar text ///////////
            titleMedium: TextStyle(
              fontFamily: 'Lora-Medium',
              color: AppColor.appbarFont,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
    );
  }
}
