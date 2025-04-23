import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitwoai_report/golobal-Widget/shimmer_screen.dart';
import 'package:vitwoai_report/src/purchaseRegister/data/purchesRegister_repository.dart';
import 'package:vitwoai_report/src/purchaseRegister/presentation/detailsPage/itemGroupWiseDetails.dart';
import 'package:vitwoai_report/src/purchaseRegister/presentation/detailsPage/newItemGroupWiseDetails.dart';
import 'package:vitwoai_report/src/settings/colors.dart';
import 'package:vitwoai_report/src/settings/texts.dart';

class StorageLocationList extends ConsumerWidget {
  const StorageLocationList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final purchesRegisterItemGroupData =
        ref.watch(purchesRegisterItemGroupWiseProvider);
    return purchesRegisterItemGroupData.when(
      data: (data) {
        return data.content.isEmpty
            ? Center(
                child: Text(HandText.noData),
              )
            : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data.content.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => newItemGroupWiseDetailsScreen(
                                  data: data.content, index: index)));
                    },
                    child: Card(
                      color: AppColor.cardBackgroundColor,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 1.8),
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
                                    Icon(
                                      Icons.factory,
                                      color: AppColor.cardDataIconColor,
                                    ),
                                    SizedBox(
                                      width: 150,
                                      child: Text(
                                        data.content[index].ItemGroupName,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              fontWeight: FontWeight.w500,
                                            ),
                                        overflow: TextOverflow.ellipsis,
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
                                    Icon(
                                      Icons.eject_outlined,
                                      color: AppColor.cardDataIconColor,
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        text: '${HandText.prInvoiceQuantity}\n',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              color: AppColor.cardDataKeyColor,
                                            ),
                                        children: [
                                          TextSpan(
                                            text: data
                                                .content[index].invoiceQuantity,
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
                                Row(
                                  children: [
                                    Icon(
                                      Icons.graphic_eq_outlined,
                                      color: AppColor.cardDataIconColor,
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        text:
                                            '${HandText.prReceivedQuantity}\n',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              color: AppColor.cardDataKeyColor,
                                            ),
                                        children: [
                                          TextSpan(
                                            text: data.content[index]
                                                .receivedQuantity,
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
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.eject_outlined,
                                      color: AppColor.cardDataIconColor,
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        text: '${HandText.prBaseValue}\n',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              color: AppColor.cardDataKeyColor,
                                            ),
                                        children: [
                                          TextSpan(
                                            text: data.content[index].baseValue,
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
                                Row(
                                  children: [
                                    Icon(
                                      Icons.eject_outlined,
                                      color: AppColor.cardDataIconColor,
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        text: '${HandText.prInvoiceValue}\n',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              color: AppColor.cardDataKeyColor,
                                            ),
                                        children: [
                                          TextSpan(
                                            text: data
                                                .content[index].invoiceValue,
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
                              ],
                            ),
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     const Icon(
                            //       Icons.currency_rupee_outlined,
                            //       color: Colors.grey,
                            //     ),
                            //     Text.rich(
                            //       TextSpan(
                            //         text: 'Total Amount: ',
                            //         style:
                            //             Theme.of(context).textTheme.bodySmall!.copyWith(
                            //                   color: Colors.grey,
                            //                 ),
                            //         children: [
                            //           TextSpan(
                            //             text: '23600',
                            //             style: Theme.of(context)
                            //                 .textTheme
                            //                 .bodySmall!
                            //                 .copyWith(
                            //                   fontWeight: FontWeight.w500,
                            //                 ),
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
      },
      loading: () => screen_shimmer(120, 800),
      error: (error, stackTrace) => Text('${HandText.errorMessage} $error'),
    );
  }
}
