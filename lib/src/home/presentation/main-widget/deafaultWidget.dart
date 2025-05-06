import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vitwoai_report/golobal-Widget/rangeCalendar.dart';
import 'package:vitwoai_report/src/home/data/dashboardDataFatch.dart';
import 'package:vitwoai_report/src/home/presentation/main-widget/productWidget.dart';
import 'package:vitwoai_report/src/home/presentation/main-widget/progresWidget.dart';
import 'package:vitwoai_report/src/home/presentation/main-widget/regionWidget.dart';
import 'package:vitwoai_report/src/sales_Register/presentation/shimmer_summary.dart';
import 'package:vitwoai_report/src/settings/colors.dart';
import 'package:vitwoai_report/src/settings/texts.dart';

class Deafaultwidget extends ConsumerWidget {
  const Deafaultwidget({super.key});

  void showDateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CustomDatePickerDialog(
        initialFromDate: DateTime.now(),
        initialToDate: DateTime.now(),
        onSave: (fromDate, toDate) {
          print('fromDate: $fromDate, toDate: $toDate');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalSalesData = ref.watch(totalSalesProvider);
    final totalPurches = ref.watch(totalPurchesProvider);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double verticalPadding = screenHeight * 0.05;
    double horizontalPadding = screenWidth * 0.03;
    return Scaffold(
      // drawer: const AppDrawer(selectedSettings: []),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: screenHeight * 0.33,
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  height: 180,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColor.appBarColor1, AppColor.appBarColor2],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                        vertical: verticalPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          HandText.welcome,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: AppColor.appbarFont, fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.10,
                  left: 10,
                  right: 10,
                  child: Card(
                    color: Colors.white,
                    elevation: 4,
                    child: Padding(
                      padding: EdgeInsets.all(screenHeight * 0.03),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            HandText.summary,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontSize: 18),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              totalSalesData.when(data: (data) {
                                final totalSales =
                                    data['percentage'].toInt() ?? 0;

                                return CircularChart(
                                    'Sales', totalSales, 100, totalSales);
                              }, error: (error, stackTrace) {
                                return Text(
                                  'Error: $error',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontSize: 20,
                                          color: AppColor.appbarFont),
                                );
                              }, loading: () {
                                return Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Container(
                                    width: 100,
                                    height: 20,
                                    color: Colors.white,
                                  ),
                                );
                              }),
                              CircularChart('Revenue', 26, 100, 26),
                              CircularChart('growth', 14, 100, 14),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.028),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [AppColor.raisedCard1, AppColor.raisedCard2],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: ListTile(
                    title: totalPurches.when(data: (data) {
                      final totalSales = data['totalPurchase'] ?? 0;
                      return Text(
                        "₹${totalSales.toString()}",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppColor.lightFontCpy),
                      );
                    }, error: (error, stackTrace) {
                      return Text(
                        'Error: $error',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 20, color: AppColor.lightFontCpy),
                      );
                    }, loading: () {
                      return ShimmerSummary();
                    }),
                    subtitle: Text(
                      HandText.raised,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColor.lightFontCpy),
                    ),
                    trailing:
                        Icon(Icons.trending_up, color: AppColor.appBarIcon),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [AppColor.itemCard1, AppColor.itemCard2],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: ListTile(
                    title: totalSalesData.when(data: (data) {
                      final totalSales = data['totalSales'] ?? 0;
                      return Text(
                        "₹${totalSales.toString()}",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppColor.lightFontCpy),
                      );
                    }, error: (error, stackTrace) {
                      return Text(
                        'Error: $error',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 20, color: AppColor.lightFontCpy),
                      );
                    }, loading: () {
                      return ShimmerSummary();
                    }),
                    subtitle: Text(
                      HandText.item,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColor.lightFontCpy),
                    ),
                    trailing: Icon(Icons.edit, color: AppColor.appBarIcon),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const ProductWidget(),
          const SizedBox(height: 10),
          const RegionWidget(),
        ]),
      ),
    );
  }
}
