import 'package:flutter/material.dart';

class PurchesRegister extends StatelessWidget {
  const PurchesRegister({super.key});

  @override
  Widget build(BuildContext context) {
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
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.settings,
                                  color: Colors.white,
                                ))
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Add",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    color: Colors.white,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: Color(0xfff564d9c),
                          ),
                          Text("Product")
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: Color(0xfff564d9c),
                          ),
                          Text("Vendor")
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: Color(0xfff564d9c),
                          ),
                          Text("Purchase Order")
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    color: Colors.white,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: Color(0xfff564d9c),
                          ),
                          Text("Functional Area")
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: Color(0xfff564d9c),
                          ),
                          Text("Storage Location")
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(
                width: 150,
                child: Card(
                  color: Color(0xfff626abb),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        Text(
                          "Cost Center",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                "List Of items",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.widgets),
                      ),
                      title: Text("Carvaan Mobile Don Lite M23 Kan..",
                          style: Theme.of(context).textTheme.bodySmall),
                      trailing: Icon(
                        Icons.arrow_forward,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Icon(Icons.widgets),
                      ),
                      title: Text("Carvaan Mobile Don Lite M23 Kan..",
                          style: Theme.of(context).textTheme.bodySmall),
                      trailing: Icon(
                        Icons.arrow_forward,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Icon(Icons.widgets),
                      ),
                      title: Text("Carvaan Mobile Don Lite M23 Kan..",
                          style: Theme.of(context).textTheme.bodySmall),
                      trailing: Icon(
                        Icons.arrow_forward,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Icon(Icons.widgets),
                      ),
                      title: Text("Carvaan Mobile Don Lite M23 Kan..",
                          style: Theme.of(context).textTheme.bodySmall),
                      trailing: Icon(
                        Icons.arrow_forward,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Icon(Icons.widgets),
                      ),
                      title: Text("Carvaan Mobile Don Lite M23 Kan..",
                          style: Theme.of(context).textTheme.bodySmall),
                      trailing: Icon(
                        Icons.arrow_forward,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Icon(Icons.widgets),
                      ),
                      title: Text("Carvaan Mobile Don Lite M23 Kan..",
                          style: Theme.of(context).textTheme.bodySmall),
                      trailing: Icon(
                        Icons.arrow_forward,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Icon(Icons.widgets),
                      ),
                      title: Text("Carvaan Mobile Don Lite M23 Kan..",
                          style: Theme.of(context).textTheme.bodySmall),
                      trailing: Icon(
                        Icons.arrow_forward,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Icon(Icons.widgets),
                      ),
                      title: Text("Carvaan Mobile Don Lite M23 Kan..",
                          style: Theme.of(context).textTheme.bodySmall),
                      trailing: Icon(
                        Icons.arrow_forward,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
