import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class SalesAnalyticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xffff2f2f2),
      backgroundColor: const Color.fromARGB(255, 215, 229, 239),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Section
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
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
                      Text(
                        'Receivable Analytics',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                      )
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    '\$54,431.32',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
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
            SizedBox(
              height: 5,
            ),
            Flexible(
              child: ListView(
                children: [
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Summary Report',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
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
                                child: Text('Bar Chart'),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
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
                  Card(
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
                  Card(
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
                  Card(
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
                  Card(
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
