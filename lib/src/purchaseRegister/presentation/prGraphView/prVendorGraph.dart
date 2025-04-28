import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class VendorGraphModel extends StatefulWidget {
  const VendorGraphModel({super.key});

  @override
  State<VendorGraphModel> createState() => _VendorGraphModelState();
}

class _VendorGraphModelState extends State<VendorGraphModel> {
  int touchedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pie Chart',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert, size: 40),
                ),
              ],
            ),
            SizedBox(height: 30),
            SizedBox(
              height: 350,
              width: 350,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        } else {
                          touchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        }
                      });
                    },
                  ),
                  sections: pieChartSec(),
                  sectionsSpace: 2,
                  centerSpaceRadius: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> pieChartSec() {
    List<Color> colors = [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.deepPurple,
    ];
    return List.generate(4, (index) {
      double value = (index + 1) * 10;

      final isTouched = index == touchedIndex;
      final double radius = isTouched ? 120.0 : 100.0; // Enlarge on touch
      final double fontSize = isTouched ? 22.0 : 16.0;
      return PieChartSectionData(
        value: value,
        title: '$value',
        color: colors[index],
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      );
    });
  }
}
