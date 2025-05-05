import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:vitwoai_report/src/purchaseRegister/data/prGraphAPI.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitwoai_report/src/purchaseRegister/model/prGraphAllModel.dart';

class ProductGraphModel extends ConsumerStatefulWidget {
  const ProductGraphModel({super.key});

  @override
  ConsumerState<ProductGraphModel> createState() => _ProductGraphModelState();
}

class _ProductGraphModelState extends ConsumerState<ProductGraphModel> {
  @override
  Widget build(BuildContext context) {
    final PRGraphAll = ref.watch(prGraphAllProvider);
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
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
            PRGraphAll.when(
              data: (data) {
                return SfCartesianChart(
                  plotAreaBackgroundColor: Colors.transparent,
                  margin: const EdgeInsets.all(0),
                  borderColor: Colors.transparent,
                  borderWidth: 0,
                  plotAreaBorderWidth: 0,
                  enableSideBySideSeriesPlacement: true,
                  primaryXAxis: const CategoryAxis(
                    axisLine: AxisLine(width: 0.5),
                    majorGridLines: MajorGridLines(width: 0),
                    majorTickLines: MajorTickLines(width: 0),
                    crossesAt: 0,
                  ),
                  primaryYAxis: const NumericAxis(
                    isVisible: true,
                    // minimum: 0,
                    // maximum: 2,
                    // interval: 0.5,
                  ),
                  series: <CartesianSeries>[
                    ColumnSeries<PrGraphAllContent, String>(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      dataSource: data.data,
                      width: 0.5,
                      color: Colors.blue,
                      xValueMapper: (PrGraphAllContent data, _) => data.Month,
                      yValueMapper: (PrGraphAllContent data, _) =>
                          data.TotalQty,
                    ),
                    ColumnSeries<PrGraphAllContent, String>(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      dataSource: data.data,
                      width: 0.5,
                      color: Colors.green,
                      xValueMapper: (PrGraphAllContent data, _) => data.Month,
                      yValueMapper: (PrGraphAllContent data, _) =>
                          data.TotalAmount,
                    ),
                  ],
                );
              },
              error: (error, stack) => Center(child: Text('Error: $error')),
              loading: () => const CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}

// class ChartColumnData {
//   ChartColumnData({this.x, this.y, this.y1});
//   final String? x;
//   final double? y;
//   final double? y1;
// }

// final List<ChartColumnData> chartData = <ChartColumnData>[
//   ChartColumnData(x: 'Mo', y: -0.3, y1: 1.7),
//   ChartColumnData(x: "Tu", y: -0.5, y1: 0.4),
//   ChartColumnData(x: "We", y: -0.4, y1: 1),
//   ChartColumnData(x: "Th", y: -0.45, y1: 0.7),
//   ChartColumnData(x: "Fr", y: -0.9, y1: 0.8),
//   ChartColumnData(x: "Sa", y: -0.6, y1: 0.9),
//   ChartColumnData(x: "Su", y: -0.5, y1: 1),
// ];

final List<PrGraphAllModel> chartData = <PrGraphAllModel>[];
