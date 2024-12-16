import 'dart:async';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';

class BarChartWidget extends StatefulWidget {
  BarChartWidget({super.key});

  @override
  State<BarChartWidget> createState() => _BarChartWidgetState();
}

class _BarChartWidgetState extends State<BarChartWidget> {
  List<_ChartData>? _chartData;
  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    _getChartData();
    _timer = Timer(const Duration(seconds: 2), () {
      setState(() {
        _getChartData();
      });
    });
    return _buildAnimationColumnChart();
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
    List<String> months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];

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
