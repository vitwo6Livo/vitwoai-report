import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitwoai_report/golobal-Widget/loadingShimmer.dart';
import 'package:vitwoai_report/golobal-Widget/shimmer_screen.dart';
import 'package:vitwoai_report/src/sales_Register/data/salesRegisterFatchData.dart';
import 'package:vitwoai_report/src/sales_Register/model/salesSOWiseModel.dart';
import 'package:vitwoai_report/src/sales_Register/presentation/SRDetails/soWiseDetails.dart';
import 'package:vitwoai_report/src/settings/colors.dart';
import 'package:vitwoai_report/src/settings/texts.dart';

class SalesRegisterSOScreen extends ConsumerStatefulWidget {
  const SalesRegisterSOScreen({super.key});

  @override
  ConsumerState<SalesRegisterSOScreen> createState() =>
      _SalesRegisterSOScreenState();
}

class _SalesRegisterSOScreenState extends ConsumerState<SalesRegisterSOScreen> {
  late final TextEditingController searchItem;
  final ScrollController _scrollController = ScrollController();

  bool _isLoadingMore = false;
  bool _isInitialLoading = true;

// Changes
  final salesRegisterSOListStateProvider =
      StateProvider<SalesSOwisemodel>((ref) {
    return SalesSOwisemodel(
      content: [],
      pageNumber: 0,
      pageSize: 0,
      totalElements: 0,
      totalPages: 0,
      lastPage: false,
    );
  });

  final currentPageProvider = StateProvider<int>((ref) => 0);
  final searchKeyProvider = StateProvider<String>((ref) => '');

  @override
  void initState() {
    super.initState();
    searchItem = TextEditingController();
    _fetchInitialData();
    _scrollController.addListener(_handleScroll);
  }

  Future<void> _fetchInitialData() async {
    setState(() => _isInitialLoading = true);

    try {
      final searchKey = ref.read(searchKeyProvider);
      final data = await ref.read(
        salesRegisterSOProvider((key: searchKey, page: 0)).future,
      );
// Changes
      if (mounted) {
        ref.read(salesRegisterSOListStateProvider.notifier).state = data;
        ref.read(currentPageProvider.notifier).state = 0;
      }
    } catch (e, stackTrace) {
      debugPrint('Error: $e\n$stackTrace');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load data: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isInitialLoading = false);
      }
    }
  }

// Changes
  void _handleScroll() {
    final model = ref.read(salesRegisterSOListStateProvider);
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent * 0.9 &&
        !_isLoadingMore &&
        !model.lastPage) {
      _loadMoreData();
    }
  }

  Future<void> _loadMoreData() async {
    if (_isLoadingMore) return;
    setState(() => _isLoadingMore = true);

    try {
      final searchKey = ref.read(searchKeyProvider);
      final currentPage = ref.read(currentPageProvider);
      final nextPage = currentPage + 1;

      final newData = await ref.read(
        salesRegisterSOProvider((key: searchKey, page: nextPage)).future,
      );
// Changes
      if (mounted) {
        ref.read(salesRegisterSOListStateProvider.notifier).update((state) {
          return SalesSOwisemodel(
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
        setState(() => _isLoadingMore = false);
      }
    }
  }

  void _handleSearch() {
    ref.read(searchKeyProvider.notifier).state = searchItem.text;
    ref.invalidate(salesRegisterSOProvider);
    _fetchInitialData();
  }

  @override
  void dispose() {
    searchItem.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final salesRegisterSOList = ref.watch(salesRegisterSOListStateProvider);

    return Scaffold(
      backgroundColor: AppColor.screenBgColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColor.appBarIcon),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          HandText.srSOWiseTitle,
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
          _buildSearchBox(salesRegisterSOList.totalElements),
          Expanded(
            child: _isInitialLoading
                ? screen_shimmer(120, 800)
                : salesRegisterSOList.content.isEmpty
                    ? Center(child: Text(HandText.noData))
                    : ListView.builder(
                        controller: _scrollController,
                        itemCount: salesRegisterSOList.content.length,
                        itemBuilder: (context, index) {
                          final item = salesRegisterSOList.content[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SoWiseDetails(
                                      data: salesRegisterSOList.content,
                                      index: index,
                                    ),
                                  ),
                                );
                              },
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
                                              Icons.description, item.soNumber),
                                          _buildDataRow(
                                              Icons.event_note, item.soDate),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          _buildDataRow(
                                              Icons.production_quantity_limits,
                                              item.soQuantity),
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
            Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: loadingShimmer(120, 800),
                // CircularProgressIndicator(),
              ),
        ],
      ),
    );
  }

  Widget _buildSearchBox(int totalElements) {
    return Container(
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
          Text("${HandText.totalRecords} $totalElements",
              style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                flex: 9,
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  height: 40,
                  child: TextField(
                    controller: searchItem,
                    decoration: InputDecoration(
                      hintText: HandText.searchBox,
                      prefixIcon: const Icon(Icons.search),
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColor.appBarGradiant, width: 2.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    cursorHeight: 20,
                    cursorColor: AppColor.appBarGradiant,
                    onSubmitted: (_) => _handleSearch(),
                  ),
                ),
              ),
              Expanded(
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
                    child: Icon(Icons.search, color: AppColor.lightFontCpy),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDataRow(IconData iconName, String data) {
    return Row(
      children: [
        Icon(iconName, color: AppColor.appBarGradiant, size: 20),
        Text(" $data",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColor.lightFont,
                fontSize: 16)),
      ],
    );
  }
}
