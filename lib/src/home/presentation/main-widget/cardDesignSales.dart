import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CardDesignSales extends StatelessWidget {
  final String title;
  final String totalSales;
  final String totalCollections;
  final String revenue;
  final String growth;

  const CardDesignSales({
    Key? key,
    required this.title,
    required this.totalSales,
    required this.totalCollections,
    required this.revenue,
    required this.growth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<List<dynamic>> chartData = [
      [40, 'Total Sale', Colors.blue],
      [30, 'Revenue', Colors.green],
      [20, 'Growth', Colors.orange],
    ];
    return Card(
      color: Colors.white,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 200,
              child: SfCircularChart(
                series: [
                  PieSeries(
                    // radius: "50%",
                    dataSource: chartData,
                    yValueMapper: (datum, index) => datum[0],
                    xValueMapper: (datum, index) => datum[1],
                    explode: true,
                    pointColorMapper: (datum, index) => datum[2],
                    dataLabelMapper: (datum, index) =>
                        datum[0].toString() + "%",
                    dataLabelSettings: const DataLabelSettings(
                      isVisible: true,
                      labelPosition: ChartDataLabelPosition.outside,
                    ),
                  )
                ],
                legend: Legend(isVisible: true, position: LegendPosition.top),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(TextSpan(children: [
                  const TextSpan(
                    text: 'Total Sales\n',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "     $totalSales",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ])),
                Text.rich(TextSpan(children: [
                  const TextSpan(
                    text: 'Revenue\n',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: '₹ $totalCollections',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ])),
              ],
            ),
            const Divider(
              // height: 10,
              thickness: 1,
              color: Colors.grey,
            ),
            Text.rich(TextSpan(children: [
              const TextSpan(
                text: 'Growth\n',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: '   $revenue%',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ])),
          ],
        ),
      ),
    );
  }
}
