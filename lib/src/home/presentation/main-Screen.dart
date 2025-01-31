import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:vitwoai_report/src/ageing/presentation/agineScreen.dart';
import 'package:vitwoai_report/src/home/presentation/main-widget/cardDesignPurches.dart';
import 'package:vitwoai_report/src/home/presentation/main-widget/cardDesignReceivable.dart';
import 'package:vitwoai_report/src/home/presentation/main-widget/cardDesignSales.dart';
import 'package:vitwoai_report/src/home/presentation/main-widget/deafaultWidget.dart';
import 'package:vitwoai_report/src/home/presentation/main-widget/progresWidget.dart';
import 'package:vitwoai_report/src/purchaseRegister/presentation/PRScreen.dart';
import 'package:vitwoai_report/src/sales_Register/presentation/salesRegister.dart';
import 'package:vitwoai_report/src/settings/colors.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Access the states
    final isReceivableClicked = ref.watch(isClickedProviderReceivable);
    final isPurchaseClicked = ref.watch(isClickedProviderPurschese);
    final isSalesClicked = ref.watch(isClickedProviderSales);

    // Build a list of body widgets based on the state
    List<Widget> bodyWidgets = [];

    if (isReceivableClicked) {
      bodyWidgets.add(const Padding(
        padding: EdgeInsets.all(8.0),
        child: CardDesignReceivable(
          title: 'Receivable Overview',
          totalSales: '1,00,000',
          totalCollections: '90,000',
          revenue: '80,000',
          growth: '34',
        ),
      ));
    }
    if (isPurchaseClicked) {
      bodyWidgets.add(const Padding(
          padding: EdgeInsets.all(8.0), child: CardDesignPurchase()));
    }
    if (isSalesClicked) {
      bodyWidgets.add(const Padding(
        padding: EdgeInsets.all(8.0),
        child: CardDesignSales(
          title: 'Sales Overview',
          totalSales: '5768',
          totalCollections: '90,000',
          revenue: '34',
          growth: '34',
        ),
      ));
    }

    return Scaffold(
      appBar: (isReceivableClicked || isPurchaseClicked || isSalesClicked)
          ? AppBar(
              automaticallyImplyLeading: false,
              title: const Text(
                "Dashboard",
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Settings"),
                          content: const Text("Settings content"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("Close"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                )
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
            )
          : null,
      backgroundColor: const Color(0xfff9f9f9),
      body: bodyWidgets.isEmpty
          ? const Deafaultwidget()
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: bodyWidgets,
              ),
            ),
    );
  }
}
