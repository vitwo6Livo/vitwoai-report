import 'package:flutter/material.dart';
import 'package:vitwoai_report/golobal-Widget/new-bottom-Nav.dart';
import 'package:vitwoai_report/src/ageing/presentation/agineScreen.dart';
import 'package:vitwoai_report/src/login/presentation/loginScreen.dart';
import 'package:vitwoai_report/src/menu/presentation/generalSettings.dart';
import 'package:vitwoai_report/src/purchaseRegister/presentation/purchesRegister_Screen.dart';
import 'package:vitwoai_report/src/sales_Register/presentation/SRWidget/HsnCodeWiseList.dart';
import 'package:vitwoai_report/src/sales_Register/presentation/SRWidget/allSalesRegisterList.dart';
import 'package:vitwoai_report/src/sales_Register/presentation/SRWidget/customerWiseList.dart';
import 'package:vitwoai_report/src/sales_Register/presentation/SRWidget/itemGroupWiseList.dart';
import 'package:vitwoai_report/src/sales_Register/presentation/SRWidget/itemWiseList.dart';
import 'package:vitwoai_report/src/sales_Register/presentation/SRWidget/soWiseList.dart';
import '../home/presentation/main-Screen.dart';
import '../splash/presentation/intro-Screen.dart';
import 'routeNames.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.intro:
        return MaterialPageRoute(
          builder: (BuildContext context) => const Intro_Screen(),
        );
      case RouteNames.loginScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const LoginScreen(),
        );

      case RouteNames.bottomnav:
        return MaterialPageRoute(
            builder: (BuildContext context) => SimpleBottomNav()

            // NewBottomNav(
            //   settings: (settings.arguments as List<Map<String, dynamic>>?) ?? [],
            // ),
            );

      case RouteNames.mainScrren:
        return MaterialPageRoute(
          builder: (BuildContext context) => const MainScreen(),
        );
      case RouteNames.generalSettings:
        return MaterialPageRoute(
          builder: (BuildContext context) => const GeneralSettingScreen(),
        );

      // Demo COde
      // Ageing
      case RouteNames.Receivable:
        return MaterialPageRoute(
            builder: (BuildContext context) => ReceivableAnalyticsScreen());

      // Purchase Register
      case RouteNames.Purchase:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                const PurchesregisterScreen(initialTab: 0));
      case RouteNames.POWise:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                const PurchesregisterScreen(initialTab: 1));
      case RouteNames.VendorWise:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                const PurchesregisterScreen(initialTab: 2));
      case RouteNames.ItemWise:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                const PurchesregisterScreen(initialTab: 3));
      case RouteNames.ItemGroupWise:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                const PurchesregisterScreen(initialTab: 4));
      case RouteNames.HSNWise:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                const PurchesregisterScreen(initialTab: 5));

      // Sales Register
      case RouteNames.Sales:
        return MaterialPageRoute(
            builder: (BuildContext context) => const AllSalesRegisterList());
      case RouteNames.SOWise:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SoWiseListScreen());
      case RouteNames.SalesCustomerWise:
        return MaterialPageRoute(
            builder: (BuildContext context) => const CustomerWiseScreen());
      case RouteNames.SalesItemWise:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ItemWiseScreen());
      case RouteNames.SalesItemGroupWise:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ItemGroupWiseScreen());
      case RouteNames.SalesHSNWise:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HsnCodeWiseScreen());

      default:
        return MaterialPageRoute(builder: (BuildContext context) {
          return const Scaffold(
            body: SizedBox(),
          );
        });
    }
  }
}
