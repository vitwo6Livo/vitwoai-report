import 'package:flutter/material.dart';
import 'package:vitwoai_report/src/ageing/model/payableModel.dart';
import 'package:vitwoai_report/src/settings/colors.dart';
import 'package:vitwoai_report/src/settings/texts.dart';

class PayableDetailsPage extends StatelessWidget {
  final List<Content> data;
  final int index;
  const PayableDetailsPage({
    super.key,
    required this.data,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    // Fetching the item details based on the index
    List<String> headings = [
      "0 - 30 Days",
      "31 - 60 Days",
      "61 - 90 Days",
      "91 - 120 Days",
      "121 - 150 Days",
      "151 - 180 Days",
      ">180 Days",
    ];
    const String dueAmt = "Due Amounts :";
    const String onAccountAmt = "On Account Amounts :";
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
          HandText.payableDetails,
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
                      data[index].vendorName,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 12),
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
                                  text: data[index].vendorCode,
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
                    const SizedBox(height: 5),
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
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                  itemCount: 7,
                  itemBuilder: (context, ind) {
                    return Card(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          _buildCardTitle(headings[ind]),
                          _buildCard([
                            _buildCardDataHeading(
                                dueAmt,
                                data[index].dueAmounts['$ind'] ?? 0.0,
                                Colors.green),
                            _buildCardDataHeading(
                                onAccountAmt,
                                data[index].onAccountAmounts['$ind'] ?? 0.0,
                                Colors.red),
                          ]),
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

Widget _buildCardTitle(String heading) {
  return Row(
    children: [
      Text(
        heading,
        style: const TextStyle(
            color: Colors.blueGrey, fontWeight: FontWeight.bold),
      )
    ],
  );
}

Widget _buildCardDataHeading(String label, double value, Color clr) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text(
        label,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      Text(
        value.toString(),
        style: TextStyle(color: clr, fontWeight: FontWeight.bold),
      )
    ],
  );
}

Widget _buildCard(List<Widget> children) {
  return Card(
    color: AppColor.cardBackgroundColor,
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: Padding(
      padding: const EdgeInsets.all(14),
      child: Column(
        children: children,
      ),
    ),
  );
}
