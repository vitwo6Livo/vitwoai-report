import 'package:flutter/material.dart';
import 'package:vitwoai_report/golobal-Widget/appDrawer.dart';
import 'package:vitwoai_report/golobal-Widget/dayCalendar.dart';
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
      body: ListView(
        children: [
          SizedBox(
            height: 260,
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  height: 120,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColor.appBarColor1, AppColor.appBarColor2],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Builder(
                        //   builder: (context) => InkWell(
                        //     onTap: () {
                        //       Scaffold.of(context).openDrawer();
                        //     },
                        //     child: Icon(Icons.menu, color: AppColor.appBarIcon),
                        //   ),
                        // ),
                        Text(
                          HandText.welcome,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: AppColor.appbarFont, fontSize: 20),
                        ),
                        IconButton(
                          onPressed: () {
                            showDateDialog(context);
                          },
                          icon: Icon(
                            Icons.settings,
                            color: AppColor.appBarIcon,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 60,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircularChart('Sales', 30, 100, 30),
                              CircularChart('Revenue', 26, 82, 30),
                              CircularChart('growth', 14, 60, 50),
                            ],
                          ),
                          // SizedBox(
                          //   height: 40,
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     CircularChart('Receivable', 30, 100, 30),
                          //     CircularChart('Purchase', 26, 82, 30),
                          //     CircularChart('Sales', 14, 60, 50),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Row(
              children: [
                Expanded(
                  child: Container(
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
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 20, color: AppColor.lightFontCpy),
                      ),
                      subtitle: Text(
                        HandText.raised,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
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
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 20, color: AppColor.lightFontCpy),
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
          ),
          const SizedBox(height: 10),
          const ProductWidget(),
          const SizedBox(height: 10),
          const RegionWidget(),
        ],
      ),
    );
  }
}
