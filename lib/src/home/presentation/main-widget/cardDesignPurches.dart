import 'package:flutter/material.dart';
import 'package:vitwoai_report/src/settings/colors.dart';

class CardDesignPurchase extends StatelessWidget {
  const CardDesignPurchase({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Purches Register",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
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
                        "09",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 20, color: AppColor.lightFontCpy),
                      ),
                      subtitle: Text(
                        "Item Quentity",
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
                        "02",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 20, color: AppColor.lightFontCpy),
                      ),
                      subtitle: Text(
                        "Receibalbe Quentity",
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Unit Price",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("1440265.55")
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "CGST",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("2304")
                        ],
                      )
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "SGST",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("19781.57")
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "IGST",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("4458.57")
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
