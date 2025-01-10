// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitwoai_report/src/settings/colors.dart';
import '../data/itemList.dart';
import 'poProductWidget.dart';

class PurchaseProduct_SCreen extends ConsumerWidget {
  const PurchaseProduct_SCreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(dropdownItemsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          items[0],
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColor.appbarFont,
              ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 10,
                  blurStyle: BlurStyle.outer,
                  color: Colors.grey,
                  offset: Offset(4, 2),
                  spreadRadius: 2.0,
                ),
              ],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white.withOpacity(0.6)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    cursorColor: AppColor.cursorColor,
                    decoration: InputDecoration(
                      hintText: 'SEARCH',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                IconButton(
                  splashColor: AppColor.splashColor,
                  onPressed: () {},
                  icon: const Icon(Icons.search, color: Colors.brown),
                ),
              ],
            ),
          ),
          _getScreenForSelectedItem(),
        ],
      ),
    );
  }

  Widget _getScreenForSelectedItem() {
    return PoProductWidget();
  }
}
