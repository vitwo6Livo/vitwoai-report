import 'package:flutter/material.dart';
import 'package:vitwoai_report/src/settings/colors.dart';

class newItemGroupWiseDetailsScreen extends StatelessWidget {
  final List<dynamic> data;
  final int index;

  const newItemGroupWiseDetailsScreen(
      {super.key, required this.data, required this.index});

  @override
  Widget build(BuildContext context) {
    final item = data[index];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Item Group Details",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColor.appBarColor1, AppColor.appBarColor2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader("Item Group Info"),
            _buildCard([
              _buildDetailRow(
                  Icons.category, "Item Group Name", item.ItemGroupName),
            ]),
            const SizedBox(height: 16),
            _buildSectionHeader("Quantity & Value"),
            _buildCard([
              _buildDetailRow(
                  Icons.playlist_add_check, "PO Quantity", item.poQuantity),
              _buildDetailRow(Icons.shopping_cart, "Invoice Quantity",
                  item.invoiceQuantity),
              _buildDetailRow(
                  Icons.inventory, "Received Quantity", item.receivedQuantity),
              _buildDetailRow(
                  Icons.monetization_on, "PO Value (Net)", item.poValueNet),
              _buildDetailRow(
                  Icons.attach_money, "PO Value (Gross)", item.poValueGross),
              _buildDetailRow(
                  Icons.price_check, "Invoice Value", item.invoiceValue),
            ]),
            const SizedBox(height: 16),
            _buildSectionHeader("Tax Summary"),
            _buildCard([
              Row(
                children: [
                  _buildDetailColumn(
                      Icons.percent, "Base Value", item.baseValue),
                  _buildDetailColumn(Icons.percent, "IGST", item.igst),
                  _buildDetailColumn(Icons.percent, "SGST", item.sgst),
                  _buildDetailColumn(Icons.percent, "CGST", item.cgst),
                  _buildDetailColumn(Icons.percent, "TDS", item.tds),
                ],
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.blueGrey,
        ),
      ),
    );
  }

  Widget _buildCard(List<Widget> children) {
    return Card(
      color: AppColor.cardBackgroundColor,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(children: children),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, dynamic value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Colors.blueGrey),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
                Text(
                  _getValue(value),
                  style: const TextStyle(fontSize: 15, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailColumn(IconData icon, String label, dynamic value) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 18, color: Colors.blueGrey),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            Text(
              _getValue(value),
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }

  String _getValue(dynamic value) {
    return value != null ? value.toString() : "N/A";
  }
}
