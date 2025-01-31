// ignore_for_file: use_full_hex_values_for_flutter_colors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'prWidget/productGraph.dart';
import 'prWidget/productList.dart';
import 'prWidget/vendorGraph.dart';
import 'prWidget/vendorList.dart';

class PurchesregisterScreen extends StatefulWidget {
  const PurchesregisterScreen({super.key});

  @override
  State<PurchesregisterScreen> createState() => _PurchesregisterScreenState();
}

class _PurchesregisterScreenState extends State<PurchesregisterScreen> {
  int selectedIndex = 0; // Track the selected item

  List<Map<String, dynamic>> data = [
    {
      'image': 'assets/images/product.svg',
      'name': 'Product',
      'gradient': const [Color(0xfff759bec), Color(0xfff4e3986)],
    },
    {
      'image': 'assets/images/supplier.svg',
      'name': 'Vendor',
      'gradient': const [Color(0xfff759bec), Color(0xfff4e3986)],
    },
    {
      'image': 'assets/images/cash-register.svg',
      'name': 'Purchase Order',
      'gradient': const [Color(0xfff759bec), Color(0xfff4e3986)],
    },
    {
      'image': 'assets/images/chemical-flask.svg',
      'name': 'Functional Area',
      'gradient': const [Color(0xfff759bec), Color(0xfff4e3986)],
    },
    {
      'image': 'assets/images/server-location.svg',
      'name': 'Storage Location',
      'gradient': const [Color(0xfff759bec), Color(0xfff4e3986)],
    },
    {
      'image': 'assets/images/data-storage.svg',
      'name': 'Cast Center',
      'gradient': const [Color(0xfff759bec), Color(0xfff4e3986)],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffff9f9f9),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _purchaseSummary(context),
          _cardViewPurchase(),
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  selectedIndex == 0
                      ? const ProductList()
                      : selectedIndex == 1
                          ? const VendorList()
                          //     : selectedIndex == 2
                          //         ? _purchaseOrder()
                          //         : selectedIndex == 3
                          //             ? _functionalArea()
                          //             : selectedIndex == 4
                          //                 ? _storageLocation()
                          //                 : selectedIndex == 5
                          //                     ? _costCenter()
                          : const SizedBox(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding _cardViewPurchase() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        height: 130,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 10, bottom: 5, top: 2),
                child: SizedBox(
                  width: 100,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: selectedIndex == index
                            ? data[index]['gradient']
                            : [Colors.white, Colors.white],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: const Offset(1, 1),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 5),
                          SvgPicture.asset(
                            data[index]['image'],
                            color: selectedIndex == index
                                ? Colors.white
                                : Colors.black,
                            height: 50,
                            width: 50,
                          ),
                          const SizedBox(height: 3),
                          Text(
                            data[index]['name'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: selectedIndex == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  SizedBox _purchaseSummary(BuildContext context) {
    return SizedBox(
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
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 50, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Purchase Register",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: selectedIndex == 0
                        ? () {
                            showModalBottomSheet(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20.0),
                                ),
                              ),
                              isScrollControlled: true,
                              useSafeArea: true,
                              context: context,
                              builder: (context) {
                                return const FractionallySizedBox(
                                  heightFactor: 0.9,
                                  child: ProductGraphModel(),
                                );
                              },
                            );
                          }
                        : selectedIndex == 1
                            ? () {
                                showModalBottomSheet(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20.0),
                                    ),
                                  ),
                                  isScrollControlled: true,
                                  useSafeArea: true,
                                  context: context,
                                  builder: (context) {
                                    return const FractionallySizedBox(
                                      heightFactor: 0.9,
                                      child: VendorGraphModel(),
                                    );
                                  },
                                );
                              }
                            : selectedIndex == 2
                                ? () {}
                                : selectedIndex == 3
                                    ? () {}
                                    : selectedIndex == 4
                                        ? () {}
                                        : selectedIndex == 5
                                            ? () {}
                                            : null,
                    icon: const Icon(
                      Icons.bar_chart,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 120,
            left: 10,
            right: 10,
            child: Card(
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const Text(
                              "Total Amount",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(selectedIndex == 0
                                ? "1440265.55"
                                : selectedIndex == 1
                                    ? '2036458.20'
                                    : selectedIndex == 2
                                        ? '36458.20'
                                        : selectedIndex == 3
                                            ? '5036458.20'
                                            : selectedIndex == 4
                                                ? '1236458.20'
                                                : selectedIndex == 5
                                                    ? '333658.20'
                                                    : '0.0'),
                          ],
                        ),
                        Column(
                          children: [
                            const Text(
                              "Total CGST",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(selectedIndex == 0
                                ? "2304"
                                : selectedIndex == 1
                                    ? "3456"
                                    : selectedIndex == 2
                                        ? "4567"
                                        : selectedIndex == 3
                                            ? "5678"
                                            : selectedIndex == 4
                                                ? "6789"
                                                : selectedIndex == 5
                                                    ? "7890"
                                                    : "0.0"),
                          ],
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const Text(
                              "Total SGST",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(selectedIndex == 0
                                ? "19781.57"
                                : selectedIndex == 1
                                    ? "3456.57"
                                    : selectedIndex == 2
                                        ? "4567.57"
                                        : selectedIndex == 3
                                            ? "5678.57"
                                            : selectedIndex == 4
                                                ? "6789.57"
                                                : selectedIndex == 5
                                                    ? "7890.57"
                                                    : "0.0"),
                          ],
                        ),
                        Column(
                          children: [
                            const Text(
                              "Total IGST",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(selectedIndex == 0
                                ? "4458.57"
                                : selectedIndex == 1
                                    ? "3456.57"
                                    : selectedIndex == 2
                                        ? "4567.57"
                                        : selectedIndex == 3
                                            ? "5678.57"
                                            : selectedIndex == 4
                                                ? "6789.57"
                                                : selectedIndex == 5
                                                    ? "7890.57"
                                                    : "0.0"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
