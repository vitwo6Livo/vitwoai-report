// Item Wise Graph

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class POGraphModel extends StatefulWidget {
  const POGraphModel({super.key});

  @override
  State<POGraphModel> createState() => _POGraphModelState();
}

class _POGraphModelState extends State<POGraphModel> {
  int touchedIndex = -1;

  // Example data structure for POContent groups
  final List<POWise> POWises = [
    POWise(
      range: '0 - 5 Lakh',
      totalInvoiceValue: 400000.00,
      totalQty: 180,
      totalPOContents: '10',
      POContents: [
        POContent(
          id: 'V001',
          POContentName: 'PO A',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        POContent(
          id: 'V001',
          POContentName: 'PO b',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        POContent(
          id: 'V001',
          POContentName: 'PO c',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        POContent(
          id: 'V001',
          POContentName: 'PO d',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        POContent(
          id: 'V001',
          POContentName: 'PO e',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        POContent(
          id: 'V001',
          POContentName: 'PO f',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        POContent(
          id: 'V001',
          POContentName: 'PO g',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        POContent(
          id: 'V001',
          POContentName: 'PO h',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        POContent(
          id: 'V001',
          POContentName: 'PO i',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        POContent(
          id: 'V002',
          POContentName: 'PO j',
          totalInvoiceValue: 150000.00,
          qty: 80,
        ),
      ],
    ),
    POWise(
      range: '5.1 - 10 Lakh',
      totalInvoiceValue: 1600000.00,
      totalQty: 320,
      totalPOContents: '7',
      POContents: [
        POContent(
          id: 'V003',
          POContentName: 'PO C',
          totalInvoiceValue: 900000.00,
          qty: 180,
        ),
        POContent(
          id: 'V004',
          POContentName: 'PO D',
          totalInvoiceValue: 700000.00,
          qty: 140,
        ),
        POContent(
          id: 'V004',
          POContentName: 'PO D',
          totalInvoiceValue: 700000.00,
          qty: 140,
        ),
        POContent(
          id: 'V004',
          POContentName: 'PO D',
          totalInvoiceValue: 700000.00,
          qty: 140,
        ),
        POContent(
          id: 'V004',
          POContentName: 'PO D',
          totalInvoiceValue: 700000.00,
          qty: 140,
        ),
        POContent(
          id: 'V004',
          POContentName: 'PO D',
          totalInvoiceValue: 700000.00,
          qty: 140,
        ),
        POContent(
          id: 'V004',
          POContentName: 'PO D',
          totalInvoiceValue: 700000.00,
          qty: 140,
        ),
      ],
    ),
    POWise(
      range: 'Above 10 Lakh',
      totalInvoiceValue: 1200000.00,
      totalQty: 200,
      totalPOContents: '8',
      POContents: [
        POContent(
          id: 'V005',
          POContentName: 'PO E',
          totalInvoiceValue: 1200000.00,
          qty: 200,
        ),
        POContent(
          id: 'V005',
          POContentName: 'PO E',
          totalInvoiceValue: 1200000.00,
          qty: 200,
        ),
        POContent(
          id: 'V005',
          POContentName: 'PO E',
          totalInvoiceValue: 1200000.00,
          qty: 200,
        ),
        POContent(
          id: 'V005',
          POContentName: 'PO E',
          totalInvoiceValue: 1200000.00,
          qty: 200,
        ),
        POContent(
          id: 'V005',
          POContentName: 'PO E',
          totalInvoiceValue: 1200000.00,
          qty: 200,
        ),
        POContent(
          id: 'V005',
          POContentName: 'PO E',
          totalInvoiceValue: 1200000.00,
          qty: 200,
        ),
        POContent(
          id: 'V005',
          POContentName: 'PO E',
          totalInvoiceValue: 1200000.00,
          qty: 200,
        ),
        POContent(
          id: 'V005',
          POContentName: 'PO E',
          totalInvoiceValue: 1200000.00,
          qty: 200,
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Purchase Order Graph',
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
                    sections: List.generate(POWises.length, (index) {
                      final group = POWises[index];
                      return PieChartSectionData(
                        color: yourColorPalette[
                            index], // Define a color palette for sections
                        value: group.totalInvoiceValue,
                        title: group.totalPOContents,
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
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 10,
                        width: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        '0 - 5 Lakh',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 10,
                        width: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        '5.1 - 10 Lakh',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 10,
                        width: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        'Above 10 Lakh',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              if (touchedIndex != -1)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PO Between ${POWises[touchedIndex].range}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis
                          .horizontal, // Scroll horizontally if the table overflows
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text('PO Number')),
                          DataColumn(label: Text('Invoice Value')),
                        ],
                        rows: POWises[touchedIndex].POContents.map((POContent) {
                          return DataRow(
                            cells: [
                              DataCell(Text(POContent.POContentName)),
                              DataCell(
                                Text(
                                  '₹${POContent.totalInvoiceValue.toStringAsFixed(2)}',
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class POContent {
  final String id;
  final String POContentName;
  final double totalInvoiceValue;
  final int qty;

  POContent({
    required this.id,
    required this.POContentName,
    required this.totalInvoiceValue,
    required this.qty,
  });
}

class POWise {
  final String range;
  final List<POContent> POContents;
  final double totalInvoiceValue;
  final int totalQty;
  final String totalPOContents;

  POWise({
    required this.range,
    required this.POContents,
    required this.totalInvoiceValue,
    required this.totalQty,
    required this.totalPOContents,
  });
}

final List<Color> yourColorPalette = [
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.deepPurple,
];
