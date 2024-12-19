import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vitwoai_report/src/product%20Wise/presentation/productWiseScreen.dart';
import 'package:vitwoai_report/src/vendor%20Wise/presentation/vendorWiseScreen.dart';
import 'package:vitwoai_report/src/settings/texts.dart';

import '../Report Details/reportDetailsScreen.dart';
import '../golobal-Widget/bottom-Nav.dart';
import '../home/presentation/main-Screen.dart';
import '../settings/colors.dart';
import '../settings/localJson.dart';

class AllReport extends StatefulWidget {
  const AllReport({super.key});

  @override
  State<AllReport> createState() => _AllReportState();
}

class _AllReportState extends State<AllReport> {
  @override
  Widget build(BuildContext context) {
    int i = 0;
    List<Map<String, dynamic>> listItems = [
      {
        "image": Localjson.productJson,
        "title": HandText.productWise,
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
      // {"image": "assets/json/sales-vertical-wise.json", "title": "SO Wise"},
      {"image": "assets/json/Product Wise.json", "title": "Kam Wise"},
      {"image": "assets/json/sales-region-wise.json", "title": "Region Wise"},
      {"image": "assets/json/Vendor Wise.json", "title": "Receivable Customer"}
    ];

    List<Widget> onClickList = [ProductWiseScreen(), VendorWiseScreen()];
    final List<Widget> screens = [
      Main_Screen(selectedSettings: []),
      const AllReport(),
      const ReportDetails(),
    ];
    return Scaffold(
      drawer: AppDrawer(
        onItemSelected: (index) {
          setState(() {
            i = index;
          });
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => screens[i],
            ),
          );
        },
      ),
      appBar: AppBar(
        title: Text(
          "All Reports",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColor.appbarFont,
              ),
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.notifications_active),
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: listItems.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => onClickList[index]));
            },
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 140,
                      width: 120,
                      child: LottieBuilder.asset(listItems[index]["image"])),
                  Text(
                    listItems[index]["title"],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
