import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
    'Customer Wise'
  ];

  String? _selectedItem;

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
          appBar: AppBar(
            centerTitle: true,
            title: Container(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: DropdownButton(
                value: _selectedItem,
                hint: Text(_items[0],
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white)),
                isExpanded: true,
                underline: const SizedBox(),
                icon: const Icon(
                  Icons.arrow_drop_down_circle_outlined,
                  color: Colors.white,
                ),
                items: _items.map((String item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(
                      item,
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                },
                dropdownColor: Color(0xfff003060),
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
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
          body: TabBarView(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: SfCircularChart(
                    series: [
                      PieSeries(
                        // radius: "30%",
                        dataSource: chartData,
                        yValueMapper: (datum, index) => datum[0],
                        xValueMapper: (datum, index) => datum[1],
                        explode: true,
                        pointColorMapper: (datum, index) => datum[2],
                        dataLabelMapper: (datum, index) =>
                            datum[0].toString() + "%",
                        dataLabelSettings: const DataLabelSettings(
                          isVisible: true,
                          labelPosition: ChartDataLabelPosition.outside,
                        ),
                      )
                    ],
                    legend: const Legend(
                        isVisible: true, position: LegendPosition.top),
                  ),
                ),
                // const Text("List Of Item",
                //     style: TextStyle(fontWeight: FontWeight.w400)),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        showCheckboxColumn: true,
                        columns: [
                          DataColumn(
                              label: Text("Item Name",
                                  style:
                                      Theme.of(context).textTheme.bodyMedium)),
                          DataColumn(
                              label: Text("Item Quantity",
                                  style:
                                      Theme.of(context).textTheme.bodyMedium)),
                          DataColumn(
                              label: Text("Item Total Amount",
                                  style:
                                      Theme.of(context).textTheme.bodyMedium)),
                          DataColumn(
                              label: Text("GRN Number",
                                  style:
                                      Theme.of(context).textTheme.bodyMedium)),
                          DataColumn(
                              label: Text("Item Moving Weighted Price",
                                  style:
                                      Theme.of(context).textTheme.bodyMedium)),
                          DataColumn(
                              label: Text("GRN Due Date",
                                  style:
                                      Theme.of(context).textTheme.bodyMedium)),
                          DataColumn(
                              label: Text("GRN Created By",
                                  style:
                                      Theme.of(context).textTheme.bodyMedium))
                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(Text("Carvaan Mini Legends kannada ",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("441.7",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("744660.82",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("GRN1697386960642",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("6.2237",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("2023-07-08",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("Salim",
                                style: Theme.of(context).textTheme.bodySmall))
                          ]),
                          DataRow(cells: [
                            DataCell(Text("Carvaan Mini Legends kannada ",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("441.7",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("744660.82",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("GRN1697386960642",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("6.2237",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("2023-07-08",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("Salim",
                                style: Theme.of(context).textTheme.bodySmall))
                          ]),
                          DataRow(cells: [
                            DataCell(Text("Carvaan Mini Legends kannada ",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("441.7",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("744660.82",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("GRN1697386960642",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("6.2237",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("2023-07-08",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("Salim",
                                style: Theme.of(context).textTheme.bodySmall))
                          ]),
                          DataRow(cells: [
                            DataCell(Text("Carvaan Mini Legends kannada ",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("441.7",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("744660.82",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("GRN1697386960642",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("6.2237",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("2023-07-08",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("Salim",
                                style: Theme.of(context).textTheme.bodySmall))
                          ]),
                          DataRow(cells: [
                            DataCell(Text("Carvaan Mini Legends kannada ",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("441.7",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("744660.82",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("GRN1697386960642",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("6.2237",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("2023-07-08",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("Salim",
                                style: Theme.of(context).textTheme.bodySmall))
                          ]),
                          DataRow(cells: [
                            DataCell(Text("Carvaan Mini Legends kannada ",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("441.7",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("744660.82",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("GRN1697386960642",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("6.2237",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("2023-07-08",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("Salim",
                                style: Theme.of(context).textTheme.bodySmall))
                          ]),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: SfCircularChart(
                    series: [
                      PieSeries(
                        // radius: "30%",
                        dataSource: chartData,
                        yValueMapper: (datum, index) => datum[0],
                        xValueMapper: (datum, index) => datum[1],
                        explode: true,
                        pointColorMapper: (datum, index) => datum[2],
                        dataLabelMapper: (datum, index) =>
                            datum[0].toString() + "%",
                        dataLabelSettings: const DataLabelSettings(
                          isVisible: true,
                          labelPosition: ChartDataLabelPosition.outside,
                        ),
                      )
                    ],
                    legend: const Legend(
                        isVisible: true, position: LegendPosition.top),
                  ),
                ),
                // const Text("List Of Item",
                //     style: TextStyle(fontWeight: FontWeight.w400)),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        showCheckboxColumn: true,
                        columns: [
                          DataColumn(
                              label: Text("Item Name",
                                  style:
                                      Theme.of(context).textTheme.bodyMedium)),
                          DataColumn(
                              label: Text("Item Quantity",
                                  style:
                                      Theme.of(context).textTheme.bodyMedium)),
                          DataColumn(
                              label: Text("Item Total Amount",
                                  style:
                                      Theme.of(context).textTheme.bodyMedium)),
                          DataColumn(
                              label: Text("GRN Number",
                                  style:
                                      Theme.of(context).textTheme.bodyMedium)),
                          DataColumn(
                              label: Text("Item Moving Weighted Price",
                                  style:
                                      Theme.of(context).textTheme.bodyMedium)),
                          DataColumn(
                              label: Text("GRN Due Date",
                                  style:
                                      Theme.of(context).textTheme.bodyMedium)),
                          DataColumn(
                              label: Text("GRN Created By",
                                  style:
                                      Theme.of(context).textTheme.bodyMedium))
                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(Text("Carvaan Mini Legends kannada ",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("441.7",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("744660.82",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("GRN1697386960642",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("6.2237",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("2023-07-08",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("Salim",
                                style: Theme.of(context).textTheme.bodySmall))
                          ]),
                          DataRow(cells: [
                            DataCell(Text("Carvaan Mini Legends kannada ",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("441.7",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("744660.82",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("GRN1697386960642",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("6.2237",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("2023-07-08",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("Salim",
                                style: Theme.of(context).textTheme.bodySmall))
                          ]),
                          DataRow(cells: [
                            DataCell(Text("Carvaan Mini Legends kannada ",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("441.7",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("744660.82",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("GRN1697386960642",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("6.2237",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("2023-07-08",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("Salim",
                                style: Theme.of(context).textTheme.bodySmall))
                          ]),
                          DataRow(cells: [
                            DataCell(Text("Carvaan Mini Legends kannada ",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("441.7",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("744660.82",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("GRN1697386960642",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("6.2237",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("2023-07-08",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("Salim",
                                style: Theme.of(context).textTheme.bodySmall))
                          ]),
                          DataRow(cells: [
                            DataCell(Text("Carvaan Mini Legends kannada ",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("441.7",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("744660.82",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("GRN1697386960642",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("6.2237",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("2023-07-08",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("Salim",
                                style: Theme.of(context).textTheme.bodySmall))
                          ]),
                          DataRow(cells: [
                            DataCell(Text("Carvaan Mini Legends kannada ",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("441.7",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("744660.82",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("GRN1697386960642",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("6.2237",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("2023-07-08",
                                style: Theme.of(context).textTheme.bodySmall)),
                            DataCell(Text("Salim",
                                style: Theme.of(context).textTheme.bodySmall))
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
              child: Text("year Wise Data"),
            ),
            const Center(
              child: Text("Custom Data"),
            )
          ]),
        ));
  }
}
