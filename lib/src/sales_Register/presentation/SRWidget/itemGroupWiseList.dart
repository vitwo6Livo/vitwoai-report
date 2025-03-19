import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitwoai_report/src/sales_Register/data/salesRegisterFatchData.dart';
import 'package:vitwoai_report/src/settings/colors.dart';

class ItemGroupWiseScreen extends ConsumerWidget {
  const ItemGroupWiseScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final salesRegisterItemGroupWiseList =
        ref.watch(salesRegisterItemGroupProvider);
    return Scaffold(
      backgroundColor: const Color(0xffff9f9f9),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: const Text(
          "Item Group Wise",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              )),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColor.appBarColor1, AppColor.appBarColor2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 80,
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                salesRegisterItemGroupWiseList.when(
                  data: (value) {
                    return Text(
                      "Total Records: ${value['totalElements']?.toString() ?? '0'}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    );
                  },
                  error: (error, stack) => Center(child: Text('Error: $error')),
                  loading: () => Text("Loding.."),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 9,
                      child: Container(
                        margin: const EdgeInsets.only(right: 8),
                        height: 35,
                        child: const TextField(
                          decoration: InputDecoration(
                            hintText: "Search",
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(vertical: 8),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: Container(
                        height: 35,
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
          Expanded(
            child: salesRegisterItemGroupWiseList.when(
              data: (data) {
                return ListView.builder(
                  itemCount: data['content'].length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data['content'][index]['Item Group Name'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text.rich(
                                TextSpan(
                                    text: "Item Code: ",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: data['content'][index]
                                            ['Item Code'],
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      )
                                    ]),
                              ),
                              Text.rich(
                                TextSpan(
                                    text: "Item Name: ",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: data['content'][index]
                                            ['Item Name'],
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      )
                                    ]),
                              ),
                              Text.rich(
                                TextSpan(
                                    text: "HSN Code: ",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: data['content'][index]
                                            ['HSN Code'],
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      )
                                    ]),
                              ),
                              Text.rich(
                                TextSpan(
                                    text: "SO Quantity: ",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: data['content'][index]
                                            ['SO Quantity'],
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      )
                                    ]),
                              ),
                              Text.rich(
                                TextSpan(
                                    text: "Invoice Quantity: ",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: data['content'][index]
                                            ['Invoice Quantity'],
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      )
                                    ]),
                              ),
                              Text.rich(
                                TextSpan(
                                    text: "SO Value (Net): ",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: data['content'][index]
                                            ['SO Value (Net)'],
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      )
                                    ]),
                              ),
                              Text.rich(
                                TextSpan(
                                    text: "SO Value (Gross): ",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: data['content'][index]
                                            ['SO Value (Gross)'],
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      )
                                    ]),
                              ),
                              Text.rich(
                                TextSpan(
                                    text: "Base Value: ",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: data['content'][index]
                                            ['Base Value'],
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      )
                                    ]),
                              ),
                              Text.rich(
                                TextSpan(
                                    text: "Invoice Value: ",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: data['content'][index]
                                            ['Invoice Value'],
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      )
                                    ]),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              error: (error, stack) => Center(child: Text('Error: $error')),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
