import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ProductGraphModel extends StatelessWidget {
  const ProductGraphModel({super.key});

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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'All Sales Register',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
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
                isVisible: true,
                minimum: 0,
                maximum: 2,
                interval: 0.5,
              ),
              series: <CartesianSeries>[
                // ColumnSeries<ChartColumnData, String>(
                //   borderRadius: BorderRadius.only(
                //     bottomLeft: Radius.circular(20),
                //     bottomRight: Radius.circular(20),
                //   ),
                //   dataSource: chartData,
                //   width: 0.5,
                //   color: Colors.pink,
                //   xValueMapper: (ChartColumnData data, _) => data.x,
                //   yValueMapper: (ChartColumnData data, _) => data.y,
                // ),
                ColumnSeries<ChartColumnData, String>(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  dataSource: chartData,
                  width: 0.5,
                  color: Colors.pink,
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
  ChartColumnData(x: 'Mo', y: -0.3, y1: 1.7),
  ChartColumnData(x: "Tu", y: -0.5, y1: 0.4),
  ChartColumnData(x: "We", y: -0.4, y1: 1),
  ChartColumnData(x: "Th", y: -0.45, y1: 0.7),
  ChartColumnData(x: "Fr", y: -0.9, y1: 0.8),
  ChartColumnData(x: "Sa", y: -0.6, y1: 0.9),
  ChartColumnData(x: "Su", y: -0.5, y1: 1),
];
