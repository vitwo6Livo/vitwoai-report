import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:vitwoai_report/src/golobal-Widget/customPage-Route.dart';
import 'package:vitwoai_report/src/home/presentation/mainScreenWidget/pieChart/pieChartDetails.dart';

class CandileChartWidget extends StatefulWidget {
  const CandileChartWidget({super.key});

  @override
  State<CandileChartWidget> createState() => _CandileChartWidgetState();
}

class _CandileChartWidgetState extends State<CandileChartWidget> {
  late List<ChartData> chartData;

  @override
  void initState() {
    super.initState();
    chartData = getChartData();
  }

  List<ChartData> getChartData() {
    return List.generate(
      300,
      (index) => ChartData(index, (index * 2 % 50).toDouble()),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                    'Fast Line Chart',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    'This is Fast Line Chart',
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
          title: ChartTitle(text: 'Fast Line Chart'),
          primaryXAxis: NumericAxis(title: AxisTitle(text: 'X Axis')),
          primaryYAxis: NumericAxis(title: AxisTitle(text: 'Y Axis')),
          series: <FastLineSeries<ChartData, num>>[
            FastLineSeries<ChartData, num>(
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              color: Colors.blue,
              dataLabelSettings: DataLabelSettings(isVisible: false),
            ),
          ],
        )),
      ],
    );
  }
}

class ChartData {
  final int x;
  final double y;

  ChartData(this.x, this.y);
}
