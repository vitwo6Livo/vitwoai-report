import 'package:flutter/material.dart';
import 'package:vitwoai_report/src/settings/colors.dart';

class ReceivableDetailsScreen extends StatelessWidget {
  const ReceivableDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> data = [
      {
        'goodsName': 'Mindtree Limited',
        'goodsCode': '52300001	',
        'invoiceDate': '15782176.93',
        'itemQuantity': '-161811',
        'quotationTotalAmount': '15620365.93',
      },
      {
        'goodsName': 'M/S WYSE SYSTEMS',
        'goodsCode': '52300002',
        'invoiceDate': '374260041.41',
        'itemQuantity': '-154687',
        'quotationTotalAmount': '374105354.41',
      },
      {
        'goodsName': 'KARNATAKA BUSINESS CORPORATION',
        'goodsCode': '52300003',
        'invoiceDate': '2331562.27',
        'itemQuantity': '-1455714.9',
        'quotationTotalAmount': '875847.37',
      },
      {
        'goodsName': 'KOLKATA DAIRY PRODUCTS PVT LTD.',
        'goodsCode': '52300005',
        'invoiceDate': '3412759.65',
        'itemQuantity': '-145020',
        'quotationTotalAmount': '3267739.65',
      },
      {
        'goodsName': 'FLIPKART INDIA PRIVATE LIMITED',
        'goodsCode': '52300006',
        'invoiceDate': '117536.18',
        'itemQuantity': '-120015',
        'quotationTotalAmount': '-2478.82',
      },
    ];

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
          "Details Receivable",
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
                const Text(
                  "Receivable",
                  style: TextStyle(fontWeight: FontWeight.bold),
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
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data[index]['goodsName'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        text: data[index]['goodsCode'],
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.black),
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
                                        text: data[index]['invoiceDate'],
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      )
                                    ]),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        text: data[index]['itemQuantity'],
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.black),
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
                                        text: data[index]
                                            ['quotationTotalAmount'],
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      )
                                    ]),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
