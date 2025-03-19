import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitwoai_report/src/sales_Register/data/salesRegisterFatchData.dart';
import 'package:vitwoai_report/src/settings/colors.dart';

class SoWiseListScreen extends ConsumerWidget {
  const SoWiseListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final salesRegisterSOList = ref.watch(salesRegisterSOProvider);
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
          "SO Wise",
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
            alignment: Alignment.centerLeft,
            height: 40,
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(),
              borderRadius: BorderRadius.circular(5),
            ),
            child: salesRegisterSOList.when(
              data: (value) {
                return Text(
                  "Total Records: ${value['totalElements']?.toString() ?? '0'}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                );
              },
              error: (error, stack) => Center(child: Text('Error: $error')),
              loading: () => const Text("Loding.."),
            ),
          ),
          Expanded(
            child: salesRegisterSOList.when(
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
                                data['content'][index]['SO Number'],
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
                                    text: "SO Date: ",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: data['content'][index]['SO Date'],
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
                                    text: "CGST: ",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: data['content'][index]['CGST'],
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      )
                                    ]),
                              ),
                              Text.rich(
                                TextSpan(
                                    text: "SGST: ",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: data['content'][index]['SGST'],
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      )
                                    ]),
                              ),
                              Text.rich(
                                TextSpan(
                                    text: "IGST: ",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: data['content'][index]['IGST'],
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
