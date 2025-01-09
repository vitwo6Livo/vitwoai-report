// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vitwoai_report/src/All%20Reports/allReportsScreen.dart';
import 'package:vitwoai_report/src/Report%20Details/reportDetailsScreen.dart';
import 'package:vitwoai_report/src/home/presentation/main-Screen.dart';
import 'package:vitwoai_report/src/profile/presentation/prifileScreen.dart';

class DrawerScreen extends StatefulWidget {
  List<Map<String, dynamic>> selectedSettings;
  DrawerScreen({required this.selectedSettings});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  int i = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      Main_Screen(selectedSettings: widget.selectedSettings),
      const AllReport(),
      const ReportDetails(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: screens[i],
      drawer: AppDrawer(
        onItemSelected: (index) {
          setState(() {
            i = index;
          });
          Navigator.pop(context);
        },
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  final Function(int) onItemSelected;

  const AppDrawer({super.key, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff003060),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                        'https://imgcdn.stablediffusionweb.com/2024/4/7/a6908dd0-0688-4200-bfa5-fbdcb4b9dc6f.jpg'),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Sayed Al Mamoon',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Text(
                  //   'sayedalmamoon@example.com',
                  //   style: TextStyle(
                  //     color: Colors.white70,
                  //     fontSize: 14,
                  //   ),
                  // ),
                  Text.rich(TextSpan(
                    children: [
                      TextSpan(
                        text: 'Company name: ',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: 'Saregama India Limited',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )),
                  Text.rich(TextSpan(
                    children: [
                      TextSpan(
                        text: 'Location: ',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: 'Banglore, India',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            ),
            ListTile(
              leading: LottieBuilder.asset(
                "assets/json/Home-Animation.json",
                height: 30,
              ),
              title: Text(
                'Dashboard',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              onTap: () => onItemSelected(0),
            ),
            ListTile(
              leading: LottieBuilder.asset(
                "assets/json/Chart-Animation.json",
                height: 30,
              ),
              title: Text(
                'All Reports',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              onTap: () => onItemSelected(1),
            ),
            ListTile(
              leading: LottieBuilder.asset(
                "assets/json/ChartTwo-Animation.json",
                height: 30,
              ),
              title: Text(
                'Report Details',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              onTap: () => onItemSelected(2),
            ),
            ListTile(
              leading: LottieBuilder.asset(
                "assets/json/profile.json",
                height: 30,
              ),
              title: Text(
                'ProFile',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              onTap: () => onItemSelected(3),
            ),
            ListTile(
              leading: LottieBuilder.asset(
                "assets/json/logout.json",
                height: 30,
              ),
              title: Text(
                'Logout',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
