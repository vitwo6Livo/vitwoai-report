import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitwoai_report/golobal-Widget/shimmer_screen.dart';
import 'package:vitwoai_report/src/purchaseRegister/data/purchesRegister_repository.dart';

class Itemwise extends ConsumerWidget {
  const Itemwise({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final purchesRegisterItemWiseData =
        ref.watch(purchesRegisterItemWiseProvider);
    return purchesRegisterItemWiseData.when(
      data: (data) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: data.content.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 1.8),
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
                            const Icon(
                              Icons.factory,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 150,
                              child: Text(
                                data.content[index].itemName,
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
                        // Row(
                        //   children: [
                        //     const Icon(
                        //       Icons.graphic_eq_outlined,
                        //       color: Colors.grey,
                        //     ),
                        //     Text.rich(
                        //       TextSpan(
                        //         text: 'TDS: ',
                        //         style: Theme.of(context)
                        //             .textTheme
                        //             .bodySmall!
                        //             .copyWith(
                        //               color: Colors.grey,
                        //             ),
                        //         children: [
                        //           TextSpan(
                        //             text: '32',
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
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.eject_outlined,
                              color: Colors.grey,
                            ),
                            Text.rich(
                              TextSpan(
                                text: 'Item Code: \n',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: Colors.grey,
                                    ),
                                children: [
                                  TextSpan(
                                    text: data.content[index].itemCode,
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
                            const Icon(
                              Icons.eject_outlined,
                              color: Colors.grey,
                            ),
                            Text.rich(
                              TextSpan(
                                text: 'Invoice Value: \n',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: Colors.grey,
                                    ),
                                children: [
                                  TextSpan(
                                    text: data.content[index].invoiceValue,
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
                            const Icon(
                              Icons.eject_outlined,
                              color: Colors.grey,
                            ),
                            Text.rich(
                              TextSpan(
                                text: 'Invoice Quantity: \n',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: Colors.grey,
                                    ),
                                children: [
                                  TextSpan(
                                    text: data.content[index].invoiceQuantity,
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
                            const Icon(
                              Icons.currency_rupee_outlined,
                              color: Colors.grey,
                            ),
                            Text.rich(
                              TextSpan(
                                text: 'Received Quantity: \n',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: Colors.grey,
                                    ),
                                children: [
                                  TextSpan(
                                    text: data.content[index].receivedQuantity,
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
                  ],
                ),
              ),
            );
          },
        );
      },
      error: (error, stack) => Center(child: Text('Error: $error')),
      loading: () => screen_shimmer(120, 800),
    );
  }
}
