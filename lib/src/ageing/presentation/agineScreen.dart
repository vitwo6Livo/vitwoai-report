import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitwoai_report/golobal-Widget/dayCalendar.dart';
import 'package:vitwoai_report/src/sales_Register/presentation/detailsScreen.dart';

final isClickedProviderReceivable = StateProvider<bool>((ref) => false);

class ReceivableAnalyticsScreen extends ConsumerWidget {
  void showDateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => DayCalendarPickerDialog(
        initialFromDate: DateTime.now(),
        onSave: (fromDate) {},
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isClicked = ref.watch(isClickedProviderReceivable);
    print("hhhhhhhhhhhhhh${isClicked.toString()}");
    final isClickedNotifier = ref.read(isClickedProviderReceivable.notifier);
    return Scaffold(
      backgroundColor: Color(0xffff9f9f9),
      // backgroundColor: const Color.fromARGB(255, 215, 229, 239),
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
                          InkWell(
                            onTap: () {
                              isClickedNotifier.state =
                                  !isClickedNotifier.state;
                            },
                            child: CircleAvatar(
                              backgroundColor:
                                  isClicked ? Colors.amber : Colors.white,
                              child: const Icon(
                                Icons.push_pin,
                                color: Colors.black,
                              ),
                            ),
                          ),
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
                  const Text(
                    '\$54,431.32',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Text(
                        'Total Revenue',
                        style: TextStyle(color: Colors.white70),
                      ),
                      Spacer(),
                      Text(
                        '+35.5%',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Flexible(
              child: ListView(
                children: [
                  Card(
                    color: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Summary Report',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Collected Amount',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.orange,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '₹5,55,000',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text('55% of target'),
                                ],
                              ),
                              Container(
                                height: 40,
                                width: 100,
                                color: Colors.teal.shade200,
                                alignment: Alignment.center,
                                child: const Text('Bar Chart'),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Container(
                            height: 200,
                            color: Colors.teal.shade50,
                            alignment: Alignment.center,
                            child: LineChart(
                              LineChartData(
                                gridData: FlGridData(show: true),
                                titlesData: FlTitlesData(
                                  leftTitles: AxisTitles(
                                    sideTitles: SideTitles(showTitles: true),
                                  ),
                                  bottomTitles: AxisTitles(
                                    sideTitles: SideTitles(showTitles: true),
                                  ),
                                ),
                                borderData: FlBorderData(show: true),
                                lineBarsData: [
                                  LineChartBarData(
                                    spots: [
                                      FlSpot(0, 1),
                                      FlSpot(0.5, 2),
                                      FlSpot(1, 2.5),
                                      FlSpot(1.5, 3.8),
                                      FlSpot(2, 3),
                                      FlSpot(2.5, 4.5),
                                      FlSpot(3, 4),
                                      FlSpot(3.5, 5),
                                    ],
                                    // isCurved: true,
                                    color: Colors.blue,
                                    barWidth: 1,
                                    // isStrokeCapRound: true,
                                    belowBarData: BarAreaData(show: false),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsScreen()));
                    },
                    child: const Card(
                      color: Colors.white,
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                        title: Text("Customer"),
                        subtitle: Text(
                          "21/10/2022 - 30/08/2024",
                          style: TextStyle(fontSize: 12),
                        ),
                        trailing: Text("150"),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsScreen()));
                    },
                    child: const Card(
                      color: Colors.white,
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Icon(Icons.multiline_chart),
                        ),
                        title: Text("Total Due"),
                        subtitle: Text(
                          "21/10/2022 - 30/08/2024",
                          style: TextStyle(fontSize: 12),
                        ),
                        trailing: Text("₹35400.00"),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsScreen()));
                    },
                    child: const Card(
                      color: Colors.white,
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Icon(Icons.equalizer),
                        ),
                        title: Text("On Account Due"),
                        subtitle: Text(
                          "21/10/2022 - 30/08/2024",
                          style: TextStyle(fontSize: 12),
                        ),
                        trailing: Text("₹750000.0"),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsScreen()));
                    },
                    child: const Card(
                      color: Colors.white,
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Icon(Icons.query_stats),
                        ),
                        title: Text("Net Due"),
                        subtitle: Text(
                          "21/10/2022 - 30/08/2024",
                          style: TextStyle(fontSize: 12),
                        ),
                        trailing: Text("₹15000.20"),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
