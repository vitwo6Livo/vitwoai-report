import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../src/settings/colors.dart';
import 'new-bottom-Nav.dart';

class AppDrawer extends StatefulWidget {
  final List<Map<String, dynamic>> selectedSettings;
  const AppDrawer({
    super.key,
    required this.selectedSettings,
  });

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  List<Map<String, dynamic>> settings = [
    {"title": "Home", "value": true},
    {"title": "Receivable", "value": false},
    {"title": "Purchase", "value": false},
    {"title": "Sales", "value": false},
    /////////// test /////////////////
    {"title": "0101", "value": false},
    {"title": "0202", "value": false},
    {"title": "0303", "value": false},
    {"title": "0404", "value": false},
    {"title": "0505", "value": false},
    {"title": "0606", "value": false},
    {"title": "0707", "value": false},
    {"title": "0808", "value": false},
    {"title": "0909", "value": false},
  ];

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('settings');

    if (jsonString != null) {
      List<dynamic> jsonData = jsonDecode(jsonString);
      setState(() {
        settings = jsonData.map((e) => Map<String, dynamic>.from(e)).toList();
      });
    }
  }

  Future<void> saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(settings);
    await prefs.setString('settings', jsonString);
  }

  int _getActiveSwitchCount() {
    return settings.where((setting) => setting['value'] == true).length;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 100,
            child: DrawerHeader(
              child: Text(
                "Drawer Header",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: settings.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    settings[index]['title'],
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 16),
                  ),
                  leading: Transform.scale(
                    scale: 0.8,
                    child: Switch(
                      activeColor: AppColor.switchColor,
                      value: settings[index]['value'],
                      onChanged: index == 0 ||
                              _getActiveSwitchCount() < 5 ||
                              settings[index]['value']
                          ? index == 0
                              ? (_) {}
                              : (bool newValue) {
                                  setState(() {
                                    settings[index]['value'] = newValue;
                                  });
                                }
                          : null,
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primayButton,
                ),
                onPressed: () {
                  final selectedSettings = settings
                      .where((setting) => setting['value'] == true)
                      .toList();
                  saveSettings();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          NewBottomNav(settings: selectedSettings),
                    ),
                  );
                },
                child: Text(
                  'Save',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
