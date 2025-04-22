import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vitwoai_report/src/purchaseRegister/presentation/prWidget/POGraph.dart';
import 'package:vitwoai_report/src/purchaseRegister/presentation/prWidget/POlist.dart';
import 'package:vitwoai_report/src/purchaseRegister/presentation/prWidget/hsnCodeWiseGraph.dart';
import 'package:vitwoai_report/src/purchaseRegister/presentation/prWidget/costCenterList.dart';
import 'package:vitwoai_report/src/purchaseRegister/presentation/prWidget/itemWiseGraph.dart';
import 'package:vitwoai_report/src/purchaseRegister/presentation/prWidget/functionalAreaList.dart';
import 'package:vitwoai_report/src/purchaseRegister/presentation/prWidget/itemGroupWiseGraph.dart';
import 'package:vitwoai_report/src/purchaseRegister/presentation/prWidget/storageLocationList.dart';
import 'package:vitwoai_report/src/settings/texts.dart';
import 'prWidget/AllGraph.dart';
import 'prWidget/productList.dart';
import 'prWidget/vendorGraph.dart';
import 'prWidget/vendorList.dart';

final isClickedProviderPurschese = StateProvider<bool>((ref) => false);

class PurchesregisterScreen extends ConsumerStatefulWidget {
  final int initialTab;
  const PurchesregisterScreen({super.key, this.initialTab = 0});

  @override
  ConsumerState<PurchesregisterScreen> createState() =>
      _PurchesregisterScreenState();
}

class _PurchesregisterScreenState extends ConsumerState<PurchesregisterScreen> {
  final ScrollController _scrollController = ScrollController();
  int selectedIndex = 0; // Track the selected item
  late int selectedIndexMenu;

  @override
  void initState() {
    super.initState();
    selectedIndexMenu = widget.initialTab;
    selectedIndex = selectedIndexMenu;

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // Trigger pagination based on selected tab
        if (selectedIndex == 0) {
          // ref.read(productListControllerProvider.notifier).loadMore();
        } else if (selectedIndex == 1) {
          // Handle VendorList pagination
        } // Add other tabs as needed
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> data = [
    {
      'image': 'assets/images/product.svg',
      'name': 'ALL',
      'gradient': const [Color(0xfff759bec), Color(0xfff4e3986)],
    },
    {
      'image': 'assets/images/supplier.svg',
      'name': 'PO Wise',
      'gradient': const [Color(0xfff759bec), Color(0xfff4e3986)],
    },
    {
      'image': 'assets/images/cash-register.svg',
      'name': 'Vendor Wise',
      'gradient': const [Color(0xfff759bec), Color(0xfff4e3986)],
    },
    {
      'image': 'assets/images/chemical-flask.svg',
      'name': 'Item Wise',
      'gradient': const [Color(0xfff759bec), Color(0xfff4e3986)],
    },
    {
      'image': 'assets/images/server-location.svg',
      'name': 'Item Group Wise',
      'gradient': const [Color(0xfff759bec), Color(0xfff4e3986)],
    },
    {
      'image': 'assets/images/data-storage.svg',
      'name': 'HSN Code Wise',
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
              controller: _scrollController,
              child: Column(
                children: [
                  selectedIndex == 0
                      ? const ProductList()
                      : selectedIndex == 1
                          ? const VendorList()
                          : selectedIndex == 2
                              ? const PurchaseOrderList()
                              : selectedIndex == 3
                                  ? const FunctionalAreaList()
                                  : selectedIndex == 4
                                      ? const StorageLocationList()
                                      : selectedIndex == 5
                                          ? const CostCenterList()
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
    // final isClicked = ref.watch(isClickedProviderPurschese);
    // final isClickedNotifier = ref.read(isClickedProviderPurschese.notifier);
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
              padding: const EdgeInsets.only(top: 65, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    HandText.prTitle,
                    style: const TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  Row(
                    children: [
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
                                              child: POGraphModel(),
                                            );
                                          },
                                        );
                                      }
                                    : selectedIndex == 3
                                        ? () {
                                            showModalBottomSheet(
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                  top: Radius.circular(20.0),
                                                ),
                                              ),
                                              isScrollControlled: true,
                                              useSafeArea: true,
                                              context: context,
                                              builder: (context) {
                                                return const FractionallySizedBox(
                                                  heightFactor: 0.9,
                                                  child:
                                                      FunctionalAreaGraphModel(),
                                                );
                                              },
                                            );
                                          }
                                        : selectedIndex == 4
                                            ? () {
                                                showModalBottomSheet(
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.vertical(
                                                      top:
                                                          Radius.circular(20.0),
                                                    ),
                                                  ),
                                                  isScrollControlled: true,
                                                  useSafeArea: true,
                                                  context: context,
                                                  builder: (context) {
                                                    return const FractionallySizedBox(
                                                      heightFactor: 0.9,
                                                      child:
                                                          StorageLocationGraphModel(),
                                                    );
                                                  },
                                                );
                                              }
                                            : selectedIndex == 5
                                                ? () {
                                                    showModalBottomSheet(
                                                      shape:
                                                          const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .vertical(
                                                          top: Radius.circular(
                                                              20.0),
                                                        ),
                                                      ),
                                                      isScrollControlled: true,
                                                      useSafeArea: true,
                                                      context: context,
                                                      builder: (context) {
                                                        return const FractionallySizedBox(
                                                          heightFactor: 0.9,
                                                          child:
                                                              CostCenterGraphModel(),
                                                        );
                                                      },
                                                    );
                                                  }
                                                : null,
                        icon: const Icon(
                          Icons.bar_chart,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
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
                            Text(
                              HandText.prTotalAmount,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
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
                            Text(
                              HandText.prTotalCGST,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
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
                            Text(
                              HandText.prTotalSGST,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
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
                            Text(
                              HandText.prTotalIGST,
                              style: const TextStyle(
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
