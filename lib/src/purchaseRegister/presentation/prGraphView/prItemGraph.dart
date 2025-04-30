// Item Wise Graph

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class FunctionalAreaGraphModel extends StatefulWidget {
  const FunctionalAreaGraphModel({super.key});

  @override
  State<FunctionalAreaGraphModel> createState() =>
      _FunctionalAreaGraphModelState();
}

class _FunctionalAreaGraphModelState extends State<FunctionalAreaGraphModel> {
  int touchedIndex = -1;

  // Example data structure for ItemContent groups
  final List<ItemWise> ItemWises = [
    ItemWise(
      range: '0 - 5 Lakh',
      totalInvoiceValue: 400000.00,
      totalQty: 180,
      totalItemContents: '10',
      ItemContents: [
        ItemContent(
          id: 'V001',
          ItemContentName: 'Item A',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        ItemContent(
          id: 'V001',
          ItemContentName: 'Item b',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        ItemContent(
          id: 'V001',
          ItemContentName: 'Itemc',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        ItemContent(
          id: 'V001',
          ItemContentName: 'Item d',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        ItemContent(
          id: 'V001',
          ItemContentName: 'Item e',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        ItemContent(
          id: 'V001',
          ItemContentName: 'Item f',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        ItemContent(
          id: 'V001',
          ItemContentName: 'Item g',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        ItemContent(
          id: 'V001',
          ItemContentName: 'Item h',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        ItemContent(
          id: 'V001',
          ItemContentName: 'Item i',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        ItemContent(
          id: 'V002',
          ItemContentName: 'Item j',
          totalInvoiceValue: 150000.00,
          qty: 80,
        ),
      ],
    ),
    ItemWise(
      range: '5.1 - 10 Lakh',
      totalInvoiceValue: 1600000.00,
      totalQty: 320,
      totalItemContents: '7',
      ItemContents: [
        ItemContent(
          id: 'V003',
          ItemContentName: 'Item C',
          totalInvoiceValue: 900000.00,
          qty: 180,
        ),
        ItemContent(
          id: 'V004',
          ItemContentName: 'Item D',
          totalInvoiceValue: 700000.00,
          qty: 140,
        ),
        ItemContent(
          id: 'V004',
          ItemContentName: 'Item D',
          totalInvoiceValue: 700000.00,
          qty: 140,
        ),
        ItemContent(
          id: 'V004',
          ItemContentName: 'Item D',
          totalInvoiceValue: 700000.00,
          qty: 140,
        ),
        ItemContent(
          id: 'V004',
          ItemContentName: 'Item D',
          totalInvoiceValue: 700000.00,
          qty: 140,
        ),
        ItemContent(
          id: 'V004',
          ItemContentName: 'Item D',
          totalInvoiceValue: 700000.00,
          qty: 140,
        ),
        ItemContent(
          id: 'V004',
          ItemContentName: 'Item D',
          totalInvoiceValue: 700000.00,
          qty: 140,
        ),
      ],
    ),
    ItemWise(
      range: 'Above 10 Lakh',
      totalInvoiceValue: 1200000.00,
      totalQty: 200,
      totalItemContents: '8',
      ItemContents: [
        ItemContent(
          id: 'V005',
          ItemContentName: 'Item E',
          totalInvoiceValue: 1200000.00,
          qty: 200,
        ),
        ItemContent(
          id: 'V005',
          ItemContentName: 'Item E',
          totalInvoiceValue: 1200000.00,
          qty: 200,
        ),
        ItemContent(
          id: 'V005',
          ItemContentName: 'Item E',
          totalInvoiceValue: 1200000.00,
          qty: 200,
        ),
        ItemContent(
          id: 'V005',
          ItemContentName: 'Item E',
          totalInvoiceValue: 1200000.00,
          qty: 200,
        ),
        ItemContent(
          id: 'V005',
          ItemContentName: 'Item E',
          totalInvoiceValue: 1200000.00,
          qty: 200,
        ),
        ItemContent(
          id: 'V005',
          ItemContentName: 'Item E',
          totalInvoiceValue: 1200000.00,
          qty: 200,
        ),
        ItemContent(
          id: 'V005',
          ItemContentName: 'Item E',
          totalInvoiceValue: 1200000.00,
          qty: 200,
        ),
        ItemContent(
          id: 'V005',
          ItemContentName: 'Item E',
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
                'Item Wise Graph',
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
                    sections: List.generate(ItemWises.length, (index) {
                      final group = ItemWises[index];
                      return PieChartSectionData(
                        color: yourColorPalette[
                            index], // Define a color palette for sections
                        value: group.totalInvoiceValue,
                        title: group.totalItemContents,
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
                      'Items in ${ItemWises[touchedIndex].range}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis
                          .horizontal, // Scroll horizontally if the table overflows
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text('Item Name')),
                          DataColumn(label: Text('Invoice Value')),
                        ],
                        rows: ItemWises[touchedIndex]
                            .ItemContents
                            .map((ItemContent) {
                          return DataRow(
                            cells: [
                              DataCell(Text(ItemContent.ItemContentName)),
                              DataCell(
                                Text(
                                  '₹${ItemContent.totalInvoiceValue.toStringAsFixed(2)}',
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

class ItemContent {
  final String id;
  final String ItemContentName;
  final double totalInvoiceValue;
  final int qty;

  ItemContent({
    required this.id,
    required this.ItemContentName,
    required this.totalInvoiceValue,
    required this.qty,
  });
}

class ItemWise {
  final String range;
  final List<ItemContent> ItemContents;
  final double totalInvoiceValue;
  final int totalQty;
  final String totalItemContents;

  ItemWise({
    required this.range,
    required this.ItemContents,
    required this.totalInvoiceValue,
    required this.totalQty,
    required this.totalItemContents,
  });
}

final List<Color> yourColorPalette = [
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.deepPurple,
];
