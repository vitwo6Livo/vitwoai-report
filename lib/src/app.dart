import 'package:flutter/material.dart';

import 'login/presentation/login-Screen.dart';

class ReportApp extends StatelessWidget {
  const ReportApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login_Screen(),
    );
  }
}
