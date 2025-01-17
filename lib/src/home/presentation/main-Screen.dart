// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:vitwoai_report/src/settings/colors.dart';
import 'package:vitwoai_report/src/settings/texts.dart';
import 'main-widget/productWidget.dart';
import 'main-widget/progresWidget.dart';
import 'main-widget/regionWidget.dart';

class Main_Screen extends StatefulWidget {
  const Main_Screen({super.key});

  @override
  State<Main_Screen> createState() => _Main_ScreenState();
}

class _Main_ScreenState extends State<Main_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 250,
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
                        Icon(Icons.menu, color: AppColor.appBarIcon),
                        Text(
                          HandText.welcome,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: AppColor.appbarFont),
                        ),
                        Icon(Icons.settings, color: AppColor.appBarIcon),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
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
                            .bodyMedium!
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
