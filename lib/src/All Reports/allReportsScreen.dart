import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vitwoai_report/src/All%20Reports/Purches%20Register/Functional%20Wise/functionalWiseScreen.dart';
import 'package:vitwoai_report/src/All%20Reports/Purches%20Register/PO%20Wise/poWiseScreen.dart';
import 'package:vitwoai_report/src/All%20Reports/Purches%20Register/product%20Wise/productWiseScreen.dart';
import 'package:vitwoai_report/src/All%20Reports/Receiveable/CustomerWise/customerWiseScreen.dart';
import 'package:vitwoai_report/src/All%20Reports/Receiveable/KamWise/kamWiseScreen.dart';
import 'package:vitwoai_report/src/All%20Reports/Receiveable/RegionWise/regionWiseScreen.dart';
import 'package:vitwoai_report/src/All%20Reports/Receiveable/VerticalWise/verticalWiseScreen.dart';
import 'package:vitwoai_report/src/All%20Reports/Receiveable/productWise/productWiseScreen.dart';
import 'package:vitwoai_report/src/All%20Reports/Sales%20Register/receivableCustomer/receivableCustomer.dart';
import 'package:vitwoai_report/src/profile/presentation/prifileScreen.dart';
import 'package:vitwoai_report/src/settings/texts.dart';
import 'package:vitwoai_report/src/vendor%20Wise/presentation/vendorWiseScreen.dart';

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
    List<Map<String, dynamic>> listitems = [
      {
        "image": Localjson.productJson,
        "title": HandText.productWise,
      },
      {
        "image": Localjson.vendorJson,
        "title": HandText.vendorWise,
      },
      {
        "image": Localjson.poJson,
        "title": HandText.poWise,
      },
      {
        "image": Localjson.functionalJson,
        "title": HandText.functionalWise,
      },
      {
        "image": Localjson.productWiseJson,
        "title": HandText.receivableProductWise,
      },
      {
        "image": Localjson.customerJson,
        "title": HandText.customerWise,
      },
      // {
      //   "image": Localjson.verticalJson,
      //   "title": HandText.verticalWise,
      // },
      {
        "image": Localjson.kamJson,
        "title": HandText.kamWise,
      },
      {
        "image": Localjson.regionJson,
        "title": HandText.regionWise,
      },
      {
        "image": Localjson.receivableJson,
        "title": HandText.receivableCustomer,
      },
      // {
      //   "image": "assets/json/purchase-vendor-wise.json",
      //   "title": "Vendor Wise"
      // },
      // {"image": "assets/json/purchase-po-wise.json", "title": "PO Wise"},
      // {
      //   "image": "assets/json/purchase-po-wise.json",
      //   "title": "Functional Wise"
      // },
      // {"image": "assets/json/sales-product-wise.json", "title": "Product Wise"},
      // {"image": "assets/json/PO Wise.json", "title": "Customer Wise"},
      // {"image": "assets/json/sales-so-wise.json", "title": "Vertical Wise"},
      // // {"image": "assets/json/sales-vertical-wise.json", "title": "SO Wise"},
      // {"image": "assets/json/Product Wise.json", "title": "Kam Wise"},
      // {"image": "assets/json/sales-region-wise.json", "title": "Region Wise"},
      // {"image": "assets/json/Vendor Wise.json", "title": "Receivable Customer"}
    ];
    List<Map<String, dynamic>> listitemsAgging = [
      {
        "image": Localjson.productJson,
        "title": "Receivable",
      },
    ];

    List<Widget> onClickList = [
      const ProductWiseScreen(),
      const VendorWiseScreen(),
      const PoWiseScreen(),
      const FunctionalWiseScreen(),
      const ProductWiseReceiveableScreen(),
      const CustomerWiseScreen(),
      const VerticalWiseScreen(),
      const KamWiseScreen(),
      const RegionWiseScreen(),
      const ReceivableCustomerScreen()
    ];
    final List<Widget> screens = [
      Main_Screen(selectedSettings: []),
      const AllReport(),
      const ReportDetails(),
      const ProfileScreen(),
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
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.notifications_active),
            ),
          ],
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: const Text(
                "Agging",
                style: TextStyle(fontSize: 23),
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: listitemsAgging.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => onClickList[index]),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 140,
                            width: 120,
                            child: LottieBuilder.asset(
                                listitemsAgging[index]["image"]),
                          ),
                          Text(
                            listitemsAgging[index]["title"],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: const Text(
                "Purchase Register",
                style: TextStyle(fontSize: 23),
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: listitems.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => onClickList[index]),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 140,
                            width: 120,
                            child:
                                LottieBuilder.asset(listitems[index]["image"]),
                          ),
                          Text(
                            listitems[index]["title"],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: const Text(
                "Sales Register",
                style: TextStyle(fontSize: 23),
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: listitems.length,
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
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 140,
                              width: 120,
                              child: LottieBuilder.asset(
                                  listitems[index]["image"])),
                          Text(
                            listitems[index]["title"],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ));
  }
}
