import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class VendorGraphModel extends StatefulWidget {
  const VendorGraphModel({super.key});

  @override
  State<VendorGraphModel> createState() => _VendorGraphModelState();
}

class _VendorGraphModelState extends State<VendorGraphModel> {
  int touchedIndex = -1;

  // Example data structure for vendor groups
  final List<VendorGroup> vendorGroups = [
    VendorGroup(
      range: '0 - 5 Lakh',
      totalInvoiceValue: 400000.00,
      totalQty: 180,
      totalVendors: '10',
      vendors: [
        Vendor(
          id: 'V001',
          vendorName: 'Vendor A',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        Vendor(
          id: 'V001',
          vendorName: 'Vendor b',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        Vendor(
          id: 'V001',
          vendorName: 'Vendor c',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        Vendor(
          id: 'V001',
          vendorName: 'Vendor d',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        Vendor(
          id: 'V001',
          vendorName: 'Vendor e',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        Vendor(
          id: 'V001',
          vendorName: 'Vendor f',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        Vendor(
          id: 'V001',
          vendorName: 'Vendor g',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        Vendor(
          id: 'V001',
          vendorName: 'Vendor h',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        Vendor(
          id: 'V001',
          vendorName: 'Vendor i',
          totalInvoiceValue: 250000.00,
          qty: 100,
        ),
        Vendor(
          id: 'V002',
          vendorName: 'Vendor j',
          totalInvoiceValue: 150000.00,
          qty: 80,
        ),
      ],
    ),
    VendorGroup(
      range: '5.1 - 10 Lakh',
      totalInvoiceValue: 1600000.00,
      totalQty: 320,
      totalVendors: '7',
      vendors: [
        Vendor(
          id: 'V003',
          vendorName: 'Vendor C',
          totalInvoiceValue: 900000.00,
          qty: 180,
        ),
        Vendor(
          id: 'V004',
          vendorName: 'Vendor D',
          totalInvoiceValue: 700000.00,
          qty: 140,
        ),
        Vendor(
          id: 'V004',
          vendorName: 'Vendor D',
          totalInvoiceValue: 700000.00,
          qty: 140,
        ),
        Vendor(
          id: 'V004',
          vendorName: 'Vendor D',
          totalInvoiceValue: 700000.00,
          qty: 140,
        ),
        Vendor(
          id: 'V004',
          vendorName: 'Vendor D',
          totalInvoiceValue: 700000.00,
          qty: 140,
        ),
        Vendor(
          id: 'V004',
          vendorName: 'Vendor D',
          totalInvoiceValue: 700000.00,
          qty: 140,
        ),
        Vendor(
          id: 'V004',
          vendorName: 'Vendor D',
          totalInvoiceValue: 700000.00,
          qty: 140,
        ),
      ],
    ),
    VendorGroup(
      range: 'Above 10 Lakh',
      totalInvoiceValue: 1200000.00,
      totalQty: 200,
      totalVendors: '8',
      vendors: [
        Vendor(
          id: 'V005',
          vendorName: 'Vendor E',
          totalInvoiceValue: 1200000.00,
          qty: 200,
        ),
        Vendor(
          id: 'V005',
          vendorName: 'Vendor E',
          totalInvoiceValue: 1200000.00,
          qty: 200,
        ),
        Vendor(
          id: 'V005',
          vendorName: 'Vendor E',
          totalInvoiceValue: 1200000.00,
          qty: 200,
        ),
        Vendor(
          id: 'V005',
          vendorName: 'Vendor E',
          totalInvoiceValue: 1200000.00,
          qty: 200,
        ),
        Vendor(
          id: 'V005',
          vendorName: 'Vendor E',
          totalInvoiceValue: 1200000.00,
          qty: 200,
        ),
        Vendor(
          id: 'V005',
          vendorName: 'Vendor E',
          totalInvoiceValue: 1200000.00,
          qty: 200,
        ),
        Vendor(
          id: 'V005',
          vendorName: 'Vendor E',
          totalInvoiceValue: 1200000.00,
          qty: 200,
        ),
        Vendor(
          id: 'V005',
          vendorName: 'Vendor E',
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
                'Pie Chart',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                height: 350,
                width: 350,
                child: PieChart(
                  PieChartData(
                    sectionsSpace: 2,
                    centerSpaceRadius: 40,
                    sections: List.generate(vendorGroups.length, (index) {
                      final group = vendorGroups[index];
                      return PieChartSectionData(
                        color: yourColorPalette[
                            index], // Define a color palette for sections
                        value: group.totalInvoiceValue,
                        title: group.totalVendors,
                        radius: touchedIndex == index ? 70 : 60,
                        titleStyle: TextStyle(
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
                      'Vendors in ${vendorGroups[touchedIndex].range}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis
                          .horizontal, // Scroll horizontally if the table overflows
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text('Vendor Name')),
                          DataColumn(label: Text('Invoice Value')),
                        ],
                        rows: vendorGroups[touchedIndex].vendors.map((vendor) {
                          return DataRow(
                            cells: [
                              DataCell(Text(vendor.vendorName)),
                              DataCell(
                                Text(
                                  '₹${vendor.totalInvoiceValue.toStringAsFixed(2)}',
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

class Vendor {
  final String id;
  final String vendorName;
  final double totalInvoiceValue;
  final int qty;

  Vendor({
    required this.id,
    required this.vendorName,
    required this.totalInvoiceValue,
    required this.qty,
  });
}

class VendorGroup {
  final String range;
  final List<Vendor> vendors;
  final double totalInvoiceValue;
  final int totalQty;
  final String totalVendors;

  VendorGroup({
    required this.range,
    required this.vendors,
    required this.totalInvoiceValue,
    required this.totalQty,
    required this.totalVendors,
  });
}

final List<Color> yourColorPalette = [
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.deepPurple,
];
