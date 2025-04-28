import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CostCenterGraphModel extends StatelessWidget {
  const CostCenterGraphModel({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '854',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 10),
                    Row(
                      children: [
                        Icon(Icons.arrow_upward, color: Colors.green),
                        Text(
                          '25 Updated',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
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
            SfCartesianChart(
              plotAreaBackgroundColor: Colors.transparent,
              margin: EdgeInsets.all(0),
              borderColor: Colors.transparent,
              borderWidth: 0,
              plotAreaBorderWidth: 0,
              enableSideBySideSeriesPlacement: false,
              primaryXAxis: CategoryAxis(
                axisLine: AxisLine(width: 0.5),
                majorGridLines: MajorGridLines(width: 0),
                majorTickLines: MajorTickLines(width: 0),
                crossesAt: 0,
              ),
              primaryYAxis: NumericAxis(
                isVisible: false, // axis
                minimum: 0,
                maximum: 2,
                interval: 0.5,
              ),
              series: <CartesianSeries>[
                ColumnSeries<ChartColumnData, String>(
                  borderRadius: BorderRadius.circular(20),
                  dataSource: chartData,
                  width: 0.5,
                  color: Color(0xFFE9EDF7),
                  xValueMapper: (ChartColumnData data, _) => data.x,
                  yValueMapper: (ChartColumnData data, _) => data.y,
                ),
                ColumnSeries<ChartColumnData, String>(
                  borderRadius: BorderRadius.circular(20),
                  dataSource: chartData,
                  width: 0.5,
                  color: Colors.blueAccent,
                  xValueMapper: (ChartColumnData data, _) => data.x,
                  yValueMapper: (ChartColumnData data, _) => data.y1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ChartColumnData {
  ChartColumnData({this.x, this.y, this.y1});
  final String? x;
  final double? y;
  final double? y1;
}

final List<ChartColumnData> chartData = <ChartColumnData>[
  ChartColumnData(x: 'Mo', y: 2, y1: 1.7),
  ChartColumnData(x: "Tu", y: 2, y1: 0.5),
  ChartColumnData(x: "We", y: 2, y1: 1.5),
  ChartColumnData(x: "Th", y: 2, y1: 0.8),
  ChartColumnData(x: "Fr", y: 2, y1: 1.3),
  ChartColumnData(x: "Sa", y: 2, y1: 1.8),
  ChartColumnData(x: "Su", y: 2, y1: 0.9),
];
