// ignore_for_file: camel_case_types, file_names, use_key_in_widget_constructors, must_be_immutable

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitwoai_report/src/home/presentation/mainScreenWidget/barChart/barChart-Widget.dart';
import 'package:vitwoai_report/src/home/presentation/mainScreenWidget/pieChart/pieChart-Widget.dart';
import 'package:vitwoai_report/src/settings/all-Button.dart';
import 'package:vitwoai_report/src/settings/mediaQuery.dart';
import 'package:vitwoai_report/src/settings/texts.dart';
import '../../golobal-Widget/customPage-Route.dart';
import '../../golobal-Widget/dasboard-Widget.dart';
import '../../golobal-Widget/dasboardChartCard-Widget.dart';
import 'addWidget-Screen.dart';
import 'mainScreenWidget/areaChart-Widget.dart';
import 'mainScreenWidget/boxChart-Widget.dart';
import 'mainScreenWidget/bumpChart-Widget.dart';
import 'mainScreenWidget/calendarChart-Widget.dart';
import 'mainScreenWidget/candleChart-Widget.dart';
import 'mainScreenWidget/heatChart-Widget.dart';
import 'mainScreenWidget/treeChart-Widget.dart';

class Main_Screen extends StatefulWidget {
  List<Map<String, dynamic>> selectedSettings;
  Main_Screen({required this.selectedSettings});
  @override
  State<Main_Screen> createState() => _Main_ScreenState();
}

class _Main_ScreenState extends State<Main_Screen> {
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
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Icon(
          Icons.line_weight_sharp,
        ),
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
              // crossAxisAlignment: CrossAxisAlignment.center,
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
