import 'package:flutter/material.dart';
import 'package:vitwoai_report/src/login/presentation/loginScreen.dart';
import 'package:vitwoai_report/src/settings/theme.dart';
import 'routes/routeNames.dart';
import 'routes/routeNavigation.dart';

class ReportApp extends StatelessWidget {
  const ReportApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Styles.themeData(context),
      onGenerateTitle: (BuildContext context) => 'Vitwoai Report',
      initialRoute: RouteNames.loginScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
