// ignore_for_file: camel_case_types, use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'package:vitwoai_report/src/settings/colors.dart';

class DasboardChartCardWidget extends StatelessWidget {
  final Widget child;
  const DasboardChartCardWidget({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: AppColor.appBarColor),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      padding: const EdgeInsets.all(5),
      child: child,
    );
  }
}
