import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class FunctionalAreaGraphModel extends StatefulWidget {
  const FunctionalAreaGraphModel({super.key});

  @override
  State<FunctionalAreaGraphModel> createState() =>
      _FunctionalAreaGraphModelState();
}

class _FunctionalAreaGraphModelState extends State<FunctionalAreaGraphModel> {
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
                      'Line Chart',
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 400,
                width: 400,
                child: LineChart(
                  LineChartData(
                    backgroundColor: Colors.white60,
                    // For X-axis
                    minX: 0,
                    maxX: 10,
                    // For Y-axis
                    minY: 0,
                    maxY: 100,

                    titlesData: FlTitlesData(
                      show: true,
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 45,
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 1,
                          reservedSize: 35,
                          getTitlesWidget: (value, meta) {
                            return Text(
                              value.toInt().toString(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            );
                          },
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),

                    // borderData: // for creating over all border
                    gridData: FlGridData(
                      show: true,

                      // for vertical lines
                      drawVerticalLine: true,
                      getDrawingVerticalLine: (value) {
                        return FlLine(color: Colors.black, strokeWidth: 1);
                      },
                      // // for horizontal lines
                      drawHorizontalLine: true,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(color: Colors.black, strokeWidth: 1);
                      },
                    ),

                    // For Providing Values:
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          FlSpot(0, 0),
                          FlSpot(1, 10),
                          FlSpot(2, 20),
                          FlSpot(3, 70),
                          FlSpot(4, 20),
                          FlSpot(6, 60),
                          FlSpot(8, 65),
                          FlSpot(9, 25),
                          FlSpot(10, 0),
                        ],
                        isCurved: true,
                        dotData: FlDotData(show: true),
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                            colors: [
                              Colors.yellow.withOpacity(0.3),
                              Colors.lightGreenAccent.withOpacity(0.5),
                              Colors.green.withOpacity(0.6),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                      ),
                      //   LineChartBarData(
                      //     spots: provider.data.asMap().entries.map((entry) {
                      //       int index = entry.key;
                      //       double yValue = entry.value['y'].toDouble();
                      //       return FlSpot(index.toDouble(), yValue);
                      //     }).toList(),
                      //     isCurved:
                      //         true, // if you want to make the line looks curve then true else remove it
                      //     dotData: FlDotData(
                      //         show: false), // its for not showing the dots in the line
                      //     // color: Colors.blue.shade700, // for adding colors to  the line
                      //     gradient: LinearGradient(
                      //         colors: [Colors.yellow, Colors.lightGreenAccent, Colors.green],
                      //         begin: Alignment.topLeft,
                      //         end: Alignment.bottomRight),
                      //     barWidth: 5, // for increasing line bar width
                      //     belowBarData: BarAreaData(
                      //         show: true,
                      //         gradient: LinearGradient(
                      //             colors: [
                      //               Colors.yellow.withOpacity(0.3),
                      //               Colors.lightGreenAccent.withOpacity(0.5),
                      //               Colors.green.withOpacity(0.6)
                      //             ],
                      //             begin: Alignment.topLeft,
                      //             end: Alignment
                      //                 .bottomRight)), // for adding below colour to the bar
                      //   ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
