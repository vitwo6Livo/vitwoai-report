// ignore_for_file: must_be_immutable, use_full_hex_values_for_flutter_colors

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitwoai_report/src/ageing/presentation/agineScreen.dart';
import 'package:vitwoai_report/src/home/presentation/main-Screen.dart';
import 'package:vitwoai_report/src/purchaseRegister/presentation/PRScreen.dart';
import 'package:vitwoai_report/src/sales_Register/presentation/salesRegister.dart';
import 'package:vitwoai_report/src/settings/colors.dart';

import '../src/purchaseRegister/presentation/purchesRegister_Screen.dart';

class NewBottomNav extends StatefulWidget {
  List<Map<String, dynamic>> settings;
  NewBottomNav({super.key, required this.settings});

  @override
  State<NewBottomNav> createState() => _NewBottomNavState();
}

class _NewBottomNavState extends State<NewBottomNav> {
  List<Map<String, dynamic>>? settings;
  bool isLoading = true;

  final List<Widget> _screens = [
    const Main_Screen(),
    SalesAnalyticsScreen(),
    const PurchesregisterScreen(),
    const SalesRegister(),
    //////// new////
    const Main_Screen(), //0101
    SalesAnalyticsScreen(), //0202
    const PurchesRegister(), //0303
    const SalesRegister(), //0404
    const Main_Screen(), //0505
    SalesAnalyticsScreen(), //0606
    const PurchesRegister(), //0707
    const SalesRegister(), //0808
    const SalesRegister(), //0909
  ];

  final List<IconData> icon = [
    Icons.home,
    Icons.receipt,
    Icons.shopping_bag,
    Icons.payments,
    ////////// test ////////////
    Icons.add_ic_call,
    Icons.add_location_alt_outlined,
    Icons.abc,
    Icons.padding,
    Icons.person,
    Icons.boy,
    Icons.build_circle,
    Icons.add_chart_sharp,
    Icons.e_mobiledata,
  ];

  int isActive = 0;
  List<int> enabledItems = [];

  @override
  void initState() {
    super.initState();
    settings = List.from(widget.settings);
    loadSettings();
  }

  Future<void> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('settings');

    if (jsonString != null) {
      List<dynamic> jsonData = jsonDecode(jsonString);
      setState(() {
        settings = jsonData.map((e) => Map<String, dynamic>.from(e)).toList();
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final newEnabledItems = [
      0,
      if (settings!.length > 1 && settings![1]['value']) 1,
      if (settings!.length > 2 && settings![2]['value']) 2,
      if (settings!.length > 3 && settings![3]['value']) 3,
      /////// ////////////// test /////////////////////////
      if (settings!.length > 4 && settings![4]['value']) 4,
      if (settings!.length > 5 && settings![5]['value']) 5,
      if (settings!.length > 6 && settings![6]['value']) 6,
      if (settings!.length > 7 && settings![7]['value']) 7,
      if (settings!.length > 8 && settings![8]['value']) 8,
      if (settings!.length > 9 && settings![9]['value']) 9,
      if (settings!.length > 10 && settings![10]['value']) 10,
      if (settings!.length > 11 && settings![11]['value']) 11,
      if (settings!.length > 12 && settings![12]['value']) 12,
    ];

    if (newEnabledItems.isEmpty) {
      newEnabledItems.add(0);
    }

    if (!listEquals(enabledItems, newEnabledItems)) {
      setState(() {
        enabledItems = newEnabledItems;
      });
    }

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
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(enabledItems.length, (index) {
            return InkWell(
              onTap: () {
                setState(() {
                  isActive = enabledItems[index];
                });
              },
              child: Column(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 4,
                    width: isActive == enabledItems[index] ? 20 : 0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff81B4ff),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Icon(
                    icon[enabledItems[index]],
                    color: isActive == enabledItems[index]
                        ? Colors.white
                        : Colors.white54,
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
