// ignore_for_file: use_full_hex_values_for_flutter_colors, file_names

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../../golobal-Widget/customPage-Route.dart';
import 'pieChartDetails.dart';

class PieChartWidget extends StatefulWidget {
  const PieChartWidget({super.key});

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Column(
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
                      'Pie Chart',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      'This is Pie Chart',
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
          AspectRatio(
            aspectRatio: 2.3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: 150,
                  child: PieChart(
                    PieChartData(
                      pieTouchData: PieTouchData(
                        touchCallback: (FlTouchEvent event, pieTouchResponse) {
                          setState(() {
                            if (!event.isInterestedForInteractions ||
                                pieTouchResponse == null ||
                                pieTouchResponse.touchedSection == null) {
                              touchedIndex = -1;
                              return;
                            }
                            touchedIndex = pieTouchResponse
                                .touchedSection!.touchedSectionIndex;
                          });
                        },
                      ),
                      borderData: FlBorderData(show: false),
                      sectionsSpace: 0,
                      centerSpaceRadius: 35,
                      sections: showingSections(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 0),
                  child: SizedBox(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Container(
                              height: 16,
                              width: 16,
                              decoration: const BoxDecoration(
                                color: Color(0xffffdd03f),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Flutter (25%)',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Container(
                              height: 16,
                              width: 16,
                              decoration: const BoxDecoration(
                                color: Color(0xfff4cc8ff),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Java (20%)',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Container(
                              height: 16,
                              width: 16,
                              decoration: const BoxDecoration(
                                color: Color(0xfffff724a),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'CSS (15%)',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Container(
                              height: 16,
                              width: 16,
                              decoration: const BoxDecoration(
                                color: Color(0xfff9b7be8),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'HTML (15%)',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Container(
                              height: 16,
                              width: 16,
                              decoration: const BoxDecoration(
                                color: Color(0xfff5ae3b7),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'AWS (18%)',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Container(
                              height: 16,
                              width: 16,
                              decoration: const BoxDecoration(
                                color: Color(0xffff6424d),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Kotlin (09%)',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(6, (i) {
      final isTouched = i == touchedIndex;
      // final fontSize = isTouched ? 20.0 : 10.0;
      final radius = isTouched ? 40.0 : 30.0;
      // const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xffffdd03f),
            value: 25,
            radius: radius,
            title: '',
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff4cc8ff),
            value: 20,
            title: '',
            radius: radius,
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xfffff724a),
            value: 15,
            radius: radius,
            title: '',
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xfff9b7be8),
            value: 15,
            title: '',
            radius: radius,
          );
        case 4:
          return PieChartSectionData(
            color: const Color(0xfff5ae3b7),
            value: 18,
            title: '',
            radius: radius,
          );
        case 5:
          return PieChartSectionData(
            color: const Color(0xffff6424d),
            value: 9,
            title: '',
            radius: radius,
          );
        default:
          throw Error();
      }
    });
  }
}
