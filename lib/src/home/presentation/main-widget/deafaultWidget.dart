import 'package:flutter/material.dart';
import 'package:vitwoai_report/golobal-Widget/rangeCalendar.dart';
import 'package:vitwoai_report/src/home/presentation/main-widget/productWidget.dart';
import 'package:vitwoai_report/src/home/presentation/main-widget/progresWidget.dart';
import 'package:vitwoai_report/src/home/presentation/main-widget/regionWidget.dart';
import 'package:vitwoai_report/src/settings/colors.dart';
import 'package:vitwoai_report/src/settings/texts.dart';

class Deafaultwidget extends StatelessWidget {
  const Deafaultwidget({super.key});

  void showDateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CustomDatePickerDialog(
        initialFromDate: DateTime.now(),
        initialToDate: DateTime.now(),
        onSave: (fromDate, toDate) {
          print('fromDate: $fromDate, toDate: $toDate');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const AppDrawer(selectedSettings: []),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 260,
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  height: 180,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColor.appBarColor1, AppColor.appBarColor2],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          HandText.welcome,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: AppColor.appbarFont, fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 75,
                  left: 10,
                  right: 10,
                  child: Card(
                    color: Colors.white,
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            HandText.summary,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontSize: 18),
                          ),
                          const SizedBox(height: 16),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircularChart('Sales', 30, 100, 30),
                              CircularChart('Revenue', 26, 82, 30),
                              CircularChart('growth', 14, 60, 50),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [AppColor.raisedCard1, AppColor.raisedCard2],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      HandText.raisedCount,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 20, color: AppColor.lightFontCpy),
                    ),
                    subtitle: Text(
                      HandText.raised,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColor.lightFontCpy),
                    ),
                    trailing:
                        Icon(Icons.trending_up, color: AppColor.appBarIcon),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [AppColor.itemCard1, AppColor.itemCard2],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      HandText.itemCount,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 20, color: AppColor.lightFontCpy),
                    ),
                    subtitle: Text(
                      HandText.item,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColor.lightFontCpy),
                    ),
                    trailing: Icon(Icons.edit, color: AppColor.appBarIcon),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const ProductWidget(),
          const SizedBox(height: 10),
          const RegionWidget(),
        ]),
      ),
    );
  }
}
