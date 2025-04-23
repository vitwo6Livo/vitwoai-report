import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitwoai_report/golobal-Widget/shimmer_screen.dart';
import 'package:vitwoai_report/src/sales_Register/data/salesRegisterFatchData.dart';
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

  // State provider for sales register SO list
  final salesRegisterSOListStateProvider = StateProvider<Map<String, dynamic>>(
    (ref) => {
      'content': [],
      'last': false,
      'totalElements': 0,
    },
  );

  // State provider for current page
  final currentPageProvider = StateProvider<int>((ref) => 0);

  // State provider for search key
  final searchKeyProvider = StateProvider<String>((ref) => '');

  @override
  void initState() {
    super.initState();
    searchItem = TextEditingController();
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
          .read(salesRegisterSOProvider((key: searchKey, page: 0)).future);
      if (mounted) {
        ref.read(salesRegisterSOListStateProvider.notifier).state = {
          'content': data.content,
          'last': data.lastPage,
          'totalElements': data.totalElements,
        };
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
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent * 0.9 &&
        !_isLoadingMore &&
        !ref.read(salesRegisterSOListStateProvider)['last']) {
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
          salesRegisterSOProvider((key: searchKey, page: nextPage)).future);

      if (mounted) {
        ref.read(salesRegisterSOListStateProvider.notifier).update((state) {
          final updatedContent = [...state['content'], ...newData.content];
          return {
            'content': updatedContent,
            'last': newData.lastPage,
            'totalElements': newData.totalElements,
          };
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
    ref.read(searchKeyProvider.notifier).state = searchItem.text;
    ref.invalidate(salesRegisterSOProvider); // Clear cache
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
      backgroundColor: const Color(0xfff9f9f9),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          HandText.srSOWiseTitle,
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings, color: Colors.white),
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
              color: Colors.white,
              border: Border.all(),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${HandText.totalRecords} ${salesRegisterSOList['totalElements']}",
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
                          controller: searchItem,
                          decoration: InputDecoration(
                            hintText: HandText.searchBox,
                            prefixIcon: const Icon(Icons.search),
                            border: const OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 104, 181, 244),
                                width: 2.0,
                              ),
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 8),
                          ),
                          cursorHeight: 20,
                          cursorColor: Colors.blue,
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
                            color: Colors.blue,
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Icon(Icons.search, color: Colors.white),
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
                : salesRegisterSOList['content'].isEmpty
                    ? Center(child: Text(HandText.noData))
                    : ListView.builder(
                        controller: _scrollController,
                        itemCount: salesRegisterSOList['content'].length,
                        itemBuilder: (context, index) {
                          final item = salesRegisterSOList['content'][index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SoWiseDetails(
                                      data: salesRegisterSOList['content'],
                                      index: index,
                                    ),
                                  ),
                                );
                              },
                              child: Card(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.soNumber,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      _buildTextRow(
                                          HandText.srSODate, item.soDate),
                                      _buildTextRow(HandText.srSOQuantity,
                                          item.soQuantity),
                                      _buildTextRow(HandText.srInvoiceQuantity,
                                          item.invoiceQuantity),
                                      _buildTextRow(HandText.srSOValueNet,
                                          item.soValueNet),
                                      _buildTextRow(HandText.srSOValueGross,
                                          item.soValueGross),
                                      _buildTextRow(
                                          HandText.srBaseValue, item.baseValue),
                                      _buildTextRow(HandText.srCGST, item.cgst),
                                      _buildTextRow(HandText.srSGST, item.sgst),
                                      _buildTextRow(HandText.srIGST, item.igst),
                                      _buildTextRow(HandText.srInvoiceValue,
                                          item.invoiceValue),
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

  // Helper method to build Text.rich rows
  Widget _buildTextRow(String label, dynamic value) {
    return Text.rich(
      TextSpan(
        text: label,
        style: const TextStyle(fontSize: 14, color: Colors.grey),
        children: [
          TextSpan(
            text: value?.toString() ?? 'N/A',
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
