import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vitwoai_report/golobal-Widget/rangeCalendar.dart';
import 'package:vitwoai_report/golobal-Widget/shimmer_screen.dart';
import 'package:vitwoai_report/src/ageing/data/receivableAnalytics_repositry.dart';
import 'package:vitwoai_report/src/ageing/presentation/receivabledetailsScreen.dart';
import 'package:vitwoai_report/src/settings/colors.dart';
import 'package:vitwoai_report/src/settings/texts.dart';

final isClickedProviderReceivable = StateProvider<bool>((ref) => false);

class ReceivableAnalyticsScreen extends ConsumerWidget {
  const ReceivableAnalyticsScreen({super.key});

  void showDateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CustomDatePickerDialog(
        initialFromDate: DateTime.now(),
        initialToDate: DateTime.now(),
        onSave: (fromDate, toDate) {
          // Navigator.pop(context);
        },
      ),
    );
  }

  void showChartsPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  HandText.receivableChartsOverview,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.lightFontCpy,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(8),
                  child: const SizedBox(
                    height: 200,
                    child: PieChartWidget(),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.lightFontCpy,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(HandText.popUpCloseBttn),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final receivablesAsync = ref.watch(receivablesTotalDueProvider);
    final coustomerListProvider = ref.watch(receivablesCustomerProvider);

    return Scaffold(
      backgroundColor: AppColor.screenBgColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [AppColor.appBarColor1, AppColor.appBarColor2],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        HandText.receivableTitle,
                        style: TextStyle(
                          color: AppColor.lightFontCpy,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          // InkWell(
                          //   onTap: () {
                          //     isClickedNotifier.state =
                          //         !isClickedNotifier.state;
                          //   },
                          //   child: CircleAvatar(
                          //     backgroundColor:
                          //         isClicked ? Colors.amber : Colors.white,
                          //     child: const Icon(
                          //       Icons.push_pin,
                          //       color: Colors.black,
                          //     ),
                          //   ),
                          // ),
                          IconButton(
                              onPressed: () {
                                showDateDialog(context);
                              },
                              icon: Icon(
                                Icons.settings,
                                color: AppColor.lightFontCpy,
                              ))
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  receivablesAsync.when(
                    data: (data) {
                      // Ensure data is not null and contains the required keys
                      final totalOfTotalDue = data.TotalOfTotalDue.toString();
                      final totalOnAccountDue =
                          data.TotalOnAccountDue.toString();
                      final netDue = data.NetDue.toString();

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${HandText.inr}$totalOfTotalDue",
                            style: TextStyle(
                              color: AppColor.lightFontCpy,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                HandText.receivableOnAccountDue,
                                style: TextStyle(color: AppColor.lightFontCpy2),
                              ),
                              const Spacer(),
                              Text(
                                "${HandText.inr}$totalOnAccountDue",
                                style: TextStyle(color: AppColor.lightFontCpy),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                HandText.receivableNetDue,
                                style: TextStyle(color: AppColor.lightFontCpy2),
                              ),
                              const Spacer(),
                              Text(
                                "${HandText.inr}$netDue",
                                style: TextStyle(color: AppColor.lightFontCpy),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                    loading: () => Shimmer.fromColors(
                      baseColor: AppColor.shimmerBaseColor,
                      highlightColor: AppColor.shimmerHighlightColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 150,
                            height: 30,
                            decoration: BoxDecoration(
                              color: AppColor.shimmerBoxDecorationColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Container(
                                width: 100,
                                height: 15,
                                decoration: BoxDecoration(
                                  color: AppColor.shimmerDecorationColor,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                width: 80,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: AppColor.shimmerDecorationColor,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Container(
                                width: 60,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: AppColor.shimmerDecorationColor,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                width: 80,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: AppColor.shimmerDecorationColor,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    error: (error, stack) =>
                        Center(child: Text('${HandText.errorMessage} $error')),
                  ),
                ],
              ),
            ),
            Container(
              height: 80,
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: AppColor.lightFontCpy,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  coustomerListProvider.when(
                    data: (value) {
                      return Text(
                        "${HandText.totalRecords} ${value.totalElements.toString()}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      );
                    },
                    error: (error, stack) =>
                        Center(child: Text('${HandText.errorMessage} $error')),
                    loading: () => Text(HandText.loadingMessage),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 9,
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          height: 40,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: HandText.searchBox,
                              prefixIcon: const Icon(Icons.search),
                              border: const OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColor.searchOutlineColor,
                                  width: 2.0,
                                ),
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 8),
                            ),
                            cursorHeight: 20,
                            cursorColor: AppColor.cursonColor,
                          ),
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColor.cursonColor,
                            border: Border.all(color: AppColor.cursonColor),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child:
                              Icon(Icons.search, color: AppColor.lightFontCpy),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            coustomerListProvider.when(
              data: (data) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: data.content.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ReceivableDetailsScreen(
                                            data: data.content, index: index)));
                          },
                          child: Card(
                            color: AppColor.cardBackgroundColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data.content[index].customerName,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                            text:
                                                "${HandText.receivableCustomerCode} \n",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: AppColor.cardDataKeyColor,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: data
                                                    .content[index].customerCode
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: AppColor
                                                        .cardDataValueColor),
                                              )
                                            ]),
                                      ),
                                      Text.rich(
                                        TextSpan(
                                            text:
                                                "${HandText.receivableTotalDue} \n",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: AppColor.cardDataKeyColor,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: data
                                                    .content[index].totalDue
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: AppColor
                                                        .cardDataValueColor),
                                              )
                                            ]),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                            text:
                                                "${HandText.receivableOnAccountDue} \n",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: AppColor.cardDataKeyColor,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: data
                                                    .content[index].onAccountDue
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: AppColor
                                                        .cardDataValueColor),
                                              )
                                            ]),
                                      ),
                                      Text.rich(
                                        TextSpan(
                                            text:
                                                "${HandText.receivableNetDue} \n",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: AppColor.cardDataKeyColor,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: data.content[index].netDue
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: AppColor
                                                        .cardDataValueColor),
                                              )
                                            ]),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
              error: (error, stack) =>
                  Center(child: Text('${HandText.errorMessage} $error')),
              loading: () => screen_shimmer(120, 800),
            )
          ],
        ),
      ),
    );
  }
}

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(
            value: 40,
            color: Colors.blue,
            title: '40%',
            titleStyle: const TextStyle(fontSize: 14, color: Colors.white),
          ),
          PieChartSectionData(
            value: 30,
            color: Colors.green,
            title: '30%',
            titleStyle: const TextStyle(fontSize: 14, color: Colors.white),
          ),
          PieChartSectionData(
            value: 20,
            color: Colors.orange,
            title: '20%',
            titleStyle: const TextStyle(fontSize: 14, color: Colors.white),
          ),
          PieChartSectionData(
            value: 10,
            color: Colors.red,
            title: '10%',
            titleStyle: const TextStyle(fontSize: 14, color: Colors.white),
          ),
        ],
        sectionsSpace: 2,
        centerSpaceRadius: 40,
      ),
    );
  }
}
