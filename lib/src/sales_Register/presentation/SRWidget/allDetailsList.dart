import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitwoai_report/golobal-Widget/dayCalendar.dart';
import 'package:vitwoai_report/golobal-Widget/loadingShimmer.dart';
import 'package:vitwoai_report/golobal-Widget/rangeCalendar.dart';
import 'package:vitwoai_report/golobal-Widget/shimmer_screen.dart';
import 'package:vitwoai_report/src/sales_Register/data/salesRegisterFatchData.dart';
import 'package:vitwoai_report/src/sales_Register/model/salesAllDetailsModel.dart';
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

  final salesRegisterListStateProvider = StateProvider<SalesAllDetailsmodel>(
    (ref) => SalesAllDetailsmodel(
      content: [],
      pageNumber: 0,
      pageSize: 0,
      totalElements: 0,
      totalPages: 0,
      lastPage: false,
    ),
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
        ref.read(salesRegisterListStateProvider.notifier).state = data;
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
    final model = ref.read(salesRegisterListStateProvider);
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent * 0.9 &&
        !_isLoadingMore &&
        !model.lastPage) {
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
          return SalesAllDetailsmodel(
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

  void showDateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => DayCalendarPickerDialog(
        initialFromDate: DateTime.now(),
        onSave: (date) {
          print("Selected date: $date");
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final salesRegisterList = ref.watch(salesRegisterListStateProvider);

    return Scaffold(
      backgroundColor: AppColor.screenBgColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: AppColor.appBarIcon),
        ),
        title: Text(
          HandText.srAllSalesRegisterTitle,
          style: TextStyle(color: AppColor.appbarFont),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDateDialog(context);
            },
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
                  "${HandText.totalRecords} ${salesRegisterList.totalElements}",
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
                            color: AppColor.appBarGradiant,
                            border: Border.all(color: AppColor.appBarGradiant),
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
                : salesRegisterList.content.isEmpty
                    ? Center(child: Text(HandText.noData))
                    : ListView.builder(
                        controller: _scrollController,
                        itemCount: salesRegisterList.content.length,
                        itemBuilder: (context, index) {
                          final item = salesRegisterList.content[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AllDetailsPage(
                                            data: salesRegisterList.content,
                                            index: index)));
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
                                          _buildDataRow(Icons.qr_code,
                                              item.items_ItemCode),
                                          _buildDataRow(
                                              Icons.event, item.invoiceDate),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          _buildDataRow(
                                              Icons.business,
                                              item.customer_Trade_name.length >
                                                      17
                                                  ? '${item.customer_Trade_name.substring(0, 17)}...'
                                                  : item.customer_Trade_name),
                                          _buildDataRow(Icons.attach_money,
                                              item.allTotalAmount)
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 9),
              child: loadingShimmer(100, 800),
            ),
        ],
      ),
    );
  }
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
        style:
            TextStyle(fontWeight: FontWeight.w500, color: AppColor.lightFont),
      ),
    ],
  );
}
