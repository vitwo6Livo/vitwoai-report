import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:vitwoai_report/golobal-Widget/customPage-Route.dart';
import 'package:vitwoai_report/src/home/presentation/mainScreenWidget/pieChart/pieChartDetails.dart';
import 'package:vitwoai_report/src/settings/texts.dart';

class BumpChartWidget extends StatelessWidget {
  const BumpChartWidget({super.key});

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
                    HandText.stackedChartTitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    HandText.stackedChartSubTitle,
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
                        HandText.settings,
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
          title: const ChartTitle(text: 'Monthly Revenue Comparison'),
          legend: const Legend(isVisible: true),
          tooltipBehavior: TooltipBehavior(enable: true),
          primaryXAxis: const CategoryAxis(
            title: AxisTitle(text: 'Months'),
          ),
          primaryYAxis: const NumericAxis(
            title: AxisTitle(text: 'Revenue (in USD)'),
          ),
          series: <StackedLineSeries<SalesData, String>>[
            StackedLineSeries<SalesData, String>(
              dataSource: getChartData(),
              xValueMapper: (SalesData sales, _) => sales.month,
              yValueMapper: (SalesData sales, _) => sales.productA,
              name: 'Product A',
              markerSettings: const MarkerSettings(isVisible: true),
            ),
            StackedLineSeries<SalesData, String>(
              dataSource: getChartData(),
              xValueMapper: (SalesData sales, _) => sales.month,
              yValueMapper: (SalesData sales, _) => sales.productB,
              name: 'Product B',
              markerSettings: const MarkerSettings(isVisible: true),
            ),
            StackedLineSeries<SalesData, String>(
              dataSource: getChartData(),
              xValueMapper: (SalesData sales, _) => sales.month,
              yValueMapper: (SalesData sales, _) => sales.productC,
              name: 'Product C',
              markerSettings: const MarkerSettings(isVisible: true),
            ),
          ],
        )),
      ],
    );
  }
}

class SalesData {
  final String month;
  final double productA;
  final double productB;
  final double productC;

  SalesData(this.month, this.productA, this.productB, this.productC);
}

List<SalesData> getChartData() {
  return [
    SalesData('Jan', 35, 28, 34),
    SalesData('Feb', 28, 32, 26),
    SalesData('Mar', 34, 24, 30),
    SalesData('Apr', 32, 29, 28),
    SalesData('May', 40, 35, 32),
    SalesData('Jun', 45, 40, 38),
  ];
}
