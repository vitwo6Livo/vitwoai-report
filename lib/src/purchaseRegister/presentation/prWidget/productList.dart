import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var index = 0; index < 5; index++)
          Card(
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
                            Icons.info_outline,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 150,
                            child: Text(
                              'Equipment required',
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
                          const Icon(
                            Icons.shopping_cart_checkout_outlined,
                            color: Colors.grey,
                          ),
                          Text.rich(
                            TextSpan(
                              text: 'Qty: ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: Colors.grey,
                                  ),
                              children: [
                                TextSpan(
                                  text: '3.0',
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
                            Icons.calendar_month_outlined,
                            color: Colors.grey,
                          ),
                          Text.rich(
                            TextSpan(
                              text: 'Due: ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: Colors.grey,
                                  ),
                              children: [
                                TextSpan(
                                  text: '04-Nov-2023',
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
                            Icons.shopping_cart_checkout_outlined,
                            color: Colors.grey,
                          ),
                          Text.rich(
                            TextSpan(
                              text: 'Received Qty: ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: Colors.grey,
                                  ),
                              children: [
                                TextSpan(
                                  text: '3.0',
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
                            Icons.file_copy_outlined,
                            color: Colors.grey,
                          ),
                          Text(
                            'GRN1697528518106',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
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
                            '14160.00',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
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
      ],
    );
  }
}
