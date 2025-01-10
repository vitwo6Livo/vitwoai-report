import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitwoai_report/src/settings/colors.dart';

class ReceivableDetails extends ConsumerWidget {
  ReceivableDetails({super.key});
  final List<Map<String, dynamic>> data = [
    {
      'day': '0-20 Due',
      'total_due': '1694875.5',
      'account_due': '-4146.6',
      'net_due': '16,90,728.9',
    },
    {
      'day': '21-40 Due',
      'total_due': '8153',
      'account_due': '-51280',
      'net_due': '-43,127',
    },
    {
      'day': '41-60 Due',
      'total_due': '203732.9',
      'account_due': '-1160.42',
      'net_due': '2,02,572.48',
    },
    {
      'day': '61-80 Due',
      'total_due': '0',
      'account_due': '0',
      'net_due': '0',
    },
    {
      'day': '>80 Due',
      'total_due': '13814977.73',
      'account_due': '-86325.98',
      'net_due': '1,37,28,651.75',
    },
  ];

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Total due vs On account due',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColor.appbarFont,
              ),
        ),
      ),
      body: Column(
        children: [
          _cardView(context),
          const SizedBox(height: 4),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            item['total_due'],
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w500,
                                  color:
                                      const Color.fromARGB(255, 73, 142, 109),
                                ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item['day'],
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Text(
                              item['account_due'],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w500,
                                    color:
                                        const Color.fromARGB(255, 146, 50, 50),
                                  ),
                            ),
                          ],
                        ),
                        const Divider(),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            item['net_due'],
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Card _cardView(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                  Icons.person,
                  color: Colors.blueAccent,
                ),
                Expanded(
                  child: Text(
                    '6 LIVO TECHNOLOGIES PRIVATE LIMITED ',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                    overflow: TextOverflow.visible,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(
                  Icons.currency_rupee,
                  color: Colors.grey,
                ),
                Text.rich(
                  TextSpan(
                    text: 'Net Due: ',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.grey,
                        ),
                    children: [
                      TextSpan(
                        text: '15578826.13',
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
              children: [
                const Icon(
                  Icons.account_balance_wallet,
                  color: Colors.grey,
                ),
                Text.rich(
                  TextSpan(
                    text: 'Total Due: ',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.grey,
                        ),
                    children: [
                      TextSpan(
                        text: '15721739.13',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: const Color.fromARGB(255, 73, 142, 109),
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(
                  Icons.admin_panel_settings,
                  color: Colors.grey,
                ),
                Text.rich(
                  TextSpan(
                    text: 'Account Due: ',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.grey,
                        ),
                    children: [
                      TextSpan(
                        text: '-142913',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: const Color.fromARGB(255, 146, 50, 50),
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
  }
}
