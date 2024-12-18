import 'package:flutter/material.dart';

class DashboardSettings extends StatelessWidget {
  const DashboardSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 218, 217, 217),
        body: Center(
          child: Text("Dashboard Settings"),
        ));
  }
}
