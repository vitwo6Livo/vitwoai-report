import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitwoai_report/src/settings/colors.dart';
import '../../data/salesRegisterFatchData.dart';

class AllSalesRegisterList extends ConsumerWidget {
  const AllSalesRegisterList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final salesRegisterList = ref.watch(salesRegisterProvider);
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
          "All Sales Register",
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
            child: salesRegisterList.when(
              data: (value) {
                return Text(
                  "Total Records: ${value['totalElements']?.toString() ?? '0'}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                );
              },
              error: (error, stack) => Center(child: Text('Error: $error')),
              loading: () => Text("Loding.."),
            ),
          ),
          Expanded(
            child: salesRegisterList.when(
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
                                data['content'][index]['items.itemName'],
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
                                            ['items.itemCode'],
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      )
                                    ]),
                              ),
                              Text.rich(
                                TextSpan(
                                    text: "Item Group Name: ",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: data['content'][index][
                                            'items.goodsItems.goodsGroup.goodGroupName'],
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      )
                                    ]),
                              ),
                              Text.rich(
                                TextSpan(
                                    text: "Customer Name: ",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: data['content'][index]
                                            ['customer.trade_name'],
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      )
                                    ]),
                              ),
                              Text.rich(
                                TextSpan(
                                    text: "Customer Code: ",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: data['content'][index]
                                            ['customer.customer_code'],
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      )
                                    ]),
                              ),
                              Text.rich(
                                TextSpan(
                                    text: "Customer GST NO: ",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: data['content'][index]
                                            ['customer.customer_gstin'],
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      )
                                    ]),
                              ),
                              Text.rich(
                                TextSpan(
                                    text: "KAM Code: ",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: data['content'][index]
                                            ['kam.kamCode'],
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      )
                                    ]),
                              ),
                              Text.rich(
                                TextSpan(
                                    text: "KAM Name: ",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: data['content'][index]
                                            ['kam.kamName'],
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      )
                                    ]),
                              ),
                              Text.rich(
                                TextSpan(
                                    text: "Invoice No: ",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: data['content'][index]
                                            ['invoice_no'],
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      )
                                    ]),
                              ),
                              Text.rich(
                                TextSpan(
                                    text: "Invoice Date: ",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: data['content'][index]
                                            ['invoice_date'],
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
                                            ['items.qty'],
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
                                            ['sub_total_amt'],
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
                                            ['all_total_amt'],
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      )
                                    ]),
                              ),
                              Text.rich(
                                TextSpan(
                                    text: "Customer Address: ",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: data['content'][index][
                                            'customer.customerAddress.customer_address_state'],
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      )
                                    ]),
                              ),
                              Text.rich(
                                TextSpan(
                                    text: "Functional Area: ",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: data['content'][index][
                                            'companyFunction.functionalities_name'],
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
