import 'package:flutter/material.dart';
import '../All Reports/allReportsScreen.dart';
import '../golobal-Widget/bottom-Nav.dart';
import '../home/presentation/main-Screen.dart';
import '../settings/colors.dart';

class ReportDetails extends StatefulWidget {
  const ReportDetails({super.key});

  @override
  State<ReportDetails> createState() => _ReportDetailsState();
}

class _ReportDetailsState extends State<ReportDetails> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      Main_Screen(selectedSettings: []),
      const AllReport(),
      const ReportDetails(),
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
            "Report Details",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColor.appbarFont,
                ),
          ),
          actions: [
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.notifications_active),
            ),
          ],
        ),
        body: Center(
          child: Text("Reports Details"),
        ));
  }
}
