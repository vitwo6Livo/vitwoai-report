// // PR PO Wise

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:lottie/lottie.dart';
// import 'package:vitwoai_report/golobal-Widget/shimmer_screen.dart';
// import 'package:vitwoai_report/src/purchaseRegister/data/purchesRegister_repository.dart';
// import 'package:vitwoai_report/src/settings/colors.dart';

// class VendorList extends ConsumerWidget {
//   const VendorList({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     double screenHeight = MediaQuery.of(context).size.height;

//     double screenWidth = MediaQuery.of(context).size.width;
//     final purchaseRegisterPoWiseList = ref.watch(purchesRegisterPoWiseProvider);
//     return purchaseRegisterPoWiseList.when(
//       data: (data) {
//         return data['content'].length == 0
//             ? Center(
//                 child: LottieBuilder.asset(
//                   'assets/json/NoDataFound.json',
//                   fit: BoxFit.fill,
//                   height: screenHeight * 0.33,
//                   width: screenWidth * 0.64,
//                 ),
//               )
//             : ListView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: data['content'].length,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     color: AppColor.cardBackgroundColor,
//                     margin:
//                         const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     elevation: 4,
//                     child: Padding(
//                       padding: const EdgeInsets.all(16),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Icon(
//                                 Icons.person_2_outlined,
//                                 color: AppColor.cardDataIconColor,
//                               ),
//                               const SizedBox(width: 8),
//                               Expanded(
//                                 child: Text(
//                                   data['content'][index]['Vendor Name'],
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .bodySmall!
//                                       .copyWith(
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 10),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Flexible(
//                                 flex: 2,
//                                 child: Row(
//                                   children: [
//                                     Icon(
//                                       Icons.sticky_note_2,
//                                       color: AppColor.cardDataIconColor,
//                                     ),
//                                     const SizedBox(width: 8),
//                                     Expanded(
//                                       child: Text.rich(
//                                         TextSpan(
//                                           text: 'Vendor Code: ',
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .bodySmall!
//                                               .copyWith(
//                                                 color:
//                                                     AppColor.cardDataKeyColor,
//                                               ),
//                                           children: [
//                                             TextSpan(
//                                               text: data['content'][index]
//                                                   ['Vendor Code'],
//                                               style: Theme.of(context)
//                                                   .textTheme
//                                                   .bodySmall!
//                                                   .copyWith(
//                                                     fontWeight: FontWeight.w500,
//                                                   ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Flexible(
//                                 flex: 2,
//                                 child: Row(
//                                   children: [
//                                     const Icon(
//                                       Icons.event,
//                                       color: Colors.grey,
//                                     ),
//                                     const SizedBox(width: 8),
//                                     Expanded(
//                                       child: Text.rich(
//                                         TextSpan(
//                                           text: 'Invoice Quantity: \n',
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .bodySmall!
//                                               .copyWith(
//                                                 color:
//                                                     AppColor.cardDataKeyColor,
//                                               ),
//                                           children: [
//                                             TextSpan(
//                                               text: data['content'][index]
//                                                       ['Invoice Quantity'] ??
//                                                   '0.0',
//                                               style: Theme.of(context)
//                                                   .textTheme
//                                                   .bodySmall!
//                                                   .copyWith(
//                                                     fontWeight: FontWeight.w500,
//                                                   ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 10),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Flexible(
//                                 flex: 2,
//                                 child: Row(
//                                   children: [
//                                     const Icon(
//                                       Icons.manage_accounts,
//                                       color: Colors.grey,
//                                     ),
//                                     const SizedBox(width: 8),
//                                     Expanded(
//                                       child: Text.rich(
//                                         TextSpan(
//                                           text: 'Received Quantity: ',
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .bodySmall!
//                                               .copyWith(
//                                                 color:
//                                                     AppColor.cardDataKeyColor,
//                                               ),
//                                           children: [
//                                             TextSpan(
//                                               text: data['content'][index]
//                                                       ['Received Quantity'] ??
//                                                   '0.0',
//                                               style: Theme.of(context)
//                                                   .textTheme
//                                                   .bodySmall!
//                                                   .copyWith(
//                                                     fontWeight: FontWeight.w500,
//                                                   ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Flexible(
//                                 flex: 2,
//                                 child: Row(
//                                   children: [
//                                     Icon(
//                                       Icons.currency_rupee_outlined,
//                                       color: AppColor.cardDataIconColor,
//                                     ),
//                                     // const SizedBox(width: 8),
//                                     Text.rich(
//                                       TextSpan(
//                                         text: 'Invoice Value: \n',
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .bodySmall!
//                                             .copyWith(
//                                               color: AppColor.cardDataKeyColor,
//                                             ),
//                                         children: [
//                                           TextSpan(
//                                             text: data['content'][index]
//                                                     ['Invoice Value'] ??
//                                                 '0.0',
//                                             style: Theme.of(context)
//                                                 .textTheme
//                                                 .bodySmall!
//                                                 .copyWith(
//                                                   fontWeight: FontWeight.w500,
//                                                 ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 });
//       },
//       error: (error, stack) => Center(child: Text('Error: $error')),
//       loading: () => screen_shimmer(120, 800),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:vitwoai_report/golobal-Widget/loadingShimmer.dart';
import 'package:vitwoai_report/golobal-Widget/shimmer_screen.dart';
import 'package:vitwoai_report/src/purchaseRegister/data/purchesRegister_repository.dart';
import 'package:vitwoai_report/src/purchaseRegister/presentation/detailsPage/newVendorWiseDetails.dart';
import 'package:vitwoai_report/src/settings/colors.dart';
import 'package:vitwoai_report/src/settings/texts.dart';

class VendorList extends ConsumerStatefulWidget {
  const VendorList({super.key});

  @override
  ConsumerState<VendorList> createState() => _VendorListState();
}

class _VendorListState extends ConsumerState<VendorList> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoadingMore = false;

  final purchaseRegisterPoWiseListStateProvider =
      StateProvider<Map<String, dynamic>>((ref) => {
            'content': [],
            'last': false,
          });
  final currentPageProvider = StateProvider<int>((ref) => 0);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 100 &&
          !_isLoadingMore) {
        final isLastPage =
            ref.read(purchaseRegisterPoWiseListStateProvider)['last'] ?? false;
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
        await ref.read(purchesRegisterPoWiseProvider(nextPage).future);

    ref.read(purchaseRegisterPoWiseListStateProvider.notifier).update((state) {
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
    final purchaseRegisterPoWiseList =
        ref.watch(purchaseRegisterPoWiseListStateProvider);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: purchaseRegisterPoWiseList['content'].isEmpty
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
                        return _buildListView(
                            purchaseRegisterPoWiseList['content']);
                      },
                      error: (error, stack) => Text('Error: $error'),
                      // Center(
                      //   child: LottieBuilder.asset(
                      //     'assets/json/NoDataFound.json',
                      //     fit: BoxFit.fill,
                      //     height: screenHeight * 0.33,
                      //     width: screenWidth * 0.64,
                      //   ),
                      // ),
                      loading: () => screen_shimmer(120, 800),
                    )
                : _buildListView(purchaseRegisterPoWiseList['content']),
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
            itemCount: _isLoadingMore ? content.length + 1 : content.length,
            itemBuilder: (context, index) {
              if (index < content.length) {
                return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => newVendorWiseDetails(
                            data: content,
                            index: index,
                          ),
                        ),
                      );
                    },
                    child: _buildCard(index, content, context));
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
              SizedBox(
                width: 150,
                child: Text(
                  content[index].vendorName.toString(),
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text.rich(
                TextSpan(
                  text: HandText.prInvoiceQuantity,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColor.cardDataKeyColor,
                      ),
                  children: [
                    TextSpan(
                      text: content[index].invoiceQuantity.toString(),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
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
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
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
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColor.cardDataKeyColor,
                      ),
                  children: [
                    TextSpan(
                      text: content[index].receivedQuantity.toString(),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
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
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
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
