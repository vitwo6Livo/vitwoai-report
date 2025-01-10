// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../settings/colors.dart';
import '../domain/vendorItemModel.dart';

class PoVendorWidget extends ConsumerWidget {
  PoVendorWidget({super.key});

  final List<VendorData> vendorData = [
    VendorData(
      vendorName: "Adani Ports And Special Economic Zone",
      vendorCode: "62300007",
      totalSgst: 2059.5,
      totalIgst: 259241873.15,
      totalAmount: 1758442192.34,
      totalCgst: 2059.5,
    ),
    VendorData(
      vendorName: "FAB TECH",
      vendorCode: "62300001",
      totalSgst: 0,
      totalIgst: 18605595.13,
      totalAmount: 124622891.27,
      totalCgst: 0,
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: ListView.builder(
        itemCount: vendorData.length,
        itemBuilder: (context, index) {
          final item = vendorData[index];
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
                        const Icon(Icons.business, color: Colors.blueAccent),
                        Expanded(
                          child: Text(
                            item.vendorName,
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
                        _buildRow(context, Icons.subtitles, item.vendorCode),
                        _buildRow(
                            context, Icons.monetization_on, item.totalAmount),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildRow(context, Icons.attach_money, item.totalIgst),
                        _buildRow(context, Icons.attach_money, item.totalSgst),
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
