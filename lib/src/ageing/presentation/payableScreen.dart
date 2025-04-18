import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitwoai_report/src/ageing/data/receivableAnalytics_repositry.dart';
import 'package:vitwoai_report/src/settings/colors.dart';

class PayableScreen extends ConsumerWidget {
  const PayableScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final payableProviderData = ref.watch(payableCustomerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payble", style: TextStyle(color: Colors.white)),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        centerTitle: true,
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
            child: payableProviderData.when(
              data: (value) {
                return Text(
                  "Total Records: ${value['totalElements']?.toString() ?? '0'}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                );
              },
              error: (error, stack) => Center(child: Text('Error: $error')),
              loading: () => Text("Loding.."),
            ),
          ),
          Expanded(
            child: payableProviderData.when(
              data: (data) {
                return data['content'].length == 0
                    ? const Center(
                        child: Text("No Data Found"),
                      )
                    : ListView.builder(
                        itemCount: data['content'].length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            child: InkWell(
                              onTap: () {
                                print(
                                    "pressedddddddddddddddddddd.........$index");
                              },
                              child: Card(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data["content"][index]['vendor_name'],
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text.rich(
                                            TextSpan(
                                                text: "Customer Code: \n",
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey,
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text: data["content"][index]
                                                            ['vendor_code']
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black),
                                                  )
                                                ]),
                                          ),
                                          Text.rich(
                                            TextSpan(
                                                text: "Total Due: \n",
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey,
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text: data["content"][index]
                                                            ['total_due']
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black),
                                                  )
                                                ]),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text.rich(
                                            TextSpan(
                                                text: "On Account Due: \n",
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey,
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text: data["content"][index]
                                                            ['on_account_due']
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black),
                                                  )
                                                ]),
                                          ),
                                          Text.rich(
                                            TextSpan(
                                                text: "Net Due: \n",
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey,
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text: data["content"][index]
                                                            ['net_due']
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black),
                                                  )
                                                ]),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
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
