import 'package:flutter/material.dart';
import 'package:vitwoai_report/golobal-Widget/new-bottom-Nav.dart';
import 'package:vitwoai_report/src/login/presentation/loginScreen.dart';
import '../home/presentation/main-Screen.dart';
import '../splash/presentation/intro-Screen.dart';
import 'routeNames.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.intro:
        return MaterialPageRoute(
          builder: (BuildContext context) => const Intro_Screen(false),
        );
      case RouteNames.loginScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const LoginScreen(),
        );

      case RouteNames.bottomnav:
        return MaterialPageRoute(
          builder: (BuildContext context) => NewBottomNav(
            settings: (settings.arguments as List<Map<String, dynamic>>?) ?? [],
          ),
        );

      case RouteNames.mainScrren:
        return MaterialPageRoute(
          builder: (BuildContext context) => const Main_Screen(),
        );

      default:
        return MaterialPageRoute(builder: (BuildContext context) {
          return const Scaffold(
            body: SizedBox(),
          );
        });
    }
  }
}
