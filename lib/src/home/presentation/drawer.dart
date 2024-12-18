import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vitwoai_report/src/All%20Reports/allReportsScreen.dart';
import 'package:vitwoai_report/src/Dashboard%20Settings/dashboardSetteingsScreen.dart';
import 'package:vitwoai_report/src/home/presentation/demoHomePage.dart';
import 'package:vitwoai_report/src/Report%20Details/reportDetailsScreen.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  int i = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      DemoHomePage(),
      AllReport(),
      ReportDetails(),
      DashboardSettings()
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 218, 217, 217),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xfff003060),
        title: Text(
          i == 0
              ? "HomePage"
              : i == 1
                  ? "All Reports"
                  : i == 2
                      ? "Report Details"
                      : i == 3
                          ? "Dashboard Settings"
                          : "",
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: i == 0
            ? [
                IconButton(
                    onPressed: () {
                      // Navigator.of(context).push(
                      //   CustomPageRoute(
                      //     child: SettingsScreen(
                      //       selectedSettings: widget.selectedSettings,
                      //     ),
                      //     direction: AxisDirection.up,
                      //   ),
                      // );
                    },
                    icon: const Icon(Icons.settings))
              ]
            : [],
      ),
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
                    radius: 30,
                    backgroundImage: NetworkImage(
                        'https://imgcdn.stablediffusionweb.com/2024/4/7/a6908dd0-0688-4200-bfa5-fbdcb4b9dc6f.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Sayed Al Mamoon',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'sayedalmamoon@example.com',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: LottieBuilder.asset(
                "assets/json/Home-Animation.json",
                height: 30,
              ),
              title: const Text('Dashboard'),
              onTap: () => onItemSelected(0),
            ),
            ListTile(
              leading: LottieBuilder.asset(
                "assets/json/Chart-Animation.json",
                height: 30,
              ),
              title: const Text('All Reports'),
              onTap: () => onItemSelected(1),
            ),
            ListTile(
              leading: LottieBuilder.asset(
                "assets/json/ChartTwo-Animation.json",
                height: 30,
              ),
              title: const Text('Report Details'),
              onTap: () => onItemSelected(2),
            ),
            ListTile(
              leading: LottieBuilder.asset(
                "assets/json/settingsIcon.json",
                height: 30,
              ),
              title: const Text('Dashboard Settings'),
              onTap: () => onItemSelected(3),
            ),
            ListTile(
              leading: LottieBuilder.asset(
                "assets/json/logout.json",
                height: 30,
              ),
              title: const Text('Logout'),
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
