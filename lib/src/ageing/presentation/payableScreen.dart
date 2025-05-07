import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitwoai_report/golobal-Widget/dayCalendar.dart';
import 'package:vitwoai_report/src/ageing/data/receivableAnalytics_repositry.dart';
import 'package:vitwoai_report/src/ageing/model/payableModel.dart';
import 'package:vitwoai_report/src/ageing/presentation/payableDetailsScreen.dart';
import 'package:vitwoai_report/src/settings/colors.dart';
import 'package:vitwoai_report/src/settings/texts.dart';
import 'package:vitwoai_report/golobal-Widget/loadingShimmer.dart';
import 'package:vitwoai_report/golobal-Widget/shimmer_screen.dart';
import 'package:lottie/lottie.dart';

class PayableScreen extends ConsumerStatefulWidget {
  const PayableScreen({super.key});

  @override
  ConsumerState<PayableScreen> createState() => _PayableScreenState();
}

class _PayableScreenState extends ConsumerState<PayableScreen> {
  late final TextEditingController searchController;
  final ScrollController _scrollController = ScrollController();
  bool _isLoadingMore = false;
  bool _isInitialLoading = true;

  final payableListStateProvider = StateProvider<PayableModel>((ref) {
    return PayableModel(
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
    searchController = TextEditingController();
    _fetchInitialData();
    _scrollController.addListener(_handleScroll);
  }

  Future<void> _fetchInitialData() async {
    setState(() => _isInitialLoading = true);

    try {
      final searchKey = ref.read(searchKeyProvider);
      debugPrint('Fetching initial data with searchKey: "$searchKey"');
      final data = await ref.read(
        payableCustomerProvider({'key': searchKey, 'page': 0}).future,
      );

      if (mounted) {
        ref.read(payableListStateProvider.notifier).state = data;
        ref.read(currentPageProvider.notifier).state = 0;
        debugPrint('Initial data fetched: ${data.content.length} items');
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

  void showDateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => DayCalendarPickerDialog(
        initialFromDate: DateTime.now(),
        onSave: (fromDate) {},
      ),
    );
  }

  void _handleScroll() {
    final model = ref.read(payableListStateProvider);
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 100 &&
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
      debugPrint(
          'Loading more data with searchKey: "$searchKey", page: $nextPage');

      final newData = await ref.read(
        payableCustomerProvider({'key': searchKey, 'page': nextPage}).future,
      );

      if (mounted) {
        ref.read(payableListStateProvider.notifier).update((state) {
          return PayableModel(
            content: [...state.content, ...newData.content],
            pageNumber: newData.pageNumber,
            pageSize: newData.pageSize,
            totalElements: newData.totalElements,
            totalPages: newData.totalPages,
            lastPage: newData.lastPage,
          );
        });
        ref.read(currentPageProvider.notifier).state = nextPage;
        debugPrint('Loaded more data: ${newData.content.length} items');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load more data: $e')),
        );
        debugPrint('Error loading more data: $e');
      }
    } finally {
      if (mounted) {
        setState(() => _isLoadingMore = false);
      }
    }
  }

  void _handleSearch() {
    final searchText = searchController.text;
    ref.read(searchKeyProvider.notifier).state = searchText;
    ref.invalidate(payableCustomerProvider);
    debugPrint('Search triggered with text: "$searchText"');
    _fetchInitialData();
  }

  @override
  void dispose() {
    searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final payableList = ref.watch(payableListStateProvider);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.screenBgColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColor.appBarIcon),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Payable",
          style: TextStyle(color: AppColor.appbarFont),
        ),
        centerTitle: true,
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.settings, color: AppColor.appBarIcon),
        //     onPressed: () {
        //       showDateDialog(context);
        //     },
        //   ),
        // ],
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
          _buildSearchBox(payableList.totalElements),
          Expanded(
            child: _isInitialLoading
                ? screen_shimmer(120, 800)
                : payableList.content.isEmpty
                    ? Center(
                        child: LottieBuilder.asset(
                          'assets/json/NoDataFound.json',
                          fit: BoxFit.fill,
                          height: screenHeight * 0.38,
                          width: screenWidth * 0.68,
                        ),
                      )
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        controller: _scrollController,
                        itemCount: _isLoadingMore
                            ? payableList.content.length + 1
                            : payableList.content.length,
                        itemBuilder: (context, index) {
                          if (index < payableList.content.length) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              child:
                                  _buildPayableCard(index, payableList.content),
                            );
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
        ],
      ),
    );
  }

  Widget _buildPayableCard(int index, List<Content> content) {
    final item = content[index];

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PayableDetailsPage(
                      data: content,
                      index: index,
                    )));
      },
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.vendorName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                        text: "Customer Code: \n",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        children: [
                          TextSpan(
                            text: item.vendorCode.toString(),
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black),
                          )
                        ]),
                  ),
                  Text.rich(
                    TextSpan(
                        text: "Total Due: \n",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        children: [
                          TextSpan(
                            text: item.totalDue.toString(),
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black),
                          )
                        ]),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                        text: "On Account Due: \n",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        children: [
                          TextSpan(
                            text: item.onAccountDue.toString(),
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black),
                          )
                        ]),
                  ),
                  Text.rich(
                    TextSpan(
                        text: "Net Due: \n",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        children: [
                          TextSpan(
                            text: item.netDue.toString(),
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black),
                          )
                        ]),
                  ),
                ],
              )
            ],
          ),
        ),
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
          Text(
            "${HandText.totalRecords} $totalElements",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                flex: 9,
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  height: 40,
                  child: TextField(
                    controller: searchController,
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
}
