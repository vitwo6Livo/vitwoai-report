import 'package:flutter/material.dart';
import 'package:vitwoai_report/src/ageing/presentation/agineScreen.dart';
import 'package:vitwoai_report/src/home/presentation/main-Screen.dart';
import 'package:vitwoai_report/src/profile/presentation/profile.dart';
import 'package:vitwoai_report/src/purchaseRegister/presentation/PRScreen.dart';
import 'package:vitwoai_report/src/sales_Register/presentation/salesRegister.dart';
import 'package:vitwoai_report/src/settings/colors.dart';

class NewBottomNav extends StatefulWidget {
  const NewBottomNav({super.key});

  @override
  State<NewBottomNav> createState() => _NewBottomNavState();
}

class _NewBottomNavState extends State<NewBottomNav> {
  final List<Widget> _screens = [
    const MainScreen(),
    ReceivableAnalyticsScreen(),
    const PurchesRegister(),
    // HomeScreen(),
    const SalesRegister(),
    const SettingsScreen(),
  ];

  final icon = [
    Icons.home,
    Icons.receipt,
    Icons.shopping_bag,
    Icons.payments,
    Icons.settings
  ];

  int isActive = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffff9f9f9),
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
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(4, (index) {
            return InkWell(
              onTap: () {
                setState(() {
                  isActive = index;
                });
              },
              child: Column(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 4,
                    width: isActive == index ? 20 : 0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff81B4ff)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Icon(
                    icon[index],
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
