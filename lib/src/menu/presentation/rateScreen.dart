import 'package:flutter/material.dart';

class RateScreen extends StatelessWidget {
  const RateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            "Rate Us",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Text(
            "Please rate us on the play store",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Rate Us"),
          ),
        ],
      ),
    );
  }
}
