import 'package:flutter/material.dart';
import 'package:vitwoai_report/src/ageing/presentation/receivableScreen.dart';
import 'package:vitwoai_report/src/home/presentation/main-Screen.dart';
import 'package:vitwoai_report/src/menu/presentation/menuScreen.dart';
import 'package:vitwoai_report/src/purchaseRegister/presentation/purchesRegister_Screen.dart';
import 'package:vitwoai_report/src/sales_Register/presentation/salesRegister.dart';
import 'package:vitwoai_report/src/settings/colors.dart';

class SimpleBottomNav extends StatefulWidget {
  const SimpleBottomNav({super.key});

  @override
  State<SimpleBottomNav> createState() => _SimpleBottomNavState();
}

class _SimpleBottomNavState extends State<SimpleBottomNav> {
  int isActive = 0;

  final List<Widget> _screens = [
    const MainScreen(),
    const ReceivableAnalyticsScreen(),
    const PurchesregisterScreen(),
    const SalesRegister(),
    const MenuScreen(),
  ];

  final List<IconData> icons = [
    Icons.home,
    Icons.receipt,
    Icons.shopping_bag,
    Icons.payments,
    Icons.menu,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
      bottomNavigationBar: Container(
        height: 60,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
          color: AppColor.appBarColor2,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, 20),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(icons.length, (index) {
            return InkWell(
              onTap: () {
                setState(() {
                  isActive = index;
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 4,
                    width: isActive == index ? 20 : 0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff81B4ff),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Icon(
                    icons[index],
                    color: isActive == index ? Colors.white : Colors.white54,
                  ),
                ],
              ),
            );
          }),
        ),
      ),
      body: _screens[isActive],
    );
  }
}
