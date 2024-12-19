import 'dart:async';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';
import 'package:vitwoai_report/src/golobal-Widget/customPage-Route.dart';
import 'package:vitwoai_report/src/home/presentation/mainScreenWidget/pieChart/pieChartDetails.dart';

class BarChartWidget extends StatefulWidget {
  BarChartWidget({super.key});

  @override
  State<BarChartWidget> createState() => _BarChartWidgetState();
}

class _BarChartWidgetState extends State<BarChartWidget> {
  List<_ChartData>? _chartData;
  Timer? _timer;
  final List<List<dynamic>> chartData = [
    [40, 'Rent', Colors.blue],
    [30, 'Food', Colors.green],
    [20, 'Transportation', Colors.orange],
    [10, 'Entertainment', Colors.purple],
  ];
  final List<Map<String, dynamic>> foodData = [
    {'name': 'Pizza', 'price': 12, 'calories': 285, 'image': Icons.local_pizza},
    {'name': 'Burger', 'price': 8.49, 'calories': 354, 'image': Icons.fastfood},
    {'name': 'Pasta', 'price': 10, 'calories': 221, 'image': Icons.restaurant},
    {'name': 'Salad', 'price': 6.99, 'calories': 152, 'image': Icons.eco},
    {
      'name': 'Sushi',
      'price': 150,
      'calories': 200,
      'image': Icons.ramen_dining
    }
  ];

  @override
  Widget build(BuildContext context) {
    _getChartData();
    _timer = Timer(const Duration(seconds: 2), () {
      setState(() {
        _getChartData();
      });
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bar Chart',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    'This is Bar Chart',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 10),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    CustomPageRoute(
                      child: const PieChartDetails(),
                      direction: AxisDirection.up,
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border: Border.all(width: 1, color: Colors.grey),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.settings,
                        size: 15,
                      ),
                      Text(
                        'Settings',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Card(
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(
              title: AxisTitle(text: "Food Chart"),
            ),
            legend: Legend(isVisible: true),
            series: [
              BarSeries(
                dataSource: foodData,
                xValueMapper: (datum, index) => datum['name'],
                yValueMapper: (datum, index) => datum['price'],
                color: Colors.green,
                name: "Healthy",
              ),
              BarSeries(
                dataSource: foodData,
                xValueMapper: (datum, index) => datum['name'],
                yValueMapper: (datum, index) => datum['calories'],
                color: Colors.orange,
                name: "Healthy",
              )
            ],
          ),
        ),
      ],
    );
  }

  SfCartesianChart _buildAnimationColumnChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      primaryXAxis:
          const CategoryAxis(majorGridLines: MajorGridLines(width: 0)),
      primaryYAxis: const NumericAxis(
        majorTickLines: MajorTickLines(color: Colors.transparent),
        axisLine: AxisLine(width: 0),
        minimum: 0,
        maximum: 100,
      ),
      series: _getDefaultColumnSeries(),
    );
  }

  List<ColumnSeries<_ChartData, num>> _getDefaultColumnSeries() {
    return <ColumnSeries<_ChartData, num>>[
      ColumnSeries<_ChartData, num>(
        dataSource: _chartData,
        xValueMapper: (_ChartData sales, _) => sales.x,
        yValueMapper: (_ChartData sales, _) => sales.y,
      )
    ];
  }

  @override
  void dispose() {
    super.dispose();
    _timer!.cancel();
    _chartData!.clear();
  }

  void _getChartData() {
    _chartData = <_ChartData>[];

    for (int i = 0; i < 12; i++) {
      // Replace 10 with any logic or value you want for the data
      _chartData!.add(_ChartData(i, 50));
    }

    _timer?.cancel();
  }
}

class _ChartData {
  _ChartData(this.x, this.y);
  final int x;
  final int y;
}
