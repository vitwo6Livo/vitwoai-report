import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitwoai_report/src/purchaseRegister/data/purchesRegister_repository.dart';

class VendorList extends ConsumerWidget {
  const VendorList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final purchaseRegisterPoWiseList = ref.watch(purchesRegisterPoWiseProvider);
    return purchaseRegisterPoWiseList.when(
      data: (data) {
        return data['content'].length == 0
            ? const Center(
                child: Text("No Data Found"),
              )
            : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data['content'].length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
                              const Icon(
                                Icons.person_2_outlined,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  data['content'][index]['Vendor Name'],
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
                                    const Icon(
                                      Icons.sticky_note_2,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text.rich(
                                        TextSpan(
                                          text: 'Vendor Code: ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                color: Colors.grey,
                                              ),
                                          children: [
                                            TextSpan(
                                              text: data['content'][index]
                                                  ['Vendor Code'],
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
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.event,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text.rich(
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
                                              text: data['content'][index]
                                                      ['Invoice Quantity'] ??
                                                  '0.0',
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
                                    const Icon(
                                      Icons.manage_accounts,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text.rich(
                                        TextSpan(
                                          text: 'Received Quantity: ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                color: Colors.grey,
                                              ),
                                          children: [
                                            TextSpan(
                                              text: data['content'][index]
                                                      ['Received Quantity'] ??
                                                  '0.0',
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
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.currency_rupee_outlined,
                                      color: Colors.grey,
                                    ),
                                    // const SizedBox(width: 8),
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
                                            text: data['content'][index]
                                                    ['Invoice Value'] ??
                                                '0.0',
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
                  );
                });
      },
      error: (error, stack) => Center(child: Text('Error: $error')),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
