import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitwoai_report/golobal-Widget/shimmer_screen.dart';
import 'package:vitwoai_report/src/purchaseRegister/data/purchesRegister_repository.dart';
import 'package:vitwoai_report/src/purchaseRegister/presentation/detailsPage/vendorWiseDetails.dart';
import 'package:vitwoai_report/src/settings/colors.dart';
import 'package:vitwoai_report/src/settings/texts.dart';

class PurchaseOrderList extends ConsumerStatefulWidget {
  const PurchaseOrderList({super.key});

  @override
  ConsumerState<PurchaseOrderList> createState() => _PurchaseOrderListState();
}

class _PurchaseOrderListState extends ConsumerState<PurchaseOrderList> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoadingMore = false;

  final purchaseRegisterVendorWiseListStateProvider =
      StateProvider<Map<String, dynamic>>((ref) => {
            'content': [],
            'last': false,
          });
  final currentPageProvider = StateProvider<int>((ref) => 0);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          !_isLoadingMore) {
        final isLastPage =
            ref.read(purchaseRegisterVendorWiseListStateProvider)['last'] ??
                false;
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

    final newData =
        await ref.read(purchesRegisterVendorWiseProvider(nextPage).future);

    ref
        .read(purchaseRegisterVendorWiseListStateProvider.notifier)
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
    final purchaseRegisterVendorWiseList =
        ref.watch(purchaseRegisterVendorWiseListStateProvider);

    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: purchaseRegisterVendorWiseList['content'].isEmpty
                ? ref.watch(purchesRegisterVendorWiseProvider(0)).when(
                      data: (data) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          ref
                              .read(purchaseRegisterVendorWiseListStateProvider
                                  .notifier)
                              .state = {
                            'content': data.content,
                            'last': data.lastPage,
                          };
                        });
                        return _buildListView(
                            purchaseRegisterVendorWiseList['content']);
                      },
                      error: (error, stack) => Center(
                          child: Text('${HandText.errorMessage} $error')),
                      loading: () => screen_shimmer(120, 800),
                    )
                : _buildListView(purchaseRegisterVendorWiseList['content']),
          ),
          if (_isLoadingMore)
            const Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildListView(List<dynamic> content) {
    return content.isEmpty
        ? Center(child: Text(HandText.noData))
        : ListView.builder(
            controller: _scrollController,
            itemCount: content.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VendorWiseDetails(
                        data: content,
                        index: index,
                      ),
                    ),
                  );
                },
                child: Card(
                  color: AppColor.cardBackgroundColor,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
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
                            SizedBox(
                              width: 150,
                              child: Text(
                                content[index].vendorName.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text.rich(
                              TextSpan(
                                text: HandText.prInvoiceQuantity,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: AppColor.cardDataKeyColor,
                                    ),
                                children: [
                                  TextSpan(
                                    text: content[index]
                                        .invoiceQuantity
                                        .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          fontWeight: FontWeight.w500,
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
                            SizedBox(
                              width: 180,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text.rich(
                                      TextSpan(
                                        text: HandText.prVendorCode,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              color: AppColor.cardDataKeyColor,
                                            ),
                                        children: [
                                          TextSpan(
                                            text: content[index].vendorCode,
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
                            Text.rich(
                              TextSpan(
                                text: HandText.prReceivedQuantity,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: AppColor.cardDataKeyColor,
                                    ),
                                children: [
                                  TextSpan(
                                    text: content[index]
                                        .receivedQuantity
                                        .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          fontWeight: FontWeight.w500,
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
                            Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  color: AppColor.cardDataIconColor,
                                ),
                                Text(
                                  content[index].vendorCode.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.currency_rupee_outlined,
                                  color: AppColor.cardDataIconColor,
                                ),
                                Text(
                                  content[index].invoiceValue.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
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
                ),
              );
            },
          );
  }
}
