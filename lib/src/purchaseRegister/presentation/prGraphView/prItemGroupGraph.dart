// Item Group Wise Graph

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:vitwoai_report/golobal-Widget/graphShimmer.dart';
import 'package:vitwoai_report/src/purchaseRegister/data/prGraphAPI.dart';

class StorageLocationGraphModel extends ConsumerStatefulWidget {
  const StorageLocationGraphModel({super.key});

  @override
  ConsumerState<StorageLocationGraphModel> createState() =>
      _StorageLocationGraphModelState();
}

class _StorageLocationGraphModelState
    extends ConsumerState<StorageLocationGraphModel> {
  int touchedIndex = -1;

  final List<Color> yourColorPalette = [
    Colors.blue,
    Colors.green,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    final PRGraphItemGR = ref.watch(prGraphItemGRProvider);
    return SingleChildScrollView(
        child: PRGraphItemGR.when(
      data: (data) {
        return Card(
          color: Colors.white,
          surfaceTintColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Item Group Wise Graph',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 350,
                  width: 350,
                  child: PieChart(
                    PieChartData(
                      sectionsSpace: 2,
                      centerSpaceRadius: 40,
                      sections: List.generate(data.data.length, (index) {
                        return PieChartSectionData(
                          color: yourColorPalette[
                              index], // Define a color palette for sections
                          value: data.data[index].TotalInvoiceValue,
                          title: data.data[index].TotalItemGroups,
                          radius: touchedIndex == index ? 70 : 60,
                          titleStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        );
                      }),
                      pieTouchData: PieTouchData(
                        touchCallback: (event, response) {
                          if (!event.isInterestedForInteractions ||
                              response == null ||
                              response.touchedSection == null) return;
                          final index =
                              response.touchedSection!.touchedSectionIndex;
                          setState(() {
                            touchedIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                ListView.builder(
                    itemCount: yourColorPalette.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 10,
                                width: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: yourColorPalette[index],
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                '${data.data[index].range}',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    }),
                const SizedBox(height: 30),
                if (touchedIndex != -1)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Item Groups Range : ${data.data[touchedIndex].range}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(height: 16),
                      DataTable(
                        columns: const [
                          DataColumn(label: Text('Item Group Name')),
                          DataColumn(label: Text('Invoice Value')),
                        ],
                        rows: data.data[touchedIndex].ItemGroups.map((itemgr) {
                          return DataRow(
                            cells: [
                              DataCell(Text(
                                itemgr.groupName.toString(),
                                maxLines: 5,
                              )),
                              DataCell(
                                Text(
                                  '₹${itemgr.totalInvoiceValue.toString()}',
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        );
      },
      error: (error, stack) => Center(
        child: Center(
          child: LottieBuilder.asset(
            'assets/json/ErrorLoading.json',
            fit: BoxFit.fill,
            height: 550,
            width: 450,
          ),
        ),
      ),
      loading: () => graphShimmer(),
    ));
  }
}
