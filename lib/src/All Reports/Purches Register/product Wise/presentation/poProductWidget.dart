// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../settings/colors.dart';
import '../domain/listModel.dart';

class PoProductWidget extends ConsumerWidget {
  PoProductWidget({super.key});

  final List<ItemData> items = [
    ItemData(
      itemName: 'Carvaan Mobile Don Lite M23 Kannada',
      itemQuantity: 470.21,
      grnCreatedAt: '2023-10-15',
      totalAmount: 6761900.21,
      itemCode: '22000002',
    ),
    ItemData(
      itemName: 'County Bluetooth Speaker',
      itemQuantity: 192,
      grnCreatedAt: '2023-10-15',
      totalAmount: 94459,
      itemCode: '22000002',
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return InkWell(
            splashColor: AppColor.splashColor,
            onTap: () {},
            child: Card(
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
                        const Icon(Icons.inventory, color: Colors.blueAccent),
                        Expanded(
                          child: Text(
                            item.itemName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildRow(context, Icons.subtitles, item.itemCode),
                        _buildRow(
                            context, Icons.shopping_cart, item.itemQuantity),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildRow(
                            context, Icons.calendar_today, item.grnCreatedAt),
                        _buildRow(
                            context, Icons.monetization_on, item.totalAmount),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRow(BuildContext context, IconData icon, dynamic value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey),
          const SizedBox(width: 8),
          Text(
            "$value",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
