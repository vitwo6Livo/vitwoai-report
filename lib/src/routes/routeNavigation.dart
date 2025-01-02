import 'package:flutter/material.dart';
import 'package:vitwoai_report/src/login/presentation/loginScreen.dart';
import '../golobal-Widget/bottom-Nav.dart';
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
          builder: (BuildContext context) => LoginScreen(),
        );

      case RouteNames.drawer:
        return MaterialPageRoute(
          builder: (BuildContext context) => DrawerScreen(
            selectedSettings:
                (settings.arguments as List<Map<String, dynamic>>?) ?? [],
          ),
        );

      case RouteNames.mainScrren:
        return MaterialPageRoute(
          builder: (BuildContext context) => Main_Screen(
            selectedSettings:
                (settings.arguments as List<Map<String, dynamic>>?) ?? [],
          ),
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
