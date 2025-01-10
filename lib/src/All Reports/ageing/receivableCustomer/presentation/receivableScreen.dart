// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitwoai_report/src/settings/colors.dart';
import 'package:vitwoai_report/src/settings/texts.dart';
import '../../../../../golobal-Widget/customPage-Route.dart';
import 'receivableDetails.dart';

class ReceivableScreen extends ConsumerWidget {
  const ReceivableScreen({super.key});

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          HandText.receivaleTitle,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColor.appbarFont,
              ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: _filterSection(context),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return InkWell(
                  splashColor: AppColor.splashColor,
                  onTap: () {
                    Navigator.of(context).push(
                      CustomPageRoute(
                        child: ReceivableDetails(),
                        direction: AxisDirection.up,
                      ),
                    );
                  },
                  child: Card(
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
                          Row(
                            children: [
                              const Icon(
                                Icons.person,
                                color: Colors.blueAccent,
                              ),
                              Expanded(
                                child: Text(
                                  '6 LIVO TECHNOLOGIES PRIVATE LIMITED ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: Colors.grey,
                                      ),
                                  children: [
                                    TextSpan(
                                      text: '15578826.13',
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
                            children: [
                              const Icon(
                                Icons.account_balance_wallet,
                                color: Colors.grey,
                              ),
                              Text.rich(
                                TextSpan(
                                  text: 'Total Due: ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: Colors.grey,
                                      ),
                                  children: [
                                    TextSpan(
                                      text: '15721739.13',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: const Color.fromARGB(
                                                255, 73, 142, 109),
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: Colors.grey,
                                      ),
                                  children: [
                                    TextSpan(
                                      text: '-142913',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: const Color.fromARGB(
                                                255, 146, 50, 50),
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
              },
            ),
          ),
        ],
      ),
    );
  }

  Row _filterSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          splashColor: AppColor.splashColor,
          onTap: () {},
          child: Row(
            children: [
              Text(
                '2025-01-09',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.grey,
                    ),
              ),
              const SizedBox(width: 2),
              const Icon(
                Icons.settings,
                color: Colors.grey,
              ),
            ],
          ),
        ),
        InkWell(
          splashColor: AppColor.splashColor,
          onTap: () {
            _showInputRangePopup(context);
          },
          child: Row(
            children: [
              Text(
                'Action',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.grey,
                    ),
              ),
              const Icon(Icons.filter_list_rounded),
            ],
          ),
        ),
      ],
    );
  }

  void _showInputRangePopup(BuildContext context) {
    final TextEditingController daysController =
        TextEditingController(text: '20');
    final TextEditingController bucketsController =
        TextEditingController(text: '5');
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Input Range'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Interval Input Field
              SizedBox(
                height: 40,
                child: TextFormField(
                  controller: daysController,
                  style: Theme.of(context).textTheme.bodyMedium,
                  cursorHeight: 10,
                  decoration: InputDecoration(
                    labelText: 'Interval in days',
                    labelStyle: Theme.of(context).textTheme.bodySmall,
                    border: const OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(height: 16),
              // Number of Buckets Input Field
              SizedBox(
                height: 40,
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  controller: bucketsController,
                  cursorHeight: 10,
                  decoration: InputDecoration(
                    labelText: 'Number of Buckets',
                    labelStyle: Theme.of(context).textTheme.bodySmall,
                    border: const OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the popup
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Add Save logic here
                Navigator.of(context).pop(); // Close the popup
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
