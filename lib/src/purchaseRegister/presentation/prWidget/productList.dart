import 'package:flutter/material.dart';
import 'package:vitwoai_report/golobal-Widget/shimmer_screen.dart';
import 'package:vitwoai_report/src/purchaseRegister/data/purchesRegister_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitwoai_report/src/purchaseRegister/presentation/detailsPage/PrAllDetails.dart';
import 'package:vitwoai_report/src/settings/colors.dart';
import 'package:vitwoai_report/src/settings/texts.dart';

class ProductList extends ConsumerWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final purchesRegisterList = ref.watch(purchesRegisterProvider);

    return purchesRegisterList.when(
      data: (data) {
        return data.content.isEmpty
            ? Center(
                child: Text(HandText.noData),
              )
            : ListView.builder(
                itemCount: data.content.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllPRDetailsScreen(
                            data: data.content,
                            index: index,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      color: AppColor.cardBackgroundColor,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
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
                                        data.content[index]
                                            .grn_vendors_tradename
                                            .toString(),
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
                                Row(
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        text: HandText.prQty,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              color: AppColor.cardDataKeyColor,
                                            ),
                                        children: [
                                          TextSpan(
                                            text: data.content[index]
                                                .grnInvoiceItems_goodQty
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
                                                    .grnInvoiceItems_ItemName,
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
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              color: AppColor.cardDataKeyColor,
                                            ),
                                        children: [
                                          TextSpan(
                                            text: data.content[index]
                                                .grnInvoiceItems_GoodCode,
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
                                      Icons.person,
                                      color: AppColor.cardDataIconColor,
                                    ),
                                    Text(
                                      data.content[index].grnVendors_Vendor_code
                                          .toString(),
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
                                      data.content[index].grnTotalAmount
                                          .toString(),
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
      },
      error: (error, stack) =>
          Center(child: Text('${HandText.errorMessage} $error')),
      loading: () => screen_shimmer(120, 800),
    );
  }
}
