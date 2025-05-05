// PR ALL

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vitwoai_report/golobal-Widget/loadingShimmer.dart';
import 'package:vitwoai_report/golobal-Widget/shimmer_screen.dart';
import 'package:vitwoai_report/src/purchaseRegister/data/purchesRegister_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitwoai_report/src/purchaseRegister/presentation/detailsPage/newPrAllDetails.dart';
import 'package:vitwoai_report/src/settings/colors.dart';
import 'package:vitwoai_report/src/settings/texts.dart';

class ProductList extends ConsumerStatefulWidget {
  const ProductList({super.key});

  @override
  ConsumerState<ProductList> createState() => _ProductListState();
}

class _ProductListState extends ConsumerState<ProductList> {
  final ScrollController _scrollController = ScrollController();

  bool _isLoadingMore = false;

  final purchesRegisterListStateProvider =
      StateProvider<Map<String, dynamic>>((ref) => {
            'content': [],
            'last': false,
          });
  final currentPageProvider = StateProvider<int>((ref) => 0);

  @override
  void initState() {
    super.initState();
    // Add listener to detect when user reaches the end of the list
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 100 &&
          !_isLoadingMore) {
        final isLastPage =
            ref.read(purchesRegisterListStateProvider)['last'] ?? false;

        if (!isLastPage) {
          _loadMoreData();
        }
      }
    });
  }

  void _loadMoreData() async {
    setState(() {
      _isLoadingMore = true;
    });

    final currentPage = ref.read(currentPageProvider);
    final nextPage = currentPage + 1;

    final newData = await ref.read(purchesRegisterProvider(nextPage).future);

    // Update the state with new data
    ref.read(purchesRegisterListStateProvider.notifier).update((state) {
      final updatedContent = [
        ...state['content'],
        ...newData.content,
      ];
      return {
        'content': updatedContent,
        'last': newData.lastPage,
      };
    });

    // Update the current page
    ref.read(currentPageProvider.notifier).state = nextPage;

    setState(() {
      _isLoadingMore = false;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final purchesRegisterList = ref.watch(purchesRegisterListStateProvider);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: purchesRegisterList['content'].isEmpty
                ? ref.watch(purchesRegisterProvider(0)).when(
                    data: (data) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        ref
                            .read(purchesRegisterListStateProvider.notifier)
                            .state = {
                          'content': data.content,
                          'last': data.lastPage,
                        };
                      });
                      return _buildListView(purchesRegisterList['content']);
                    },
                    error: (error, stack) => Center(
                          child: LottieBuilder.asset(
                            'assets/json/NoDataFound.json',
                            fit: BoxFit.fill,
                            height: screenHeight * 0.33,
                            width: screenWidth * 0.64,
                          ),
                        ),
                    loading: () => screen_shimmer(120, 500))
                : _buildListView(purchesRegisterList['content']),
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

  Widget _buildListView(List<dynamic> content) {
    return content.isEmpty
        ? Center(
            child: Text(HandText.noData),
          )
        : ListView.builder(
            controller: _scrollController,
            itemCount: _isLoadingMore ? content.length + 1 : content.length,
            itemBuilder: (context, index) {
              if (index < content.length) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => newAllPRDetailsScreen(
                          data: content,
                          index: index,
                        ),
                      ),
                    );
                  },
                  child: _buildCard(index, content, context),
                );
              } else {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: loadingShimmer(110, 800),
                );
              }
            },
          );
  }
}

Widget _buildCard(int index, List<dynamic> content, BuildContext context) {
  return Card(
    color: AppColor.cardBackgroundColor,
    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    elevation: 4,
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                      content[index].grn_vendors_tradename.toString(),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text.rich(
                    TextSpan(
                      text: HandText.prQty,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.grey,
                          ),
                      children: [
                        TextSpan(
                          text:
                              content[index].grnInvoiceItems_goodQty.toString(),
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 180,
                child: Row(
                  children: [
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          text: HandText.prItem,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Colors.grey,
                                  ),
                          children: [
                            TextSpan(
                              text: content[index].grnInvoiceItems_ItemName,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text.rich(
                    TextSpan(
                      text: HandText.prItemCode,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.grey,
                          ),
                      children: [
                        TextSpan(
                          text: content[index].grnInvoiceItems_GoodCode,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                  Text(
                    content[index].grnVendors_Vendor_code.toString(),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.currency_rupee_outlined,
                    color: Colors.grey,
                  ),
                  Text(
                    content[index].grnTotalAmount.toString(),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
