// ignore_for_file: file_names

import 'package:flutter_riverpod/flutter_riverpod.dart';

final dropdownItemsProvider = Provider<List<String>>((ref) => [
      'Purchase Product',
      'Purchase Vendor',
      'PO Wise',
      'Functional Wise',
      'Product Receiveable',
      'Customer Wise',
      'Vertical Wise',
      'Kam Wise',
      'Region Wise',
      'Receivable Customer',
    ]);

class SelectedItemNotifier extends StateNotifier<String?> {
  SelectedItemNotifier() : super(null);

  void updateSelectedItem(String? item) {
    state = item;
  }
}

final selectedItemProvider =
    StateNotifierProvider<SelectedItemNotifier, String?>(
  (ref) => SelectedItemNotifier(),
);
