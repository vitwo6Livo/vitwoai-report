import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:vitwoai_report/src/All%20Reports/Purches%20Register/PO%20Wise/poWiseScreen.dart';
import 'package:vitwoai_report/src/All%20Reports/Purches%20Register/vendor%20Wise/vendorWiseScreen.dart';
import 'package:vitwoai_report/src/All%20Reports/Receiveable/CustomerWise/customerWiseScreen.dart';
import 'package:vitwoai_report/src/All%20Reports/Receiveable/KamWise/kamWiseScreen.dart';
import 'package:vitwoai_report/src/All%20Reports/Receiveable/RegionWise/regionWiseScreen.dart';
import 'package:vitwoai_report/src/All%20Reports/Receiveable/VerticalWise/verticalWiseScreen.dart';
import 'package:vitwoai_report/src/All%20Reports/Receiveable/productWise/productWiseScreen.dart';
import 'package:vitwoai_report/src/All%20Reports/Sales%20Register/receivableCustomer/receivableCustomer.dart';
import 'package:vitwoai_report/src/All%20Reports/Purches%20Register/Functional%20Wise/functionalWiseScreen.dart';
import 'package:vitwoai_report/src/golobal-Widget/dropDownWidget.dart';

import 'package:intl/intl.dart';

class ProductWiseScreen extends StatefulWidget {
  const ProductWiseScreen({super.key});

  @override
  State<ProductWiseScreen> createState() => _ProductWiseScreenState();
}

class _ProductWiseScreenState extends State<ProductWiseScreen> {
  final List<String> _items = [
    'Product Wise',
    'Vendor Wise',
    'PO Wise',
    'Functional Wise',
    'Product Receiveable',
    'Customer Wise',
    'Vertical Wise',
    'Kam Wise',
    'Region Wise',
    'Receivable Customer'
  ];

