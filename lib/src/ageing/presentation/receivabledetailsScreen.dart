import 'package:flutter/material.dart';
import 'package:vitwoai_report/src/settings/colors.dart';
import 'package:vitwoai_report/src/settings/texts.dart';

class ReceivableDetailsScreen extends StatelessWidget {
  final List<dynamic> data;
  final int index;

  const ReceivableDetailsScreen({
    super.key,
    required this.data,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    // Fetching the item details based on the index
    final Map<String, dynamic> details = data[index];

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
                      details['customer_name'],
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
                                  text: details['customer_code'].toString(),
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
                                  text: details['total_due'].toString(),
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
                                  text: details['on_account_due'].toString(),
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
                                  text: details['net_due'].toString(),
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
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    HandText.receivableDueAmounts,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.green),
                  ),
                  Text.rich(TextSpan(
                      text: "0 - 30 Days Total Due: ",
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        // color: Colors.grey,
                      ),
                      children: [
                        TextSpan(
                          text: details['dueAmounts']['1'].toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.black),
                        )
                      ])),
                  Text.rich(TextSpan(
                      text: "31 - 60 Days Total Due: ",
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        // color: Colors.grey,
                      ),
                      children: [
                        TextSpan(
                          text: details['dueAmounts']['2'].toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.black),
                        )
                      ])),
                  Text.rich(TextSpan(
                      text: "61 - 90 Days Total Due: ",
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        // color: Colors.grey,
                      ),
                      children: [
                        TextSpan(
                          text: details['dueAmounts']['3'].toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.black),
                        )
                      ])),
                  Text.rich(TextSpan(
                      text: "90 - 120 Days Total Due: ",
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        // color: Colors.grey,
                      ),
                      children: [
                        TextSpan(
                          text: details['dueAmounts']['4'].toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.black),
                        )
                      ])),
                  Text.rich(TextSpan(
                      text: "121 - 150 Days Total Due: ",
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        // color: Colors.grey,
                      ),
                      children: [
                        TextSpan(
                          text: details['dueAmounts']['5'].toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.black),
                        )
                      ])),
                  Text.rich(TextSpan(
                      text: ">150 Days Total Due: ",
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        // color: Colors.grey,
                      ),
                      children: [
                        TextSpan(
                          text: details['dueAmounts']['6'].toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.black),
                        )
                      ])),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.red.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    HandText.receivableOnAccountAmounts,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.red),
                  ),
                  Text.rich(TextSpan(
                      text: "0 - 30 Days Total Due: ",
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        // color: Colors.grey,
                      ),
                      children: [
                        TextSpan(
                          text: details['onAccountAmounts']['1'].toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.black),
                        )
                      ])),
                  Text.rich(TextSpan(
                      text: "31 - 60 Days Total Due: ",
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        // color: Colors.grey,
                      ),
                      children: [
                        TextSpan(
                          text: details['onAccountAmounts']['2'].toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.black),
                        )
                      ])),
                  Text.rich(TextSpan(
                      text: "61 - 90 Days Total Due: ",
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        // color: Colors.grey,
                      ),
                      children: [
                        TextSpan(
                          text: details['onAccountAmounts']['3'].toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.black),
                        )
                      ])),
                  Text.rich(TextSpan(
                      text: "90 - 120 Days Total Due: ",
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        // color: Colors.grey,
                      ),
                      children: [
                        TextSpan(
                          text: details['onAccountAmounts']['4'].toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.black),
                        )
                      ])),
                  Text.rich(TextSpan(
                      text: "121 - 150 Days Total Due: ",
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        // color: Colors.grey,
                      ),
                      children: [
                        TextSpan(
                          text: details['onAccountAmounts']['5'].toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.black),
                        )
                      ])),
                  Text.rich(TextSpan(
                      text: ">150 Days Total Due: ",
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        // color: Colors.grey,
                      ),
                      children: [
                        TextSpan(
                          text: details['onAccountAmounts']['6'].toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.black),
                        )
                      ])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
