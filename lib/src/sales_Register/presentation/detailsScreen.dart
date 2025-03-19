import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitwoai_report/src/settings/colors.dart';

class DetailsScreen extends ConsumerWidget {
  DetailsScreen({super.key});
  final List<Map<String, dynamic>> data = [
    {
      'goodsName': 'Electrical Connector',
      'goodsCode': '22000032',
      'invoiceDate': '2023-04-15',
      'itemQuantity': '2',
      'quotationTotalAmount': '42525',
      'invoiceTotalAmount': '1295530.05',
      'salesDeliveryTotalAmount': '448',
      'salesPgiTotalAmount': '448',
    },
    {
      'goodsName': 'Saregama Carvaan Premium Hindi',
      'goodsCode': '22000032',
      'invoiceDate': '2023-04-15',
      'itemQuantity': '2',
      'quotationTotalAmount': '42525',
      'invoiceTotalAmount': '1295530.05',
      'salesDeliveryTotalAmount': '448',
      'salesPgiTotalAmount': '448',
    },
    {
      'goodsName': 'Studio sketch plan',
      'goodsCode': '22000032',
      'invoiceDate': '2023-04-15',
      'itemQuantity': '2',
      'quotationTotalAmount': '42525',
      'invoiceTotalAmount': '1295530.05',
      'salesDeliveryTotalAmount': '448',
      'salesPgiTotalAmount': '448',
    },
    {
      'goodsName': 'Equipment required',
      'goodsCode': '22000032',
      'invoiceDate': '2023-04-15',
      'itemQuantity': '2',
      'quotationTotalAmount': '42525',
      'invoiceTotalAmount': '1295530.05',
      'salesDeliveryTotalAmount': '448',
      'salesPgiTotalAmount': '448',
    },
    {
      'goodsName': 'HAIR SYSTEM AMPOLLE (5DA 5ML)',
      'goodsCode': '22000032',
      'invoiceDate': '2023-04-15',
      'itemQuantity': '2',
      'quotationTotalAmount': '42525',
      'invoiceTotalAmount': '1295530.05',
      'salesDeliveryTotalAmount': '448',
      'salesPgiTotalAmount': '448',
    },
  ];

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      backgroundColor: Color(0xffff9f9f9),
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
          "Details",
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
                  "Sales",
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
                            height: 8,
                          ),
                          Text.rich(
                            TextSpan(
                                text: "Goods Code: ",
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
                                text: "Invoice Date: ",
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
                          Text.rich(
                            TextSpan(
                                text: "Item Quantity: ",
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
                                text: "Quotation Total Amount: ",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                                children: [
                                  TextSpan(
                                    text: data[index]['quotationTotalAmount'],
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  )
                                ]),
                          ),
                          Text.rich(
                            TextSpan(
                                text: "Invoice Total Amount: ",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                                children: [
                                  TextSpan(
                                    text: data[index]['invoiceTotalAmount'],
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  )
                                ]),
                          ),
                          Text.rich(
                            TextSpan(
                                text: "Sales Delivery Total Amount: ",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                                children: [
                                  TextSpan(
                                    text: data[index]
                                        ['salesDeliveryTotalAmount'],
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  )
                                ]),
                          ),
                          Text.rich(
                            TextSpan(
                                text: "Sales PGI Total Amount: ",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                                children: [
                                  TextSpan(
                                    text: data[index]['salesPgiTotalAmount'],
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
            ),
          ),
        ],
      ),
    );
  }
}
