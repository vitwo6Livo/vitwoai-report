// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:vitwoai_report/src/ageing/model/receivableModel.dart';
import 'package:vitwoai_report/src/settings/colors.dart';
import 'package:vitwoai_report/src/settings/texts.dart';

class newReceivableDetailsScreen extends StatelessWidget {
  final List<dynamic> data;
  final int index;
  newReceivableDetailsScreen({
    super.key,
    required this.data,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    // Fetching the item details based on the index
    List<String> dueAmounts = [
      "0 - 30 Days Total Due: ",
      "31 - 60 Days Total Due: ",
      "61 - 90 Days Total Due: ",
      "91 - 120 Days Total Due: ",
      "121 - 150 Days Total Due: ",
      "151 - 180 Days Total Due: ",
      ">180 Days Total Due: ",
    ];
    List<String> onAccountAmounts = [
      "0 - 30 Days Total Due: ",
      "31 - 60 Days Total Due: ",
      "61 - 90 Days Total Due: ",
      "91 - 120 Days Total Due: ",
      "121 - 150 Days Total Due: ",
      "151 - 180 Days Total Due: ",
      ">180 Days Total Due: ",
    ];
    return Scaffold(
      backgroundColor: AppColor.screenBgColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColor.lightFontCpy,
          ),
        ),
        title: Text(
          HandText.receivableDetails,
          style: TextStyle(color: AppColor.appbarFont),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColor.lightFontCpy,
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data[index].customerName,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                              text: "${HandText.receivableCustomerCode} \n",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                              children: [
                                TextSpan(
                                  text: data[index].customerCode,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                )
                              ]),
                        ),
                        Text.rich(
                          TextSpan(
                              text: "${HandText.receivableTotalDue} \n",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                              children: [
                                TextSpan(
                                  text: data[index].totalDue.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                )
                              ]),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                              text: "${HandText.receivableOnAccountDue} \n",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                              children: [
                                TextSpan(
                                  text: data[index].onAccountDue.toString(),
                                  // text: details['on_account_due'].toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                )
                              ]),
                        ),
                        Text.rich(
                          TextSpan(
                              text: "${HandText.receivableNetDue} \n",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                              children: [
                                TextSpan(
                                  text: data[index].netDue.toString(),
                                  // text: details['net_due'].toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                )
                              ]),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 7,
                  itemBuilder: (context, ind) {
                    return Card(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                dueAmounts[ind],
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.green
                                    // color: Colors.grey,
                                    ),
                              ),
                              Text(
                                data[index]
                                    .dueAmounts
                                    .values['$ind']
                                    .toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.green),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                onAccountAmounts[ind],
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 102, 20, 14),
                                ),
                              ),
                              Text(
                                data[index]
                                    .onAccountAmounts
                                    .amount['$ind']
                                    .toString(),
                                // text: details['onAccountAmounts']['1'].toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(255, 102, 20, 14)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
