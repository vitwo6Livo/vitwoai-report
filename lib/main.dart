import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitwoai_report/src/app.dart';

void main() {
  runApp(
    const ProviderScope(
      child: ReportApp(),
    ),
  );
}
