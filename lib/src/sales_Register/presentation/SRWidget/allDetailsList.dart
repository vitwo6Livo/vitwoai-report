import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitwoai_report/golobal-Widget/shimmer_screen.dart';
import 'package:vitwoai_report/src/sales_Register/data/salesRegisterFatchData.dart';
import 'package:vitwoai_report/src/settings/colors.dart';
import 'package:vitwoai_report/src/settings/texts.dart';

class AllSalesRegisterList extends ConsumerStatefulWidget {
  const AllSalesRegisterList({super.key});

  @override
  ConsumerState<AllSalesRegisterList> createState() =>
      _AllSalesRegisterListState();
}

class _AllSalesRegisterListState extends ConsumerState<AllSalesRegisterList> {
  late final TextEditingController receivableSearchController;
  final ScrollController _scrollController = ScrollController();
  bool _isLoadingMore = false;
  bool _isInitialLoading = true; // Track initial loading state

  // State provider for sales register list
  final salesRegisterListStateProvider = StateProvider<Map<String, dynamic>>(
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
    receivableSearchController = TextEditingController();
    // Fetch initial data
    _fetchInitialData();
    // Add scroll listener for pagination
    _scrollController.addListener(_handleScroll);
  }

  // Fetch initial data for the first page
  Future<void> _fetchInitialData() async {
    setState(() {
      _isInitialLoading = true; // Show loading indicator
    });

    try {
      final searchKey = ref.read(searchKeyProvider);
      final data = await ref
          .read(salesRegisterProvider((key: searchKey, page: 0)).future);
      if (mounted) {
        ref.read(salesRegisterListStateProvider.notifier).state = {
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
          _isInitialLoading = false; // Hide loading indicator
        });
      }
    }
  }

  // Handle scroll to load more data
  void _handleScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent * 0.9 &&
        !_isLoadingMore &&
        !ref.read(salesRegisterListStateProvider)['last']) {
      _loadMoreData();
    }
  }

  // Load more data for pagination
  Future<void> _loadMoreData() async {
    if (_isLoadingMore) return;

    setState(() {
      _isLoadingMore = true; // Show loading indicator
    });

    try {
      final searchKey = ref.read(searchKeyProvider);
      final currentPage = ref.read(currentPageProvider);
      final nextPage = currentPage + 1;
      final newData = await ref
          .read(salesRegisterProvider((key: searchKey, page: nextPage)).future);

      if (mounted) {
        ref.read(salesRegisterListStateProvider.notifier).update((state) {
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
          _isLoadingMore = false; // Hide loading indicator
        });
      }
    }
  }

  // Handle search
  void _handleSearch() {
    ref.read(searchKeyProvider.notifier).state =
        receivableSearchController.text;
    ref.invalidate(salesRegisterProvider); // Clear cache
    _fetchInitialData();
  }

  @override
  void dispose() {
    receivableSearchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final salesRegisterList = ref.watch(salesRegisterListStateProvider);

    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          HandText.srAllSalesRegisterTitle,
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
            alignment: Alignment.centerLeft,
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
                  "${HandText.totalRecords} ${salesRegisterList['totalElements']}",
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
                          controller: receivableSearchController,
                          decoration: InputDecoration(
                            hintText: HandText.searchBox,
                            prefixIcon: const Icon(Icons.search),
                            border: const OutlineInputBorder(),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 5),
                          ),
                          onSubmitted: (_) => _handleSearch(),
                        ),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: GestureDetector(
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
                : salesRegisterList['content'].isEmpty
                    ? Center(child: Text(HandText.noData))
                    : ListView.builder(
                        controller: _scrollController,
                        itemCount: salesRegisterList['content'].length,
                        itemBuilder: (context, index) {
                          final item = salesRegisterList['content'][index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            child: Card(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.items_ItemName,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    _buildTextRow(HandText.srItemCode,
                                        item.items_ItemCode),
                                    _buildTextRow(HandText.srItemGroupName,
                                        item.items_GoodsItems_goodGroupName),
                                    _buildTextRow(HandText.srCustomerName,
                                        item.customer_Trade_name),
                                    _buildTextRow(HandText.srCustomerCode,
                                        item.customer_Customer_code),
                                    _buildTextRow(HandText.srCustomerGSTNo,
                                        item.customer_Customer_gstin),
                                    _buildTextRow(
                                        HandText.srKamCode, item.kam_KamCode),
                                    _buildTextRow(
                                        HandText.srKamName, item.kam_KamName),
                                    _buildTextRow(
                                        HandText.srInvoiceNo, item.invoiceNo),
                                    _buildTextRow(HandText.srInvoiceDate,
                                        item.invoiceDate),
                                    _buildTextRow(HandText.srInvoiceQuantity,
                                        item.items_Qty),
                                    _buildTextRow(HandText.srBaseValue,
                                        item.sub_total_amt),
                                    _buildTextRow(HandText.srInvoiceValue,
                                        item.allTotalAmount),
                                    _buildTextRow(HandText.srCustomerAddress,
                                        item.customer_Customer_address_state),
                                    _buildTextRow(HandText.srFunctionalArea,
                                        item.companyFunction_functionalities_name),
                                  ],
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
