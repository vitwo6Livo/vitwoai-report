import 'package:flutter/material.dart';
import 'package:vitwoai_report/src/All%20Reports/allReportsScreen.dart';
import 'package:vitwoai_report/src/Report%20Details/reportDetailsScreen.dart';
import 'package:vitwoai_report/src/golobal-Widget/bottom-Nav.dart';
import 'package:vitwoai_report/src/home/presentation/main-Screen.dart';
import 'package:vitwoai_report/src/settings/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      Main_Screen(selectedSettings: []),
      const AllReport(),
      const ReportDetails(),
      const ProfileScreen(),
    ];
    return Scaffold(
        drawer: AppDrawer(
          onItemSelected: (index) {
            setState(() {
              i = index;
            });
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => screens[i],
              ),
            );
          },
        ),
        appBar: AppBar(
          title: Text(
            "Profile",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColor.appbarFont,
                ),
          ),
          centerTitle: true,
          // actions: [
          //   const Padding(
          //     padding: EdgeInsets.only(right: 10),
          //     child: Icon(Icons.notifications_active),
          //   ),
          // ],
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 50),
          // color: Colors.red,
          width: double.infinity,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
              ),
              Text.rich(
                TextSpan(
                  text: "Name: ",
                  children: [
                    TextSpan(
                      text: "Sayed Al Mamoon",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  text: "Email: ",
                  children: [
                    TextSpan(
                      text: "sayedalmamoon@gmail.com",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
