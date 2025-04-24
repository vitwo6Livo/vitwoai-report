import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitwoai_report/golobal-Widget/shimmer_screen.dart';
import 'package:vitwoai_report/src/sales_Register/data/salesRegisterFatchData.dart';
import 'package:vitwoai_report/src/sales_Register/model/salesHSNCodeModel.dart';
import 'package:vitwoai_report/src/sales_Register/presentation/SRDetails/newSRHSNCodeDetails.dart';
import 'package:vitwoai_report/src/settings/colors.dart';
import 'package:vitwoai_report/src/settings/texts.dart';

class HsnCodeWiseScreen extends ConsumerStatefulWidget {
  const HsnCodeWiseScreen({super.key});

  @override
  ConsumerState<HsnCodeWiseScreen> createState() => _HsnCodeWiseScreenState();
}

class _HsnCodeWiseScreenState extends ConsumerState<HsnCodeWiseScreen> {
  late final TextEditingController hsnSearchController;
  final ScrollController _scrollController = ScrollController();
  bool _isLoadingMore = false;
  bool _isInitialLoading = true;

  // State provider for HSN code wise sales register list
  final salesRegisterHsnCodeListStateProvider =
      StateProvider<SalesHSNCodewisemodel>(
    (ref) => SalesHSNCodewisemodel(
      content: [],
      pageNumber: 0,
      pageSize: 0,
      totalElements: 0,
      totalPages: 0,
      lastPage: false,
    ),
  );

  // State provider for current page
  final currentPageProvider = StateProvider<int>((ref) => 0);

  // State provider for search key
  final searchKeyProvider = StateProvider<String>((ref) => '');

  @override
  void initState() {
    super.initState();
    hsnSearchController = TextEditingController();
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
          .read(salesRegisterHSNCodeProvider((key: searchKey, page: 0)).future);
      if (mounted) {
        ref.read(salesRegisterHsnCodeListStateProvider.notifier).state = data;
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
    final model = ref.read(salesRegisterHsnCodeListStateProvider);
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent * 0.9 &&
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
          salesRegisterHSNCodeProvider((key: searchKey, page: nextPage))
              .future);

      if (mounted) {
        ref
            .read(salesRegisterHsnCodeListStateProvider.notifier)
            .update((state) {
          return SalesHSNCodewisemodel(
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
    ref.read(searchKeyProvider.notifier).state = hsnSearchController.text;
    ref.invalidate(salesRegisterHSNCodeProvider); // Clear cache
    _fetchInitialData();
  }

  @override
  void dispose() {
    hsnSearchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final salesRegisterHsnCodeList =
        ref.watch(salesRegisterHsnCodeListStateProvider);

    return Scaffold(
      backgroundColor: AppColor.screenBgColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          HandText.srHSNCodeWiseTitle,
          style: TextStyle(color: AppColor.appbarFont),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings, color: AppColor.appBarIcon),
          ),
        ],
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
                  "${HandText.totalRecords} ${salesRegisterHsnCodeList.totalElements}",
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
                          controller: hsnSearchController,
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
                : salesRegisterHsnCodeList.content.isEmpty
                    ? Center(child: Text(HandText.noData))
                    : ListView.builder(
                        controller: _scrollController,
                        itemCount: salesRegisterHsnCodeList.content.length,
                        itemBuilder: (context, index) {
                          final item = salesRegisterHsnCodeList.content[index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          newSRHsnCodeWiseDetailsScreen(
                                            data: salesRegisterHsnCodeList
                                                .content,
                                            index: index,
                                          )));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              child: Card(
                                elevation: 4,
                                color: AppColor.cardBackgroundColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          _buildDataRow(
                                              Icons.view_module, item.hsnCode),
                                          _buildDataRow(Icons.inventory_2,
                                              item.invoiceQuantity),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          _buildDataRow(
                                              Icons.bar_chart, item.baseValue),
                                          _buildDataRow(Icons.receipt_long,
                                              item.invoiceValue),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
          ),
          if (_isLoadingMore)
            const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }

//   // Helper method to build Text.rich rows
//   Widget _buildTextRow(String label, dynamic value) {
//     return Text.rich(
//       TextSpan(
//         text: label,
//         style: const TextStyle(fontSize: 14, color: Colors.grey),
//         children: [
//           TextSpan(
//             text: value?.toString() ?? 'N/A',
//             style: const TextStyle(fontSize: 16, color: Colors.black),
//           ),
//         ],
//       ),
//     );
//   }
// }

  Widget _buildDataRow(IconData iconName, String data) {
    return Row(
      children: [
        Icon(
          iconName,
          color: AppColor.appBarGradiant,
          size: 25,
        ),
        Text(
          " $data",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              color: AppColor.lightFont,
              fontSize: 17),
        ),
      ],
    );
  }
}
