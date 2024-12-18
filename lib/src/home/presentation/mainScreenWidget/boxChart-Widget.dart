import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';
import 'package:vitwoai_report/src/golobal-Widget/customPage-Route.dart';
import 'package:vitwoai_report/src/home/presentation/mainScreenWidget/pieChart/pieChartDetails.dart';

class BoxChartWidget extends StatelessWidget {
  const BoxChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_TreeData> data = [
      _TreeData('Electronics', 200, [
        _TreeData('Laptop', 2000),
        _TreeData('Mobile', 1500),
        _TreeData('Tablet', 1500),
      ]),
      _TreeData('Clothing', 800, [
        _TreeData('Men', 1500),
        _TreeData('Women', 1500),
      ]),
      _TreeData('Groceries', 600, [
        _TreeData('Fruits', 2000),
        _TreeData('Vegetables', 2000),
      ]),
      _TreeData('Masala', 500, [
        _TreeData('Fruits', 2000),
        _TreeData('Vegetables', 2000),
      ]),
      _TreeData('Water', 300, [
        _TreeData('Fruits', 2000),
        _TreeData('Vegetables', 2000),
      ]),
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
                      'Box Chart',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      'This is box Chart',
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
            child: SfTreemap(
              dataCount: data.length,
              weightValueMapper: (int index) => data[index].value.toDouble(),
              levels: [
                TreemapLevel(
                  groupMapper: (int index) => data[index].category,
                  color: Colors.blue.withOpacity(0.5),
                  labelBuilder: (BuildContext context, TreemapTile tile) {
                    return Text(tile.group,
                        style: TextStyle(color: Colors.white));
                  },
                  tooltipBuilder: (BuildContext context, TreemapTile tile) {
                    return Text('${tile.group}: ${tile.weight}');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TreeData {
  final String category;
  final int value;
  final List<_TreeData>? children;

  _TreeData(this.category, this.value, [this.children]);
}
