// Item Group Graph
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StorageLocationGraphModel extends StatefulWidget {
  const StorageLocationGraphModel({super.key});

  @override
  State<StorageLocationGraphModel> createState() =>
      _StorageLocationGraphModelState();
}

class _StorageLocationGraphModelState extends State<StorageLocationGraphModel> {
  int touchedIndex = -1;

  // Example data structure for ItemGroupContent groups
  final List<ItemGroupWise> ItemGroupWises = [
    ItemGroupWise(
      range: '0 - 5 Lakh',
      totalInvoiceValue: 400000.00,
      totalQty: 180,
      totalItemGroupContents: '10',
      ItemGroupContents: [
        ItemGroupContent(
          ItemGroupContentName: 'ItemGroup A',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        ItemGroupContent(
          ItemGroupContentName: 'ItemGroup b',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        ItemGroupContent(
          ItemGroupContentName: 'ItemGroup c',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        ItemGroupContent(
          ItemGroupContentName: 'ItemGroup d',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        ItemGroupContent(
          ItemGroupContentName: 'ItemGroup e',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        ItemGroupContent(
          ItemGroupContentName: 'ItemGroup f',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        ItemGroupContent(
          ItemGroupContentName: 'ItemGroup g',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        ItemGroupContent(
          ItemGroupContentName: 'ItemGroup h',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        ItemGroupContent(
          ItemGroupContentName: 'ItemGroup i',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        ItemGroupContent(
          ItemGroupContentName: 'ItemGroup j',
          totalInvoiceValue: 150000.00,
          qty: 80,
        ),
      ],
    ),
    ItemGroupWise(
      range: '5.1 - 10 Lakh',
      totalInvoiceValue: 1600000.00,
      totalQty: 320,
      totalItemGroupContents: '7',
      ItemGroupContents: [
        ItemGroupContent(
          ItemGroupContentName: 'ItemGroup C',
          totalInvoiceValue: 900000.00,
          qty: 180,
        ),
        ItemGroupContent(
          ItemGroupContentName: 'ItemGroup D',
          totalInvoiceValue: 700000.00,
          qty: 140,
        ),
        ItemGroupContent(
          ItemGroupContentName: 'ItemGroup D',
          totalInvoiceValue: 700000.00,
          qty: 140,
        ),
        ItemGroupContent(
          ItemGroupContentName: 'ItemGroup D',
          totalInvoiceValue: 700000.00,
          qty: 140,
        ),
        ItemGroupContent(
          ItemGroupContentName: 'ItemGroup D',
          totalInvoiceValue: 700000.00,
          qty: 140,
        ),
        ItemGroupContent(
          ItemGroupContentName: 'ItemGroup D',
          totalInvoiceValue: 700000.00,
          qty: 140,
        ),
        ItemGroupContent(
          ItemGroupContentName: 'ItemGroup D',
          totalInvoiceValue: 700000.00,
          qty: 140,
        ),
      ],
    ),
    ItemGroupWise(
      range: 'Above 10 Lakh',
      totalInvoiceValue: 1200000.00,
      totalQty: 200,
      totalItemGroupContents: '8',
      ItemGroupContents: [
        ItemGroupContent(
          ItemGroupContentName: 'ItemGroup E',
          totalInvoiceValue: 1200000.00,
          qty: 200,
        ),
        ItemGroupContent(
          ItemGroupContentName: 'ItemGroup E',
          totalInvoiceValue: 1200000.00,
          qty: 200,
        ),
        ItemGroupContent(
          ItemGroupContentName: 'ItemGroup E',
          totalInvoiceValue: 1200000.00,
          qty: 200,
        ),
        ItemGroupContent(
          ItemGroupContentName: 'ItemGroup E',
          totalInvoiceValue: 1200000.00,
          qty: 200,
        ),
        ItemGroupContent(
          ItemGroupContentName: 'ItemGroup E',
          totalInvoiceValue: 1200000.00,
          qty: 200,
        ),
        ItemGroupContent(
          ItemGroupContentName: 'ItemGroup E',
          totalInvoiceValue: 1200000.00,
          qty: 200,
        ),
        ItemGroupContent(
          ItemGroupContentName: 'ItemGroup E',
          totalInvoiceValue: 1200000.00,
          qty: 200,
        ),
        ItemGroupContent(
          ItemGroupContentName: 'ItemGroup E',
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
                'Item Group Graph',
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
                    sections: List.generate(ItemGroupWises.length, (index) {
                      final group = ItemGroupWises[index];
                      return PieChartSectionData(
                        color: yourColorPalette[
                            index], // Define a color palette for sections
                        value: group.totalInvoiceValue,
                        title: group.totalItemGroupContents,
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
                      'Item Group Between ${ItemGroupWises[touchedIndex].range}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis
                          .horizontal, // Scroll horizontally if the table overflows
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text('Item Group Name')),
                          DataColumn(label: Text('Invoice Value')),
                        ],
                        rows: ItemGroupWises[touchedIndex]
                            .ItemGroupContents
                            .map((ItemGroupContent) {
                          return DataRow(
                            cells: [
                              DataCell(
                                  Text(ItemGroupContent.ItemGroupContentName)),
                              DataCell(
                                Text(
                                  '₹${ItemGroupContent.totalInvoiceValue.toStringAsFixed(2)}',
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

class ItemGroupContent {
  final String ItemGroupContentName;
  final double totalInvoiceValue;
  final int qty;

  ItemGroupContent({
    required this.ItemGroupContentName,
    required this.totalInvoiceValue,
    required this.qty,
  });
}

class ItemGroupWise {
  final String range;
  final List<ItemGroupContent> ItemGroupContents;
  final double totalInvoiceValue;
  final int totalQty;
  final String totalItemGroupContents;

  ItemGroupWise({
    required this.range,
    required this.ItemGroupContents,
    required this.totalInvoiceValue,
    required this.totalQty,
    required this.totalItemGroupContents,
  });
}

final List<Color> yourColorPalette = [
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.deepPurple,
];
