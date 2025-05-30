import 'package:flutter/material.dart';

class CircularChart extends StatelessWidget {
  final String label;
  final int percent;
  final int availed;
  final int balance;

  const CircularChart(this.label, this.percent, this.availed, this.balance);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: CircularProgressIndicator(
                value: percent / 100,
                strokeWidth: 6,
                color: Colors.blue,
                backgroundColor: Colors.grey[300],
              ),
            ),
            Text('$percent%'),
          ],
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 14)),
        Text(
          '$availed | $balance',
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}
