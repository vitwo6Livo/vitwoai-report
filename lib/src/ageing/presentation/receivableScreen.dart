import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vitwoai_report/golobal-Widget/dayCalendar.dart';
import 'package:vitwoai_report/golobal-Widget/shimmer_screen.dart';
import 'package:vitwoai_report/src/ageing/data/receivableAnalytics_repositry.dart';
import 'package:vitwoai_report/src/ageing/presentation/newReceivableDetailsScreen.dart';
import 'package:vitwoai_report/src/settings/colors.dart';
import 'package:vitwoai_report/src/settings/texts.dart';

final isClickedProviderReceivable = StateProvider<bool>((ref) => false);

class ReceivableAnalyticsScreen extends ConsumerStatefulWidget {
  const ReceivableAnalyticsScreen({super.key});

  @override
  ConsumerState<ReceivableAnalyticsScreen> createState() =>
      _ReceivableAnalyticsScreenState();
}

class _ReceivableAnalyticsScreenState
    extends ConsumerState<ReceivableAnalyticsScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoadingMore = false;

  // State providers
  final customerListStateProvider =
      StateProvider<Map<String, dynamic>>((ref) => {
            'content': [],
            'last': false,
          });
  final currentPageProvider = StateProvider<int>((ref) => 0);
  final selectedDateProvider = StateProvider<DateTime?>((ref) => null);

  @override
  void initState() {
    super.initState();
    _initializeData();

    // Add listener to detect when user reaches the end of the list
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          !_isLoadingMore) {
        final isLastPage = ref.read(customerListStateProvider)['last'] ?? false;
        if (!isLastPage) {
          _loadMoreData();
        }
      }
    });
  }

  void _initializeData() async {
    final selectedDate = ref.read(selectedDateProvider) ?? DateTime.now();
    final initialData = await ref.read(
        receivablesCustomerProvider({'page': 0, 'dateInfo': selectedDate})
            .future);

    ref.read(customerListStateProvider.notifier).state = {
      'content': initialData.content,
      'last': initialData.lastPage,
    };
  }

  void _loadMoreData() async {
    setState(() {
      _isLoadingMore = true;
    });

    final currentPage = ref.read(currentPageProvider);
    final nextPage = currentPage + 1;
    final selectedDate = ref.read(selectedDateProvider) ?? DateTime.now();

    try {
      final newData = await ref.read(receivablesCustomerProvider(
          {'page': nextPage, 'dateInfo': selectedDate}).future);

      ref.read(customerListStateProvider.notifier).update((state) {
        final updatedContent = [
          ...state['content'],
          ...newData.content,
        ];
        return {
          'content': updatedContent,
          'last': newData.lastPage,
        };
      });

      ref.read(currentPageProvider.notifier).state = nextPage;
    } catch (e) {
      print('Error loading more data: $e');
    } finally {
      setState(() {
        _isLoadingMore = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void showDateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => DayCalendarPickerDialog(
        initialFromDate: DateTime.now(),
        onSave: (fromDate) {
          // Update the selected date in the provider
          ref.read(selectedDateProvider.notifier).state = fromDate;

          // Trigger a refresh of the data with the new date
          _initializeData();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final receivablesAsync = ref.watch(receivablesTotalDueProvider);
    final coustomerListProvider = ref.watch(customerListStateProvider);
    final selectedDate = ref.watch(selectedDateProvider) ?? DateTime.now();
    // final count = ref.watch(
    //   receivablesCustomerProvider({'page': 0, 'dateInfo': selectedDate}),
    // );

    final count = ref.watch(totalElementsProvider);

    print('aaaaaaaaaaaaaaaaaaaaaaaaaaa: ${count}');
    return Scaffold(
      backgroundColor: AppColor.screenBgColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Section
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColor.appBarColor1, AppColor.appBarColor2],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        HandText.receivableTitle,
                        style: TextStyle(
                          color: AppColor.lightFontCpy,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          showDateDialog(context);
                        },
                        icon: Icon(
                          Icons.settings,
                          color: AppColor.lightFontCpy,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  receivablesAsync.when(
                    data: (data) {
                      final totalOfTotalDue = data.TotalOfTotalDue.toString();
                      final totalOnAccountDue =
                          data.TotalOnAccountDue.toString();
                      final netDue = data.NetDue.toString();
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${HandText.inr}$totalOfTotalDue",
                            style: TextStyle(
                              color: AppColor.lightFontCpy,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                HandText.receivableOnAccountDue,
                                style: TextStyle(color: AppColor.lightFontCpy2),
                              ),
                              const Spacer(),
                              Text(
                                "${HandText.inr}$totalOnAccountDue",
                                style: TextStyle(color: AppColor.lightFontCpy),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                HandText.receivableNetDue,
                                style: TextStyle(color: AppColor.lightFontCpy2),
                              ),
                              const Spacer(),
                              Text(
                                "${HandText.inr}$netDue",
                                style: TextStyle(color: AppColor.lightFontCpy),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                    loading: () => Shimmer.fromColors(
                      baseColor: AppColor.shimmerBaseColor,
                      highlightColor: AppColor.shimmerHighlightColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 150,
                            height: 30,
                            decoration: BoxDecoration(
                              color: AppColor.shimmerBoxDecorationColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Container(
                                width: 100,
                                height: 15,
                                decoration: BoxDecoration(
                                  color: AppColor.shimmerDecorationColor,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                width: 80,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: AppColor.shimmerDecorationColor,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Container(
                                width: 60,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: AppColor.shimmerDecorationColor,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                width: 80,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: AppColor.shimmerDecorationColor,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    error: (error, stack) =>
                        Center(child: Text('${HandText.errorMessage} $error')),
                  ),
                ],
              ),
            ),

            // Search Bar
            Container(
              height: 80,
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: AppColor.lightFontCpy,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${HandText.totalRecords} ${count.toString()}",
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
                            decoration: InputDecoration(
                              hintText: HandText.searchBox,
                              prefixIcon: const Icon(Icons.search),
                              border: const OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColor.searchOutlineColor,
                                  width: 2.0,
                                ),
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 8),
                            ),
                            cursorHeight: 20,
                            cursorColor: AppColor.cursonColor,
                          ),
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
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
                    ],
                  ),
                ],
              ),
            ),

            // List View
            Expanded(
              child: coustomerListProvider['content'].isEmpty
                  ? ref
                      .watch(receivablesCustomerProvider(
                          {'page': 0, 'dateInfo': selectedDate}))
                      .when(
                          data: (data) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              ref
                                  .read(customerListStateProvider.notifier)
                                  .state = {
                                'content': data.content,
                                'last': data.lastPage,
                              };
                            });
                            return _buildListView(
                                coustomerListProvider['content']);
                          },
                          error: (error, stack) =>
                              Center(child: Text('Error: $error')),
                          loading: () => screen_shimmer(120, 800))
                  : _buildListView(coustomerListProvider['content']),
            ),

            // Loading Indicator
            if (_isLoadingMore)
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildListView(List<dynamic> content) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: content.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => newReceivableDetailsScreen(
                    data: content,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      content[index].customerName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: "${HandText.receivableCustomerCode}\n",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                            children: [
                              TextSpan(
                                text: content[index].customerCode.toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            text: "${HandText.receivableTotalDue}\n",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                            children: [
                              TextSpan(
                                text: content[index].totalDue.toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: "${HandText.receivableOnAccountDue}\n",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                            children: [
                              TextSpan(
                                text: content[index].onAccountDue.toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            text: "${HandText.receivableNetDue}\n",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                            children: [
                              TextSpan(
                                text: content[index].netDue.toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
