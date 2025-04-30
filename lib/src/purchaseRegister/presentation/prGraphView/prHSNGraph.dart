// Item Wise Graph

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CostCenterGraphModel extends StatefulWidget {
  const CostCenterGraphModel({super.key});

  @override
  State<CostCenterGraphModel> createState() => _CostCenterGraphModelState();
}

class _CostCenterGraphModelState extends State<CostCenterGraphModel> {
  int touchedIndex = -1;

  // Example data structure for HSNContent groups
  final List<HSNWise> HSNWises = [
    HSNWise(
      range: '0 - 5 Lakh',
      totalInvoiceValue: 400000.00,
      totalQty: 180,
      totalHSNContents: '10',
      HSNContents: [
        HSNContent(
          id: 'V001',
          HSNContentName: 'HSN Code A',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        HSNContent(
          id: 'V001',
          HSNContentName: 'HSN Code b',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        HSNContent(
          id: 'V001',
          HSNContentName: 'HSN Code c',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        HSNContent(
          id: 'V001',
          HSNContentName: 'HSN Code d',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        HSNContent(
          id: 'V001',
          HSNContentName: 'HSN Code e',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        HSNContent(
          id: 'V001',
          HSNContentName: 'HSN Code f',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        HSNContent(
          id: 'V001',
          HSNContentName: 'HSN Code g',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        HSNContent(
          id: 'V001',
          HSNContentName: 'HSN Code h',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        HSNContent(
          id: 'V001',
          HSNContentName: 'HSN Code i',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        HSNContent(
          id: 'V002',
          HSNContentName: 'HSN Code j',
          totalInvoiceValue: 150000.00,
          qty: 80,
        ),
      ],
    ),
    HSNWise(
      range: '5.1 - 10 Lakh',
      totalInvoiceValue: 1600000.00,
      totalQty: 320,
      totalHSNContents: '7',
      HSNContents: [
        HSNContent(
          id: 'V003',
          HSNContentName: 'HSN Code C',
          totalInvoiceValue: 900000.00,
          qty: 180,
        ),
        HSNContent(
          id: 'V004',
          HSNContentName: 'HSN Code D',
          totalInvoiceValue: 700000.00,
          qty: 140,
        ),
        HSNContent(
          id: 'V004',
          HSNContentName: 'HSN Code D',
          totalInvoiceValue: 700000.00,
          qty: 140,
        ),
        HSNContent(
          id: 'V004',
          HSNContentName: 'HSN Code D',
          totalInvoiceValue: 700000.00,
          qty: 140,
        ),
        HSNContent(
          id: 'V004',
          HSNContentName: 'HSN Code D',
          totalInvoiceValue: 700000.00,
          qty: 140,
        ),
        HSNContent(
          id: 'V004',
          HSNContentName: 'HSN Code D',
          totalInvoiceValue: 700000.00,
          qty: 140,
        ),
        HSNContent(
          id: 'V004',
          HSNContentName: 'HSN Code D',
          totalInvoiceValue: 700000.00,
          qty: 140,
        ),
      ],
    ),
    HSNWise(
      range: 'Above 10 Lakh',
      totalInvoiceValue: 1200000.00,
      totalQty: 200,
      totalHSNContents: '8',
      HSNContents: [
        HSNContent(
          id: 'V005',
          HSNContentName: 'HSN Code E',
          totalInvoiceValue: 1200000.00,
          qty: 200,
        ),
        HSNContent(
          id: 'V005',
          HSNContentName: 'HSN Code E',
          totalInvoiceValue: 1200000.00,
          qty: 200,
        ),
        HSNContent(
          id: 'V005',
          HSNContentName: 'HSN Code E',
          totalInvoiceValue: 1200000.00,
          qty: 200,
        ),
        HSNContent(
          id: 'V005',
          HSNContentName: 'HSN Code E',
          totalInvoiceValue: 1200000.00,
          qty: 200,
        ),
        HSNContent(
          id: 'V005',
          HSNContentName: 'HSN Code E',
          totalInvoiceValue: 1200000.00,
          qty: 200,
        ),
        HSNContent(
          id: 'V005',
          HSNContentName: 'HSN Code E',
          totalInvoiceValue: 1200000.00,
          qty: 200,
        ),
        HSNContent(
          id: 'V005',
          HSNContentName: 'HSN Code E',
          totalInvoiceValue: 1200000.00,
          qty: 200,
        ),
        HSNContent(
          id: 'V005',
          HSNContentName: 'HSN Code E',
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
                'HSN Graph',
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
                    sections: List.generate(HSNWises.length, (index) {
                      final group = HSNWises[index];
                      return PieChartSectionData(
                        color: yourColorPalette[
                            index], // Define a color palette for sections
                        value: group.totalInvoiceValue,
                        title: group.totalHSNContents,
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
                      'HSN Code in ${HSNWises[touchedIndex].range}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis
                          .horizontal, // Scroll horizontally if the table overflows
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text('HSN Code')),
                          DataColumn(label: Text('Invoice Value')),
                        ],
                        rows: HSNWises[touchedIndex]
                            .HSNContents
                            .map((HSNContent) {
                          return DataRow(
                            cells: [
                              DataCell(Text(HSNContent.HSNContentName)),
                              DataCell(
                                Text(
                                  '₹${HSNContent.totalInvoiceValue.toStringAsFixed(2)}',
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

class HSNContent {
  final String id;
  final String HSNContentName;
  final double totalInvoiceValue;
  final int qty;

  HSNContent({
    required this.id,
    required this.HSNContentName,
    required this.totalInvoiceValue,
    required this.qty,
  });
}

class HSNWise {
  final String range;
  final List<HSNContent> HSNContents;
  final double totalInvoiceValue;
  final int totalQty;
  final String totalHSNContents;

  HSNWise({
    required this.range,
    required this.HSNContents,
    required this.totalInvoiceValue,
    required this.totalQty,
    required this.totalHSNContents,
  });
}

final List<Color> yourColorPalette = [
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.deepPurple,
];
