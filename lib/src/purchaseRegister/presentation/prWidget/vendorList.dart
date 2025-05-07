import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:vitwoai_report/golobal-Widget/loadingShimmer.dart';
import 'package:vitwoai_report/golobal-Widget/shimmer_screen.dart';
import 'package:vitwoai_report/src/purchaseRegister/data/purchesRegister_repository.dart';
import 'package:vitwoai_report/src/purchaseRegister/model/POModel.dart';
import 'package:vitwoai_report/src/settings/colors.dart';

final purchaseRegisterPoWiseListStateProvider =
    StateProvider<Map<String, dynamic>>((ref) => {
          'content': [],
          'last': false,
        });

final currentPagePoWiseProvider = StateProvider<int>((ref) => 0);

class VendorList extends ConsumerStatefulWidget {
  const VendorList({super.key});

  @override
  ConsumerState<VendorList> createState() => _VendorListState();
}

class _VendorListState extends ConsumerState<VendorList> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final currentState = ref.read(purchaseRegisterPoWiseListStateProvider);
      if (currentState['content'].isEmpty) {
        _loadPage(0);
      }
    });

    // Add scroll listener for infinite scrolling
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 100 &&
          !_isLoadingMore) {
        final isLastPage =
            ref.read(purchaseRegisterPoWiseListStateProvider)['last'] ?? false;
        if (!isLastPage) {
          final nextPage = ref.read(currentPagePoWiseProvider) + 1;
          _loadMoreData(nextPage);
        }
      }
    });
  }

  Future<void> _loadPage(int pageKey) async {
    try {
      final newData =
          await ref.read(purchesRegisterPoWiseProvider(pageKey).future);
      ref
          .read(purchaseRegisterPoWiseListStateProvider.notifier)
          .update((state) {
        return {
          'content': [...newData.content],
          'last': newData.lastPage,
        };
      });

      ref.read(currentPagePoWiseProvider.notifier).state = pageKey;
    } catch (e) {
      // Handle error
    }
  }

  Future<void> _loadMoreData(int nextPageKey) async {
    setState(() => _isLoadingMore = true);

    try {
      final newData =
          await ref.read(purchesRegisterPoWiseProvider(nextPageKey).future);

      ref
          .read(purchaseRegisterPoWiseListStateProvider.notifier)
          .update((state) {
        final updatedContent = [
          ...state['content'],
          ...newData.content,
        ];
        return {
          'content': updatedContent,
          'last': newData.lastPage,
        };
      });

      ref.read(currentPagePoWiseProvider.notifier).state = nextPageKey;
    } catch (e) {
      // Optionally show an error toast or retry UI
    } finally {
      setState(() => _isLoadingMore = false);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(purchaseRegisterPoWiseListStateProvider);
    final content = state['content'] as List;
    final last = state['last'] as bool;

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: content.isEmpty
                ? ref.watch(purchesRegisterPoWiseProvider(0)).when(
                      data: (data) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          ref
                              .read(purchaseRegisterPoWiseListStateProvider
                                  .notifier)
                              .state = {
                            'content': data.content,
                            'last': data.lastPage,
                          };
                        });
                        return _buildListView(data.content);
                      },
                      error: (error, stack) => Center(
                        child: LottieBuilder.asset(
                          'assets/json/NoDataFound.json',
                          fit: BoxFit.fill,
                          height: screenHeight * 0.33,
                          width: screenWidth * 0.64,
                        ),
                      ),
                      loading: () => screen_shimmer(120, 800),
                    )
                : _buildListView(content.cast<POContentList>()),
          ),
          if (_isLoadingMore)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 9),
              child: loadingShimmer(110, 800),
            ),
        ],
      ),
    );
  }

  Widget _buildListView(List<POContentList> content) {
    if (content.isEmpty) {
      return const Center(child: Text("No Data Found"));
    }

    return ListView.builder(
      controller: _scrollController,
      itemCount: _isLoadingMore ? content.length + 1 : content.length,
      itemBuilder: (context, index) {
        if (index < content.length) {
          final item = content[index];
          return Card(
            color: AppColor.cardBackgroundColor,
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.person_2_outlined,
                          color: AppColor.cardDataIconColor),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          item.vendorName ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Row(
                          children: [
                            Icon(Icons.sticky_note_2,
                                color: AppColor.cardDataIconColor),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text.rich(
                                TextSpan(
                                  text: 'Vendor Code: ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: AppColor.cardDataKeyColor),
                                  children: [
                                    TextSpan(
                                      text: item.vendorCode ?? '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Row(
                          children: [
                            const Icon(Icons.event, color: Colors.grey),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text.rich(
                                TextSpan(
                                  text: 'Invoice Qty: ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: AppColor.cardDataKeyColor),
                                  children: [
                                    TextSpan(
                                      text: item.invoiceQuantity?.toString() ??
                                          '0.0',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Row(
                          children: [
                            const Icon(Icons.manage_accounts,
                                color: Colors.grey),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text.rich(
                                TextSpan(
                                  text: 'Received Qty: ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: AppColor.cardDataKeyColor),
                                  children: [
                                    TextSpan(
                                      text: item.receivedQuantity?.toString() ??
                                          '0.0',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Row(
                          children: [
                            Icon(Icons.currency_rupee_outlined,
                                color: AppColor.cardDataIconColor),
                            Text.rich(
                              TextSpan(
                                text: 'Invoice Value: ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: AppColor.cardDataKeyColor),
                                children: [
                                  TextSpan(
                                    text:
                                        item.invoiceValue?.toString() ?? '0.0',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(fontWeight: FontWeight.w500),
                                  ),
                                ],
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
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: loadingShimmer(110, 800),
          );
        }
      },
    );
  }
}
