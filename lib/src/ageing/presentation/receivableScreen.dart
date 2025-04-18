import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vitwoai_report/golobal-Widget/rangeCalendar.dart';
import 'package:vitwoai_report/golobal-Widget/shimmer_screen.dart';
import 'package:vitwoai_report/src/ageing/data/receivableAnalytics_repositry.dart';
import 'package:vitwoai_report/src/ageing/presentation/receivabledetailsScreen.dart';

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
                const Text(
                  'Charts Overview',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Close'),
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
      backgroundColor: const Color(0xffff9f9f9),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xfff759bec), Color(0xfff4e3986)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                borderRadius: BorderRadius.only(
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
                      const Text(
                        'Receivable Analytics',
                        style: TextStyle(
                          color: Colors.white,
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
                              icon: const Icon(
                                Icons.settings,
                                color: Colors.white,
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
                            "₹$totalOfTotalDue",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Text(
                                'On account due',
                                style: TextStyle(color: Colors.white70),
                              ),
                              const Spacer(),
                              Text(
                                "₹$totalOnAccountDue",
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Text(
                                'Net due',
                                style: TextStyle(color: Colors.white70),
                              ),
                              const Spacer(),
                              Text(
                                "₹$netDue",
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                    loading: () => Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 150,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
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
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                width: 80,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
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
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                width: 80,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    error: (error, stack) =>
                        Center(child: Text('Error: $error')),
                  ),
                ],
              ),
            ),
            Container(
              height: 80,
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  coustomerListProvider.when(
                    data: (value) {
                      return Text(
                        "Total Records: ${value.totalElements.toString()}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      );
                    },
                    error: (error, stack) =>
                        Center(child: Text('Error: $error')),
                    loading: () => const Text("Loding.."),
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
                          child: const TextField(
                            decoration: InputDecoration(
                              hintText: "Search",
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 104, 181, 244),
                                  width: 2.0,
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 8),
                            ),
                            cursorHeight: 20,
                            cursorColor: Colors.blue,
                          ),
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Icon(Icons.search, color: Colors.white),
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
                            color: Colors.white,
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
                                            text: "Customer Code: \n",
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: data
                                                    .content[index].customerCode
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                              )
                                            ]),
                                      ),
                                      Text.rich(
                                        TextSpan(
                                            text: "Total Due: \n",
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: data
                                                    .content[index].totalDue
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
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
                                            text: "On Account Due: \n",
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: data
                                                    .content[index].onAccountDue
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                              )
                                            ]),
                                      ),
                                      Text.rich(
                                        TextSpan(
                                            text: "Net Due: \n",
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: data.content[index].netDue
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
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
              error: (error, stack) => Center(child: Text('Error: $error')),
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
