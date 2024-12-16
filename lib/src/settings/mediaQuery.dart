// ignore_for_file: file_names

import 'package:flutter/material.dart';

class SizeVariables {
  static double getHeight(context) {
    return MediaQuery.of(context).size.height * 1;
  }

  static double getWidth(context) {
    return MediaQuery.of(context).size.width * 1;
  }
}