  String? _selectedItem;

  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  DateTimeRange selectedDates =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());

  @override
  Widget build(BuildContext context) {
    final List<List<dynamic>> chartData = [
      [40, 'Rent', Colors.blue],
      [30, 'Food', Colors.green],
      [20, 'Transportation', Colors.orange],
      [10, 'Entertainment', Colors.purple],
    ];
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 234, 234, 234),
          appBar: AppBar(
            title: AnimatedDropdown(
              items: _items,
              selectedItem: _selectedItem,
              onChanged: (value) {
                setState(() {
                  _selectedItem = value;
                });
              },
            ),
            bottom: const TabBar(
                labelStyle: TextStyle(color: Colors.amber),
                indicatorColor: Colors.white,
                tabs: [
                  Tab(
                    child: Text(
                      "Current",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Month",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "quarter",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Yearly",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Cus",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ]),
          ),
          body: _selectedItem == 'Vendor Wise'
              ? const VendorWiseScreen()
              : _selectedItem == 'PO Wise'
                  ? const PoWiseScreen()
                  : _selectedItem == 'Functional Wise'
                      ? const FunctionalWiseScreen()
                      : _selectedItem == 'Product Wise Receiveable'
                          ? const ProductWiseReceiveableScreen()
                          : _selectedItem == 'Customer Wise'
                              ? const CustomerWiseScreen()
                              : _selectedItem == 'Vertical Wise'
                                  ? const VerticalWiseScreen()
                                  : _selectedItem == 'Kam Wise'
                                      ? const KamWiseScreen()
                                      : _selectedItem == 'Region Wise'
                                          ? const RegionWiseScreen()
                                          : _selectedItem ==
                                                  'Receivable Customer'
                                              ? const ReceivableCustomerScreen()
                                              : TabBarView(children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Card(
                                                        child: SfCircularChart(
                                                          series: [
                                                            PieSeries(
                                                              // radius: "30%",
                                                              dataSource:
                                                                  chartData,
                                                              yValueMapper:
                                                                  (datum, index) =>
                                                                      datum[0],
                                                              xValueMapper:
                                                                  (datum, index) =>
                                                                      datum[1],
                                                              explode: true,
                                                              pointColorMapper:
                                                                  (datum, index) =>
                                                                      datum[2],
                                                              dataLabelMapper: (datum,
                                                                      index) =>
                                                                  datum[0]
                                                                      .toString() +
                                                                  "%",
                                                              dataLabelSettings:
                                                                  const DataLabelSettings(
                                                                isVisible: true,
                                                                labelPosition:
                                                                    ChartDataLabelPosition
                                                                        .outside,
                                                              ),
                                                            )
                                                          ],
                                                          legend: const Legend(
                                                              isVisible: true,
                                                              position:
                                                                  LegendPosition
                                                                      .top),
                                                        ),
                                                      ),
                                                      // const Text("List Of Item",
                                                      //     style: TextStyle(fontWeight: FontWeight.w400)),
                                                      Expanded(
                                                        child:
                                                            SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          child:
                                                              SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: DataTable(
                                                              showCheckboxColumn:
                                                                  true,
                                                              columns: [
                                                                DataColumn(
                                                                    label: Text(
                                                                        "Item Name",
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .bodyMedium)),
                                                                DataColumn(
                                                                    label: Text(
                                                                        "Item Quantity",
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .bodyMedium)),
                                                                DataColumn(
                                                                    label: Text(
                                                                        "Item Total Amount",
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .bodyMedium)),
                                                                DataColumn(
                                                                    label: Text(
                                                                        "GRN Number",
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .bodyMedium)),
                                                                DataColumn(
                                                                    label: Text(
                                                                        "Item Moving Weighted Price",
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .bodyMedium)),
                                                                DataColumn(
                                                                    label: Text(
                                                                        "GRN Due Date",
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .bodyMedium)),
                                                                DataColumn(
                                                                    label: Text(
                                                                        "GRN Created By",
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .bodyMedium))
                                                              ],
                                                              rows: [
                                                                DataRow(cells: [
                                                                  DataCell(Text(
                                                                      "Carvaan Mini Legends kannada ",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "441.7",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "744660.82",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "GRN1697386960642",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "6.2237",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "2023-07-08",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "Salim",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall))
                                                                ]),
                                                                DataRow(cells: [
                                                                  DataCell(Text(
                                                                      "Carvaan Mini Legends kannada ",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "441.7",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "744660.82",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "GRN1697386960642",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "6.2237",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "2023-07-08",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "Salim",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall))
                                                                ]),
                                                                DataRow(cells: [
                                                                  DataCell(Text(
                                                                      "Carvaan Mini Legends kannada ",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "441.7",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "744660.82",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "GRN1697386960642",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "6.2237",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "2023-07-08",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "Salim",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall))
                                                                ]),
                                                                DataRow(cells: [
                                                                  DataCell(Text(
                                                                      "Carvaan Mini Legends kannada ",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "441.7",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "744660.82",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "GRN1697386960642",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "6.2237",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "2023-07-08",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "Salim",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall))
                                                                ]),
                                                                DataRow(cells: [
                                                                  DataCell(Text(
                                                                      "Carvaan Mini Legends kannada ",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "441.7",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "744660.82",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "GRN1697386960642",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "6.2237",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "2023-07-08",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "Salim",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall))
                                                                ]),
                                                                DataRow(cells: [
                                                                  DataCell(Text(
                                                                      "Carvaan Mini Legends kannada ",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "441.7",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "744660.82",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "GRN1697386960642",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "6.2237",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "2023-07-08",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "Salim",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall))
                                                                ]),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Card(
                                                        child: SfCircularChart(
                                                          series: [
                                                            PieSeries(
                                                              // radius: "30%",
                                                              dataSource:
                                                                  chartData,
                                                              yValueMapper:
                                                                  (datum, index) =>
                                                                      datum[0],
                                                              xValueMapper:
                                                                  (datum, index) =>
                                                                      datum[1],
                                                              explode: true,
                                                              pointColorMapper:
                                                                  (datum, index) =>
                                                                      datum[2],
                                                              dataLabelMapper: (datum,
                                                                      index) =>
                                                                  datum[0]
                                                                      .toString() +
                                                                  "%",
                                                              dataLabelSettings:
                                                                  const DataLabelSettings(
                                                                isVisible: true,
                                                                labelPosition:
                                                                    ChartDataLabelPosition
                                                                        .outside,
                                                              ),
                                                            )
                                                          ],
                                                          legend: const Legend(
                                                              isVisible: true,
                                                              position:
                                                                  LegendPosition
                                                                      .top),
                                                        ),
                                                      ),
                                                      // const Text("List Of Item",
                                                      //     style: TextStyle(fontWeight: FontWeight.w400)),
                                                      Expanded(
                                                        child:
                                                            SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          child:
                                                              SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: DataTable(
                                                              showCheckboxColumn:
                                                                  true,
                                                              columns: [
                                                                DataColumn(
                                                                    label: Text(
                                                                        "Item Name",
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .bodyMedium)),
                                                                DataColumn(
                                                                    label: Text(
                                                                        "Item Quantity",
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .bodyMedium)),
                                                                DataColumn(
                                                                    label: Text(
                                                                        "Item Total Amount",
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .bodyMedium)),
                                                                DataColumn(
                                                                    label: Text(
                                                                        "GRN Number",
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .bodyMedium)),
                                                                DataColumn(
                                                                    label: Text(
                                                                        "Item Moving Weighted Price",
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .bodyMedium)),
                                                                DataColumn(
                                                                    label: Text(
                                                                        "GRN Due Date",
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .bodyMedium)),
                                                                DataColumn(
                                                                    label: Text(
                                                                        "GRN Created By",
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .bodyMedium))
                                                              ],
                                                              rows: [
                                                                DataRow(cells: [
                                                                  DataCell(Text(
                                                                      "Carvaan Mini Legends kannada ",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "441.7",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "744660.82",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "GRN1697386960642",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "6.2237",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "2023-07-08",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "Salim",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall))
                                                                ]),
                                                                DataRow(cells: [
                                                                  DataCell(Text(
                                                                      "Carvaan Mini Legends kannada ",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "441.7",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "744660.82",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "GRN1697386960642",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "6.2237",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "2023-07-08",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "Salim",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall))
                                                                ]),
                                                                DataRow(cells: [
                                                                  DataCell(Text(
                                                                      "Carvaan Mini Legends kannada ",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "441.7",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "744660.82",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "GRN1697386960642",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "6.2237",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "2023-07-08",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "Salim",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall))
                                                                ]),
                                                                DataRow(cells: [
                                                                  DataCell(Text(
                                                                      "Carvaan Mini Legends kannada ",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "441.7",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "744660.82",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "GRN1697386960642",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "6.2237",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "2023-07-08",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "Salim",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall))
                                                                ]),
                                                                DataRow(cells: [
                                                                  DataCell(Text(
                                                                      "Carvaan Mini Legends kannada ",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "441.7",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "744660.82",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "GRN1697386960642",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "6.2237",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "2023-07-08",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "Salim",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall))
                                                                ]),
                                                                DataRow(cells: [
                                                                  DataCell(Text(
                                                                      "Carvaan Mini Legends kannada ",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "441.7",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "744660.82",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "GRN1697386960642",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "6.2237",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "2023-07-08",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall)),
                                                                  DataCell(Text(
                                                                      "Salim",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall))
                                                                ]),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  const Center(
                                                    child: Text("QuaTar Data"),
                                                  ),
                                                  const Center(
                                                    child:
                                                        Text("year Wise Data"),
                                                  ),
                                                  Column(
                                                    children: [
                                                      InkWell(
                                                        onTap: () async {
                                                          final DateTimeRange?
                                                              dateTimeRange =
                                                              await showDateRangePicker(
                                                            context: context,
                                                            firstDate:
                                                                DateTime(2000),
                                                            lastDate:
                                                                DateTime(3000),
                                                            initialDateRange:
                                                                selectedDates,
                                                            builder:
                                                                (BuildContext
                                                                        context,
                                                                    Widget?
                                                                        child) {
                                                              return Center(
                                                                child:
                                                                    Container(
                                                                  margin:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          20),
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          10),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: Colors
                                                                            .black
                                                                            .withOpacity(0.2),
                                                                        blurRadius:
                                                                            10,
                                                                        spreadRadius:
                                                                            2,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  child: child,
                                                                ),
                                                              );
                                                            },
                                                          );

                                                          if (dateTimeRange !=
                                                              null) {
                                                            setState(() {
                                                              selectedDates =
                                                                  dateTimeRange;
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      10,
                                                                  vertical: 10),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            border: Border.all(
                                                                color: Colors
                                                                    .grey
                                                                    .shade300),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  const Icon(
                                                                    Icons
                                                                        .calendar_today,
                                                                    color: Colors
                                                                        .grey,
                                                                  ),
                                                                  const SizedBox(
                                                                      width:
                                                                          10),
                                                                  Text(
                                                                    "${DateFormat('dd/MM/yyyy').format(selectedDates.start)} - ${DateFormat('dd/MM/yyyy').format(selectedDates.end)}",
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .bodyMedium,
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Container(
                                                                    margin: const EdgeInsets
                                                                        .symmetric(
                                                                        horizontal:
                                                                            5),
                                                                    height: 30,
                                                                    width: 1,
                                                                    color: Colors
                                                                        .grey,
                                                                  ),
                                                                  const Icon(
                                                                    Icons
                                                                        .settings,
                                                                    color: Colors
                                                                        .grey,
                                                                  )
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ]),
        ));
  }
}
