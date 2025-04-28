import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StorageLocationGraphModel extends StatefulWidget {
  const StorageLocationGraphModel({super.key});

  @override
  State<StorageLocationGraphModel> createState() =>
      _StorageLocationGraphModelState();
}

class _StorageLocationGraphModelState extends State<StorageLocationGraphModel> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Funnel Graph',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                  ),
                ),
                SizedBox(width: 80),
                Icon(Icons.more_vert_rounded, size: 40, color: Colors.black),
              ],
            ),
            SizedBox(height: 50),
            SfFunnelChart(
              title: ChartTitle(text: 'Sales Pipeline'),
              palette: <Color>[
                Colors.blue,
                Colors.green,
                Colors.orange,
                Colors.red,
                Colors.amber,
              ],
              tooltipBehavior: TooltipBehavior(enable: true),
              series: FunnelSeries<ChartData, String>(
                dataSource: getChartData(),
                xValueMapper: (ChartData data, _) => data.stage,
                yValueMapper: (ChartData data, _) => data.value,
                dataLabelSettings: DataLabelSettings(
                  isVisible: true,
                  labelPosition: ChartDataLabelPosition.outside,
                  connectorLineSettings: ConnectorLineSettings(
                    type: ConnectorType.curve,
                    width: 2,
                    length: '15%',
                  ),
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                gapRatio: 0, // gap between sets
                neckWidth: '20%',
                neckHeight: '15%',
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<ChartData> getChartData() {
    return [
      ChartData(stage: 'Leads', value: 1000),
      ChartData(stage: 'Prospects', value: 500),
      ChartData(stage: 'Opportunities', value: 300),
      ChartData(stage: 'Negotiations', value: 150),
      ChartData(stage: 'Closed Deals', value: 100),
    ];
  }
}

class ChartData {
  final String stage;
  final double value;

  ChartData({required this.stage, required this.value});
}
