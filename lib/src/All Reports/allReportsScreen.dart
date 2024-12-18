import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vitwoai_report/src/All%20Reports/Purches%20Register/product%20Wise/productWiseScreen.dart';
import 'package:vitwoai_report/src/All%20Reports/Purches%20Register/vendor%20Wise/vendorWiseScreen.dart';

class AllReport extends StatelessWidget {
  const AllReport({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> listItems = [
      {
        "image": "assets/json/purchase-product-wise.json",
        "title": "Product Wise"
      },
      {
        "image": "assets/json/purchase-vendor-wise.json",
        "title": "Vendor Wise"
      },
      {"image": "assets/json/purchase-po-wise.json", "title": "PO Wise"},
      {
        "image": "assets/json/purchase-po-wise.json",
        "title": "Functional Wise"
      },
      {"image": "assets/json/sales-product-wise.json", "title": "Product Wise"},
      {"image": "assets/json/PO Wise.json", "title": "Customer Wise"},
      {"image": "assets/json/sales-so-wise.json", "title": "Vertical Wise"},
      {"image": "assets/json/sales-vertical-wise.json", "title": "SO Wise"},
      {"image": "assets/json/Product Wise.json", "title": "Kam Wise"},
      {"image": "assets/json/sales-region-wise.json", "title": "Region Wise"},
      {"image": "assets/json/Vendor Wise.json", "title": "Receivable Customer"}
    ];

    List<Widget> onClickList = [ProductWiseScreen(), VendorWiseScreen()];
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 218, 217, 217),
        body: Expanded(
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: listItems.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => onClickList[index]));
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: 140,
                            width: 120,
                            child:
                                LottieBuilder.asset(listItems[index]["image"])),
                        Text(
                          listItems[index]["title"],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ));
  }
}
