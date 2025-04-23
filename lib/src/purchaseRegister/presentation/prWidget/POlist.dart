import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitwoai_report/golobal-Widget/shimmer_screen.dart';
import 'package:vitwoai_report/src/purchaseRegister/data/purchesRegister_repository.dart';
import 'package:vitwoai_report/src/purchaseRegister/presentation/detailsPage/newVendorWiseDetails.dart';
import 'package:vitwoai_report/src/purchaseRegister/presentation/detailsPage/vendorWiseDetails.dart';
import 'package:vitwoai_report/src/settings/colors.dart';
import 'package:vitwoai_report/src/settings/texts.dart';

class PurchaseOrderList extends ConsumerWidget {
  const PurchaseOrderList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final purchaseRegisterVendorWiseList =
        ref.watch(purchesRegisterVendorWiseProvider);
    return purchaseRegisterVendorWiseList.when(
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
                              builder: (context) => newVendorWiseDetails(
                                  data: data.content, index: index)));
                    },
                    child: Card(
                      color: AppColor.cardBackgroundColor,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
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
                              children: [
                                Icon(
                                  Icons.person_2_outlined,
                                  color: AppColor.cardDataIconColor,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    data.content[index].vendorName,
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
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.sticky_note_2,
                                        color: AppColor.cardDataIconColor,
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text.rich(
                                          TextSpan(
                                            text: HandText.prVendorCode,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                  color:
                                                      AppColor.cardDataKeyColor,
                                                ),
                                            children: [
                                              TextSpan(
                                                text: data
                                                    .content[index].vendorCode,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
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
                                      Icon(
                                        Icons.event,
                                        color: AppColor.cardDataIconColor,
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text.rich(
                                          TextSpan(
                                            text:
                                                '${HandText.prInvoiceQuantity}\n',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                  color:
                                                      AppColor.cardDataKeyColor,
                                                ),
                                            children: [
                                              TextSpan(
                                                text: data.content[index]
                                                    .invoiceQuantity
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
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
                                      Icon(
                                        Icons.manage_accounts,
                                        color: AppColor.cardDataIconColor,
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text.rich(
                                          TextSpan(
                                            text: HandText.prReceivedQuantity,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                  color:
                                                      AppColor.cardDataKeyColor,
                                                ),
                                            children: [
                                              TextSpan(
                                                text: data.content[index]
                                                    .receivedQuantity
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
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
                                      Icon(
                                        Icons.currency_rupee_outlined,
                                        color: AppColor.cardDataIconColor,
                                      ),
                                      // const SizedBox(width: 8),
                                      Text.rich(
                                        TextSpan(
                                          text: '${HandText.prInvoiceValue}\n',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                color:
                                                    AppColor.cardDataKeyColor,
                                              ),
                                          children: [
                                            TextSpan(
                                              text: data
                                                  .content[index].invoiceValue
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
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
      },
      error: (error, stack) =>
          Center(child: Text('${HandText.errorMessage} $error')),
      loading: () => screen_shimmer(120, 800),
    );
  }
}
