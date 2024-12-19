import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:vitwoai_report/src/golobal-Widget/customPage-Route.dart';
import 'package:vitwoai_report/src/home/presentation/mainScreenWidget/pieChart/pieChartDetails.dart';

class CalendarChartWidget extends StatelessWidget {
  const CalendarChartWidget({super.key});

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
                    'Line Chart',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    'This is Line Chart',
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
            child: SfSparkLineChart(
          data: [30, 32, 33, 31, 29, 28, 34],
          color: Colors.blue,
          width: 2.0,
          marker: SparkChartMarker(
            displayMode: SparkChartMarkerDisplayMode.all,
          ),
          labelDisplayMode: SparkChartLabelDisplayMode.all,
          trackball: SparkChartTrackball(
            activationMode: SparkChartActivationMode.tap,
          ),
        )),
      ],
    );
  }
}
