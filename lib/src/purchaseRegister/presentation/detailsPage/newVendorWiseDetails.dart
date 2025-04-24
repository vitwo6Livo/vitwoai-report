import 'package:flutter/material.dart';
import 'package:vitwoai_report/src/settings/colors.dart';
import 'package:vitwoai_report/src/settings/texts.dart';

class newVendorWiseDetails extends StatelessWidget {
  final List<dynamic> data;
  final int index;

  const newVendorWiseDetails({
    super.key,
    required this.data,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final item = data[index];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: AppColor.lightFontCpy),
        ),
        title: Text(
          HandText.prVendorDetailsTitle,
          style: TextStyle(color: AppColor.appbarFont),
        ),
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
            _buildSectionHeader(HandText.prVendorInfoDetails),
            _buildCard([
              _buildDetailRow(Icons.person, "Vendor Name", item.vendorName),
              _buildDetailRow(Icons.code, "Vendor Code", item.vendorCode),
            ]),
            const SizedBox(height: 16),
            _buildSectionHeader(HandText.prVendorOrderQty),
            _buildCard([
              _buildDetailRow(Icons.shopping_cart, "Received Quantity",
                  item.receivedQuantity),
              _buildDetailRow(
                  Icons.category, "Invoice Quantity", item.invoiceQuantity),
              _buildDetailRow(Icons.list_alt, "PO Quantity", item.poQuantity),
              _buildDetailRow(
                  Icons.monetization_on, "PO Value (Net)", item.poValueNet),
              _buildDetailRow(
                  Icons.attach_money, "PO Value (Gross)", item.poValueGross),
            ]),
            const SizedBox(height: 16),
            _buildSectionHeader(HandText.prVendorTaxAmt),
            _buildCard([
              _buildDoubleColumn([
                _buildDetailColumn(Icons.percent, "Base Value", item.baseValue),
                _buildDetailColumn(Icons.percent, "SGST", item.sgst),
              ]),
              _buildDoubleColumn([
                _buildDetailColumn(Icons.percent, "CGST", item.cgst),
                _buildDetailColumn(Icons.percent, "IGST", item.igst),
              ]),
              _buildDetailRow(Icons.money_off, "TDS", item.tds),
              _buildDetailRow(
                  Icons.receipt_long, "Invoice Value", item.invoiceValue),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(List<Widget> children) {
    return Card(
      color: AppColor.cardBackgroundColor,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(children: children),
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
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
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
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 18, color: Colors.blueGrey),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
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

  Widget _buildDoubleColumn(List<Widget> children) {
    return Row(children: children);
  }

  String _getValue(dynamic value) {
    return value != null ? value.toString() : "N/A";
  }
}
