import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:vitwoai_report/golobal-Widget/loadingShimmer.dart';
import 'package:vitwoai_report/golobal-Widget/shimmer_screen.dart';
import 'package:vitwoai_report/src/sales_Register/data/salesRegisterFatchData.dart';
import 'package:vitwoai_report/src/sales_Register/model/salesItemWiseModel.dart';
import 'package:vitwoai_report/src/sales_Register/presentation/SRDetails/newSRItemWiseDetails.dart';
import 'package:vitwoai_report/src/settings/colors.dart';
import 'package:vitwoai_report/src/settings/texts.dart';

class ItemWiseScreen extends ConsumerStatefulWidget {
  const ItemWiseScreen({super.key});

  @override
  ConsumerState<ItemWiseScreen> createState() => _ItemWiseScreenState();
}

class _ItemWiseScreenState extends ConsumerState<ItemWiseScreen> {
  late final TextEditingController itemWiseSearchController;
  final ScrollController _scrollController = ScrollController();
  bool _isLoadingMore = false;
  bool _isInitialLoading = true;

  // State provider for item-wise sales register list
  final salesRegisterItemListStateProvider =
      StateProvider<Salesitemwisemodel>((ref) => Salesitemwisemodel(
            content: [],
            pageNumber: 0,
            pageSize: 0,
            totalElements: 0,
            totalPages: 0,
            lastPage: false,
          ));

  // State provider for current page
  final currentPageProvider = StateProvider<int>((ref) => 0);

  // State provider for search key
  final searchKeyProvider = StateProvider<String>((ref) => '');

  @override
  void initState() {
    super.initState();
    itemWiseSearchController = TextEditingController();
    // Fetch initial data
    _fetchInitialData();
    // Add scroll listener for pagination
    _scrollController.addListener(_handleScroll);
  }

  // Fetch initial data for the first page
  Future<void> _fetchInitialData() async {
    setState(() {
      _isInitialLoading = true;
    });

    try {
      final searchKey = ref.read(searchKeyProvider);
      final data = await ref
          .read(salesRegisterItemProvider((key: searchKey, page: 0)).future);
      if (mounted) {
        ref.read(salesRegisterItemListStateProvider.notifier).state = data;
        ref.read(currentPageProvider.notifier).state = 0;
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load data: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isInitialLoading = false;
        });
      }
    }
  }

  // Handle scroll to load more data
  void _handleScroll() {
    final model = ref.read(salesRegisterItemListStateProvider);
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 100 &&
        !_isLoadingMore &&
        !model.lastPage) {
      _loadMoreData();
    }
  }

  // Load more data for pagination
  Future<void> _loadMoreData() async {
    if (_isLoadingMore) return;

    setState(() {
      _isLoadingMore = true;
    });

    try {
      final searchKey = ref.read(searchKeyProvider);
      final currentPage = ref.read(currentPageProvider);
      final nextPage = currentPage + 1;
      final newData = await ref.read(
          salesRegisterItemProvider((key: searchKey, page: nextPage)).future);

      if (mounted) {
        ref.read(salesRegisterItemListStateProvider.notifier).update((state) {
          return Salesitemwisemodel(
            content: [...state.content, ...newData.content],
            pageNumber: newData.pageNumber,
            pageSize: newData.pageSize,
            totalElements: newData.totalElements,
            totalPages: newData.totalPages,
            lastPage: newData.lastPage,
          );
        });

        ref.read(currentPageProvider.notifier).state = nextPage;
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load more data: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoadingMore = false;
        });
      }
    }
  }

  // Handle search with debounce
  void _handleSearch() {
    ref.read(searchKeyProvider.notifier).state = itemWiseSearchController.text;
    ref.invalidate(salesRegisterItemProvider); // Clear cache
    _fetchInitialData();
  }

  @override
  void dispose() {
    itemWiseSearchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final salesRegisterItemList = ref.watch(salesRegisterItemListStateProvider);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.screenBgColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: AppColor.appBarIcon),
        ),
        title: Text(
          HandText.srItemWiseTitle,
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
      body: Column(
        children: [
          Container(
            height: 80,
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: AppColor.lightFontCpy,
              border: Border.all(),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${HandText.totalRecords} ${salesRegisterItemList.totalElements}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 9,
                      child: Container(
                        margin: const EdgeInsets.only(right: 8),
                        height: 40,
                        child: TextField(
                          controller: itemWiseSearchController,
                          decoration: InputDecoration(
                            hintText: HandText.searchBox,
                            prefixIcon: const Icon(Icons.search),
                            border: const OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColor.appBarGradiant,
                                width: 2.0,
                              ),
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 8),
                          ),
                          cursorHeight: 20,
                          cursorColor: AppColor.appBarGradiant,
                          onSubmitted: (_) => _handleSearch(),
                        ),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: InkWell(
                        onTap: _handleSearch,
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColor.appBarGradiant,
                            border: Border.all(color: AppColor.appBarGradiant),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Icon(
                            Icons.search,
                            color: AppColor.lightFontCpy,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: _isInitialLoading
                ? screen_shimmer(120, 800)
                : salesRegisterItemList.content.isEmpty
                    ? Center(
                        child: LottieBuilder.asset(
                          'assets/json/NoDataFound.json',
                          fit: BoxFit.fill,
                          height: screenHeight * 0.38,
                          width: screenWidth * 0.68,
                        ),
                      )
                    : ListView.builder(
                        controller: _scrollController,
                        itemCount: _isLoadingMore
                            ? salesRegisterItemList.content.length + 1
                            : salesRegisterItemList.content.length,
                        itemBuilder: (context, index) {
                          if (index < salesRegisterItemList.content.length) {
                            return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              newSRItemWiseDetailsScreen(
                                                  data: salesRegisterItemList
                                                      .content,
                                                  index: index)));
                                },
                                child: _buildCard(
                                    index, salesRegisterItemList.content));
                          } else {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              child: loadingShimmer(100, 900),
                            );
                          }
                        },
                      ),
          ),
          // if (_isLoadingMore)
          //   Padding(
          //     padding: const EdgeInsets.symmetric(vertical: 9),
          //     child: loadingShimmer(100, 800),
          //   ),
        ],
      ),
    );
  }

  // Helper method to build Text.rich rows
  // Widget _buildTextRow(String label, dynamic value) {
  //   return Text.rich(
  //     TextSpan(
  //       text: label,
  //       style: const TextStyle(fontSize: 14, color: Colors.grey),
  //       children: [
  //         TextSpan(
  //           text: value?.toString() ?? 'N/A',
  //           style: const TextStyle(fontSize: 16, color: Colors.black),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildCard(int index, List<dynamic> content) {
    final item = content[index];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Card(
        color: AppColor.cardBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildDataRow(
                      Icons.shopping_bag,
                      item.itemName.length > 15
                          ? '${item.itemName.substring(0, 15)}...'
                          : item.itemName),
                  _buildDataRow(Icons.qr_code, item.itemCode),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildDataRow(Icons.inventory_2, item.invoiceQuantity),
                  _buildDataRow(Icons.receipt_long, item.invoiceValue),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDataRow(IconData iconName, String data) {
    return Row(
      children: [
        Icon(
          iconName,
          color: AppColor.appBarGradiant,
          size: 20,
        ),
        Text(
          " $data",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColor.lightFont,
          ),
        ),
      ],
    );
  }
}
