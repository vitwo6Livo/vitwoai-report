// ignore_for_file: use_key_in_widget_constructors, file_names, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:vitwoai_report/src/settings/colors.dart';

class AppButtonStyle extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  AppButtonStyle({
    required this.label,
    required this.onPressed,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: IntrinsicWidth(
        child: Container(
          width: width,
          height: height,
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16.0),
          decoration: BoxDecoration(
            color: AppColor.primayButton,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
      ),
    );
  }
}

class SecondaryButtonStyle extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double? width;
  final double? height;

  SecondaryButtonStyle({
    required this.label,
    required this.onPressed,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: IntrinsicWidth(
        child: Container(
          width: width,
          height: height,
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16.0),
          decoration: BoxDecoration(
            color: AppColor.secondaryButton,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
