import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitwoai_report/src/purchaseRegister/presentation/cardwidget.dart';
import 'package:vitwoai_report/src/settings/colors.dart';

final isClickedProviderPurschese = StateProvider<bool>((ref) => false);

class PurchesRegister extends ConsumerWidget {
  const PurchesRegister({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isClicked = ref.watch(isClickedProviderPurschese);
    final isClickedNotifier = ref.read(isClickedProviderPurschese.notifier);

    String? selectedCard;
    // List listOfCatagory = [
    //   "Product",
    //   "Vendor",
    //   "Purchase Order",
    //   "Functional Area",
    //   "Storage Location",
    //   "Cost Center"
    // ];

    return Scaffold(
        backgroundColor: Color(0xffff9f9f9),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 280,
              width: double.infinity,
              child: Stack(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    alignment: Alignment.topLeft,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xfff759bec), Color(0xfff4e3986)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Padding(
                        padding: const EdgeInsets.only(top: 50, left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Purchase Register",
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    isClickedNotifier.state =
                                        !isClickedNotifier.state;
                                  },
                                  child: CircleAvatar(
                                    backgroundColor:
                                        isClicked ? Colors.amber : Colors.white,
                                    child: Icon(
                                      Icons.push_pin,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text("Settings"),
                                              content: const Text(
                                                  "Settings content"),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text("Close"),
                                                ),
                                              ],
                                            );
                                          });
                                    },
                                    icon: const Icon(
                                      Icons.settings,
                                      color: Colors.white,
                                    ))
                              ],
                            )
                          ],
                        )),
                  ),
                  const Positioned(
                    top: 120,
                    left: 10,
                    right: 10,
                    child: Card(
                      color: Colors.white,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 14, vertical: 20),
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("1440265.55")
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "CGST",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("19781.57")
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "IGST",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("4458.57")
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 10,
                    blurStyle: BlurStyle.outer,
                    color: Colors.grey,
                    offset: Offset(4, 2),
                    spreadRadius: 2.0,
                  ),
                ],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white.withOpacity(0.6)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      cursorColor: Colors.blue,
                      decoration: InputDecoration(
                        hintText: 'SEARCH',
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  IconButton(
                    splashColor: AppColor.splashColor,
                    onPressed: () {},
                    icon: const Icon(Icons.search, color: Colors.brown),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Flexible(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Add",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      spacing: 2.0,
                      runSpacing: 8.0,
                      children: [
                        InkWell(
                          onTap: () {
                            selectedCard = "Product";
                          },
                          child: CasCard(
                            isActive: selectedCard == "Product",
                            cardName: "Product",
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            selectedCard = "Vendor";
                          },
                          child: CasCard(
                            isActive: selectedCard == "Vendor",
                            cardName: "Vendor",
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            selectedCard = "Cost Center";
                          },
                          child: CasCard(
                            isActive: selectedCard == "Cost Center",
                            cardName: "Cost Center",
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            selectedCard = "Functional Area";
                          },
                          child: CasCard(
                            isActive: selectedCard == "Functional Area",
                            cardName: "Functional Area",
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            selectedCard = "Storage Location";
                          },
                          child: CasCard(
                            isActive: selectedCard == "Storage Location",
                            cardName: "Storage Location",
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            selectedCard = "Purchase Order";
                          },
                          child: CasCard(
                            isActive: selectedCard == "Purchase Order",
                            cardName: "Purchase Order",
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Text(
                      "List Of items",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Column(
                    children: [
                      Card(
                        color: Colors.white,
                        child: ListTile(
                          leading: const CircleAvatar(
                            child: Icon(Icons.widgets),
                          ),
                          title: Text("Carvaan Mobile Don Lite M23 Kan..",
                              style: Theme.of(context).textTheme.bodySmall),
                          trailing: const Icon(
                            Icons.arrow_forward,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.white,
                        child: ListTile(
                          leading: const CircleAvatar(
                            child: Icon(Icons.widgets),
                          ),
                          title: Text("Carvaan Mobile Don Lite M23 Kan..",
                              style: Theme.of(context).textTheme.bodySmall),
                          trailing: const Icon(
                            Icons.arrow_forward,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.white,
                        child: ListTile(
                          leading: const CircleAvatar(
                            child: Icon(Icons.widgets),
                          ),
                          title: Text("Carvaan Mobile Don Lite M23 Kan..",
                              style: Theme.of(context).textTheme.bodySmall),
                          trailing: const Icon(
                            Icons.arrow_forward,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.white,
                        child: ListTile(
                          leading: const CircleAvatar(
                            child: Icon(Icons.widgets),
                          ),
                          title: Text("Carvaan Mobile Don Lite M23 Kan..",
                              style: Theme.of(context).textTheme.bodySmall),
                          trailing: const Icon(
                            Icons.arrow_forward,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.white,
                        child: ListTile(
                          leading: const CircleAvatar(
                            child: Icon(Icons.widgets),
                          ),
                          title: Text("Carvaan Mobile Don Lite M23 Kan..",
                              style: Theme.of(context).textTheme.bodySmall),
                          trailing: const Icon(
                            Icons.arrow_forward,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.white,
                        child: ListTile(
                          leading: const CircleAvatar(
                            child: Icon(Icons.widgets),
                          ),
                          title: Text("Carvaan Mobile Don Lite M23 Kan..",
                              style: Theme.of(context).textTheme.bodySmall),
                          trailing: const Icon(
                            Icons.arrow_forward,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.white,
                        child: ListTile(
                          leading: const CircleAvatar(
                            child: Icon(Icons.widgets),
                          ),
                          title: Text("Carvaan Mobile Don Lite M23 Kan..",
                              style: Theme.of(context).textTheme.bodySmall),
                          trailing: const Icon(
                            Icons.arrow_forward,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.white,
                        child: ListTile(
                          leading: const CircleAvatar(
                            child: Icon(Icons.widgets),
                          ),
                          title: Text("Carvaan Mobile Don Lite M23 Kan..",
                              style: Theme.of(context).textTheme.bodySmall),
                          trailing: const Icon(
                            Icons.arrow_forward,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
