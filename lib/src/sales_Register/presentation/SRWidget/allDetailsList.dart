import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitwoai_report/golobal-Widget/shimmer_screen.dart';
import 'package:vitwoai_report/src/sales_Register/data/salesRegisterFatchData.dart';
import 'package:vitwoai_report/src/sales_Register/presentation/SRDetails/allDetailsPage.dart';
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
  bool _isInitialLoading = true;

  final salesRegisterListStateProvider = StateProvider<Map<String, dynamic>>(
    (ref) => {
      'content': [],
      'last': false,
      'totalElements': 0,
    },
  );

  final currentPageProvider = StateProvider<int>((ref) => 0);

  final searchKeyProvider = StateProvider<String>((ref) => '');

  @override
  void initState() {
    super.initState();
    receivableSearchController = TextEditingController();

    _fetchInitialData();

    _scrollController.addListener(_handleScroll);
  }

  Future<void> _fetchInitialData() async {
    setState(() {
      _isInitialLoading = true;
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
          _isInitialLoading = false;
        });
      }
    }
  }

  void _handleScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent * 0.9 &&
        !_isLoadingMore &&
        !ref.read(salesRegisterListStateProvider)['last']) {
      _loadMoreData();
    }
  }

  Future<void> _loadMoreData() async {
    if (_isLoadingMore) return;

    setState(() {
      _isLoadingMore = true;
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
          _isLoadingMore = false;
        });
      }
    }
  }

  void _handleSearch() {
    ref.read(searchKeyProvider.notifier).state =
        receivableSearchController.text;
    ref.invalidate(salesRegisterProvider);
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
          style: TextStyle(color: AppColor.appbarFont),
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
              color: AppColor.lightFontCpy,
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
                            color: AppColor.searchBttnColor,
                            border: Border.all(color: AppColor.cursonColor),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child:
                              Icon(Icons.search, color: AppColor.lightFontCpy),
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
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AllDetailsPage(
                                            data: salesRegisterList['content'],
                                            index: index)));
                              },
                              child: Card(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            item.items_ItemCode,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Text(
                                            item.invoiceDate,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            item.customer_Trade_name.length > 17
                                                ? '${item.customer_Trade_name.substring(0, 17)}...'
                                                : item.customer_Trade_name,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            item.allTotalAmount,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      )
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
}
