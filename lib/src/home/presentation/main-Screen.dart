// ignore_for_file: camel_case_types, must_be_immutable

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitwoai_report/src/home/presentation/mainScreenWidget/barChart/barChart-Widget.dart';
import 'package:vitwoai_report/src/home/presentation/mainScreenWidget/pieChart/pieChart-Widget.dart';
import 'package:vitwoai_report/src/profile/presentation/prifileScreen.dart';
import 'package:vitwoai_report/src/settings/colors.dart';
import 'package:vitwoai_report/src/settings/texts.dart';
import '../../All Reports/allReportsScreen.dart';
import '../../Report Details/reportDetailsScreen.dart';
import '../../golobal-Widget/bottom-Nav.dart';
import '../../golobal-Widget/customPage-Route.dart';
import '../../golobal-Widget/dasboardChartCard-Widget.dart';
import 'addWidget-Screen.dart';
import 'mainScreenWidget/areaChart/areaChart-Widget.dart';
import 'mainScreenWidget/boxChart/boxChart-Widget.dart';
import 'mainScreenWidget/bumpChart/bumpChart-Widget.dart';
import 'mainScreenWidget/calendarChart/calendarChart-Widget.dart';
import 'mainScreenWidget/candleChart/candleChart-Widget.dart';
import 'mainScreenWidget/heatChart/heatChart-Widget.dart';
import 'mainScreenWidget/treeChart/treeChart-Widget.dart';

class Main_Screen extends StatefulWidget {
  List<Map<String, dynamic>> selectedSettings;
  Main_Screen({required this.selectedSettings});
  @override
  State<Main_Screen> createState() => _Main_ScreenState();
}

class _Main_ScreenState extends State<Main_Screen> {
  int i = 0;
  @override
  void initState() {
    super.initState();
    loadSettings();
  }

  @override
  void didUpdateWidget(covariant Main_Screen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedSettings != oldWidget.selectedSettings) {
      loadSettings(); // Re-fetch settings if the widget updates
    }
  }

  Future<void> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('settings');
    if (jsonString != null) {
      List<dynamic> jsonData = jsonDecode(jsonString);
      setState(() {
        widget.selectedSettings =
            jsonData.map((e) => Map<String, dynamic>.from(e)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool noSelectedItems =
        !widget.selectedSettings.any((item) => item["value"]);
    final List<Widget> screens = [
      Main_Screen(selectedSettings: widget.selectedSettings),
      const AllReport(),
      const ReportDetails(),
      const ProfileScreen(),
    ];
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
          HandText.dashboardTitle,
          style: TextStyle(color: AppColor.primaryColor),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                CustomPageRoute(
                  child: SettingsScreen(
                    selectedSettings: widget.selectedSettings,
                  ),
                  direction: AxisDirection.up,
                ),
              );
            },
            icon: const Icon(Icons.settings),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.notifications_active),
          ),
        ],
      ),
      body: noSelectedItems
          ? Column(
              children: [
                Text(
                  HandText.customizeInfo,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text('Click Setting')
              ],
            )
          : ListView(
              children: [
                for (var item in widget.selectedSettings)
                  if (item["value"] && item["title"] == "Pie Chart") ...[
                    const DasboardChartCardWidget(child: PieChartWidget()),
                  ] else if (item["value"] && item["title"] == "Bar Chart") ...[
                    DasboardChartCardWidget(child: BarChartWidget()),
                  ] else if (item["value"] && item["title"] == "Area Bump") ...[
                    const DasboardChartCardWidget(child: AreaChartWidget()),
                  ] else if (item["value"] && item["title"] == "Calendar") ...[
                    const DasboardChartCardWidget(child: CalendarChartWidget()),
                  ] else if (item["value"] &&
                      item["title"] == "Bump Chart") ...[
                    const DasboardChartCardWidget(child: BumpChartWidget()),
                  ] else if (item["value"] && item["title"] == "Heat Map") ...[
                    const DasboardChartCardWidget(child: HeatChartWidget()),
                  ] else if (item["value"] &&
                      item["title"] == "Candle Chart") ...[
                    const DasboardChartCardWidget(child: CandileChartWidget()),
                  ] else if (item["value"] &&
                      item["title"] == "Tree Chart") ...[
                    const DasboardChartCardWidget(child: TreeChartWidget()),
                  ] else if (item["value"] && item["title"] == "Box Plot") ...[
                    const DasboardChartCardWidget(child: BoxChartWidget()),
                  ],
              ],
            ),
    );
  }
}
