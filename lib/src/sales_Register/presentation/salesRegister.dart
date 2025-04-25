import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitwoai_report/src/sales_Register/presentation/SRWidget/HsnCodeWiseList.dart';
import 'package:vitwoai_report/src/sales_Register/presentation/SRWidget/allDetailsList.dart';
import 'package:vitwoai_report/src/sales_Register/presentation/SRWidget/customerWiseList.dart';
import 'package:vitwoai_report/src/sales_Register/presentation/SRWidget/itemGroupWiseList.dart';
import 'package:vitwoai_report/src/sales_Register/presentation/SRWidget/itemWiseList.dart';
import 'package:vitwoai_report/src/sales_Register/presentation/SRWidget/soWiseList.dart';
import 'package:vitwoai_report/src/sales_Register/presentation/lineChart.dart';
import 'package:vitwoai_report/src/settings/colors.dart';
import 'package:vitwoai_report/src/settings/texts.dart';

final isClickedProviderSales = StateProvider<bool>((ref) => false);

class SalesRegister extends ConsumerWidget {
  const SalesRegister({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          HandText.srTitle,
          style: const TextStyle(color: Colors.white),
        ),
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
      backgroundColor: AppColor.screenBgColor,
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Padding(
              padding: EdgeInsets.only(top: 40, left: 25),
              child: SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: LineChartSample2()),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const AllSalesRegisterList()));
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          AppColor.srOptionAllColor1,
                          AppColor.srOptionAllColor2
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: ListTile(
                      title: Text(
                        HandText.srOptionAll,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: AppColor.lightFontCpy),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("₹1445200.00",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: AppColor.lightFontCpy)),
                          Text("December",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: AppColor.lightFontCpy)),
                        ],
                      ),
                      trailing: Text("48%",
                          style: TextStyle(
                              color: AppColor.srOptionPercentage,
                              fontSize: 40)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const SalesRegisterSOScreen()));
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          AppColor.srOptionSOWColor1,
                          AppColor.srOptionSOWColor2
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: ListTile(
                      title: Text(
                        HandText.srOptionSOW,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: AppColor.lightFontCpy),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("₹1445200.00",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: AppColor.lightFontCpy)),
                          Text("December",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: AppColor.lightFontCpy)),
                        ],
                      ),
                      trailing: Text("48%",
                          style: TextStyle(
                              color: AppColor.srOptionPercentage,
                              fontSize: 40)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CustomerWiseScreen()));
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          AppColor.srOptionCustomerWColor1,
                          AppColor.srOptionCustomerWColor2
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: ListTile(
                      title: Text(
                        HandText.srOptionCustomerW,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: AppColor.lightFontCpy),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("₹1445200.00",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: AppColor.lightFontCpy)),
                          Text("December",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: AppColor.lightFontCpy)),
                        ],
                      ),
                      trailing: Text("48%",
                          style: TextStyle(
                              color: AppColor.srOptionPercentage,
                              fontSize: 40)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ItemWiseScreen()));
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          AppColor.srOptionItemWColor1,
                          AppColor.srOptionItemWColor2
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: ListTile(
                      title: Text(
                        HandText.srOptionItemW,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: AppColor.lightFontCpy),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("₹1445200.00",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: AppColor.lightFontCpy)),
                          Text("December",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: AppColor.lightFontCpy)),
                        ],
                      ),
                      trailing: Text("48%",
                          style: TextStyle(
                              color: AppColor.srOptionPercentage,
                              fontSize: 40)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ItemGroupWiseScreen()));
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          AppColor.srOptionItemGWColor1,
                          AppColor.srOptionItemGWColor2
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: ListTile(
                      title: Text(
                        HandText.srOptionItemGW,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: AppColor.lightFontCpy),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("₹1445200.00",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: AppColor.lightFontCpy)),
                          Text("December",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: AppColor.lightFontCpy)),
                        ],
                      ),
                      trailing: Text("48%",
                          style: TextStyle(
                              color: AppColor.srOptionPercentage,
                              fontSize: 40)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HsnCodeWiseScreen()));
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          AppColor.srOptionHSNCWColor1,
                          AppColor.srOptionHSNCWColor2
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: ListTile(
                      title: Text(
                        HandText.srOptionHSNCW,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: AppColor.lightFontCpy),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("₹1445200.00",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: AppColor.lightFontCpy)),
                          Text("December",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: AppColor.lightFontCpy)),
                        ],
                      ),
                      trailing: Text("38%",
                          style: TextStyle(
                              color: AppColor.srOptionPercentage,
                              fontSize: 40)),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
