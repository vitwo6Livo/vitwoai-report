import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:vitwoai_report/golobal-Widget/lineChartShimmer.dart';
import 'package:vitwoai_report/src/purchaseRegister/data/prGraphAPI.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitwoai_report/src/purchaseRegister/model/prGraphAllModel.dart';

class ProductGraphModel extends ConsumerStatefulWidget {
  const ProductGraphModel({super.key});

  @override
  ConsumerState<ProductGraphModel> createState() => _ProductGraphModelState();
}

class _ProductGraphModelState extends ConsumerState<ProductGraphModel> {
  bool showQty = true;
  String _selectedGraph = 'qty';

  @override
  Widget build(BuildContext context) {
    final PRGraphAll = ref.watch(prGraphAllProvider);

    return PRGraphAll.when(
      data: (data) {
        final filteredData = data.data
            .where((d) => d.TotalQty != 0 || d.TotalAmount != 0)
            .toList();
        return Card(
          color: Colors.white,
          surfaceTintColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'All Sales Register',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Radio<String>(
                            value: 'qty',
                            groupValue: _selectedGraph,
                            onChanged: (value) {
                              setState(() {
                                _selectedGraph = value!;
                              });
                            },
                          ),
                          const Text('Total Qty'),
                          Radio<String>(
                            value: 'amount',
                            groupValue: _selectedGraph,
                            onChanged: (value) {
                              setState(() {
                                _selectedGraph = value!;
                              });
                            },
                          ),
                          const Text('Total Amount'),
                        ],
                      ),
                      Column(
                        children: [
                          SfCartesianChart(
                            enableSideBySideSeriesPlacement: true,
                            plotAreaBackgroundColor: Colors.transparent,
                            primaryXAxis: const CategoryAxis(
                              axisLine: AxisLine(width: 0.5),
                              majorGridLines: MajorGridLines(width: 0),
                              majorTickLines: MajorTickLines(width: 0),
                            ),
                            primaryYAxis: const NumericAxis(isVisible: true),
                            series: <CartesianSeries>[
                              if (_selectedGraph == 'qty')
                                ColumnSeries<PrGraphAllContent, String>(
                                  name: 'Total Qty',
                                  dataSource: filteredData,

                                  color: Colors.blue,
                                  width: 0.4,
                                  spacing: 0.2,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                  ),
                                  xValueMapper: (PrGraphAllContent data, _) =>
                                      data.Month,
                                  yValueMapper: (PrGraphAllContent data, _) =>
                                      data.TotalQty,
                                  // emptyPointSettings: EmptyPointSettings(
                                  //   mode: EmptyPointMode
                                  //       .drop, // or .drop to remove it entirely
                                  //   color: Colors.transparent, // optional
                                  // ),
                                )
                              else
                                ColumnSeries<PrGraphAllContent, String>(
                                  name: 'Total Amount',
                                  dataSource: filteredData,
                                  color: Colors.green,
                                  // emptyPointSettings: EmptyPointSettings(),
                                  width: 0.4,
                                  spacing: 0.2,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                  ),
                                  xValueMapper: (PrGraphAllContent data, _) =>
                                      data.Month,
                                  yValueMapper: (PrGraphAllContent data, _) =>
                                      data.TotalAmount,
                                ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: filteredData.length,
                    itemBuilder: (context, index) {
                      return Card(
                          elevation: 4,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Total Quantity: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[500]),
                                    ),
                                    Text(
                                      filteredData[index].TotalQty.toString(),
                                      style: const TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      filteredData[index].Month.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Total Amount: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[500]),
                                    ),
                                    Text(
                                        filteredData[index]
                                            .TotalAmount
                                            .toString(),
                                        style: const TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                )
                              ],
                            ),
                          ));
                    }),
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
      loading: () => lineChartShimmer(),
    );
  }
}
