import 'package:flutter/material.dart';

import 'package:vitwoai_report/src/golobal-Widget/customPage-Route.dart';
import 'package:vitwoai_report/src/home/presentation/mainScreenWidget/pieChart/pieChartDetails.dart';

class HeatChartWidget extends StatelessWidget {
  const HeatChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<List<int>> heatmapData = [
      [5, 10, 3, 8],
      [7, 15, 20, 10],
      [4, 12, 18, 25],
      [8, 9, 11, 14],
    ];
    return Expanded(
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
                      'Heatmap Chart',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      'This is Heatmap Chart',
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
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: heatmapData[0].length,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemCount: heatmapData.length * heatmapData[0].length,
              itemBuilder: (context, index) {
                int row = index ~/ heatmapData[0].length;
                int col = index % heatmapData[0].length;

                int value = heatmapData[row][col];
                return Container(
                  color: Colors.blue
                      .withOpacity(value / 25), // Dynamic color based on value
                  child: Center(
                    child: Text(
                      '$value',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
