// ignore_for_file: library_private_types_in_public_api, file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitwoai_report/src/home/presentation/main-Screen.dart';
import 'package:vitwoai_report/src/settings/colors.dart';
import 'package:vitwoai_report/src/settings/texts.dart';

class SettingsScreen extends StatefulWidget {
  final List<Map<String, dynamic>> selectedSettings;
  const SettingsScreen({
    super.key,
    required this.selectedSettings,
  });

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final List<Map<String, dynamic>> settings = [
    {"title": "Pie Chart", "value": false},
    {"title": "Bar Chart", "value": false},
    {"title": "Area Bump", "value": false},
    {"title": "Calendar", "value": false},
    {"title": "Bump Chart", "value": false},
    {"title": "Heat Map", "value": false},
    {"title": "Candle Chart", "value": false},
    {"title": "Tree Chart", "value": false},
    {"title": "Box Plot", "value": false},
  ];

  @override
  void initState() {
    super.initState();
    _initializeSwitchStates();
  }

  void _initializeSwitchStates() {
    for (var setting in settings) {
      setting['value'] = widget.selectedSettings.any((selected) =>
              selected['title'] == setting['title'] &&
              selected['value'] == true)
          ? true
          : false;
    }
  }

  Future<void> saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(settings);
    await prefs.setString('settings', jsonString);
    print('Settings saved!: $jsonString');
    // await loadSettings();
  }

  Future<void> _saveSwitchState(String title, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          HandText.addWidget,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              final selectedSettings = settings
                  .where((setting) => setting['value'] == true)
                  .toList();
              saveSettings();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      Main_Screen(selectedSettings: selectedSettings),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: settings.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              settings[index]['title'],
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 16),
            ),
            leading: Transform.scale(
              scale: 0.8,
              child: Switch(
                activeColor: AppColor.switchColor,
                value: settings[index]['value'],
                onChanged: (bool newValue) {
                  setState(() {
                    settings[index]['value'] = newValue;
                  });
                  _saveSwitchState(settings[index]['title'], newValue);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
