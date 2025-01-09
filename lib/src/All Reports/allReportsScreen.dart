import 'package:flutter/material.dart';
import 'package:vitwoai_report/src/All%20Reports/Purches%20Register/Functional%20Wise/functionalWiseScreen.dart';
import 'package:vitwoai_report/src/All%20Reports/Purches%20Register/PO%20Wise/poWiseScreen.dart';
import 'package:vitwoai_report/src/All%20Reports/Purches%20Register/product%20Wise/productWiseScreen.dart';
import 'package:vitwoai_report/src/All%20Reports/Receiveable/CustomerWise/customerWiseScreen.dart';
import 'package:vitwoai_report/src/All%20Reports/Receiveable/KamWise/kamWiseScreen.dart';
import 'package:vitwoai_report/src/All%20Reports/Receiveable/RegionWise/regionWiseScreen.dart';
import 'package:vitwoai_report/src/All%20Reports/Receiveable/VerticalWise/verticalWiseScreen.dart';
import 'package:vitwoai_report/src/All%20Reports/Receiveable/productWise/productWiseScreen.dart';
import 'package:vitwoai_report/src/All%20Reports/Sales%20Register/receivableCustomer/receivableCustomer.dart';
import 'package:vitwoai_report/src/vendor%20Wise/presentation/vendorWiseScreen.dart';

import '../Report Details/reportDetailsScreen.dart';
import '../golobal-Widget/bottom-Nav.dart';
import '../home/presentation/main-Screen.dart';
import '../settings/colors.dart';

class AllReport extends StatefulWidget {
  const AllReport({super.key});

  @override
  State<AllReport> createState() => _AllReportState();
}

class _AllReportState extends State<AllReport> {
  @override
  Widget build(BuildContext context) {
    int i = 0;

    // List<Widget> onClickList = [
    //   const ProductWiseScreen(),
    //   const VendorWiseScreen(),
    //   const PoWiseScreen(),
    //   const FunctionalWiseScreen(),
    //   const ProductWiseReceiveableScreen(),
    //   const CustomerWiseScreen(),
    //   const VerticalWiseScreen(),
    //   const KamWiseScreen(),
    //   const RegionWiseScreen(),
    //   const ReceivableCustomerScreen()
    // ];

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
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.notifications_active),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ageing Section
            Card(
              elevation: 2,
              color: AppColor.reportCardColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Ageing',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  GridView.count(
                    crossAxisCount: 4,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(8),
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    children: [
                      _buildGridItem(
                          Icons.assessment, 'Receivable', Colors.purple, () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductWiseScreen(),
                          ),
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
            // Purchase Section
            Card(
              elevation: 2,
              color: AppColor.reportCardColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Purchase Register',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  GridView.count(
                    crossAxisCount: 4,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(8),
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    children: [
                      _buildGridItem(
                          Icons.blinds, 'Product', Colors.indigo, () {}),
                      _buildGridItem(Icons.baby_changing_station, 'Vendor',
                          Colors.amber, () {}),
                      _buildGridItem(
                          Icons.bar_chart, 'Purchase Po', Colors.green, () {}),
                      _buildGridItem(Icons.table_chart, 'Functional Area',
                          Colors.blue, () {}),
                      _buildGridItem(Icons.store_mall_directory,
                          'Storage Location', Colors.cyan, () {}),
                      _buildGridItem(Icons.on_device_training, 'Cost Center',
                          Colors.deepOrangeAccent, () {}),
                    ],
                  ),
                ],
              ),
            ),
            // Sales Section
            Card(
              elevation: 2,
              color: AppColor.reportCardColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Sales Register',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  GridView.count(
                    crossAxisCount: 4,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(8),
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    children: [
                      _buildGridItem(Icons.production_quantity_limits,
                          'Sales Product', Colors.indigo, () {}),
                      _buildGridItem(
                          Icons.support_agent, 'Customer', Colors.amber, () {}),
                      _buildGridItem(Icons.vertical_split, 'Vertical',
                          Colors.green, () {}),
                      _buildGridItem(Icons.business_center, 'Sales Order',
                          Colors.blue, () {}),
                      _buildGridItem(Icons.contact_mail, 'Key Account Manager',
                          Colors.cyan, () {}),
                      _buildGridItem(
                          Icons.map, 'Regoin', Colors.deepPurple, () {}),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(
      IconData icon, String label, Color color, VoidCallback onPressed) {
    return InkWell(
      splashColor: AppColor.splashColor,
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: color,
            child: Icon(icon, color: AppColor.reportIconColor),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style:
                Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
