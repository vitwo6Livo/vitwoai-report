import 'package:flutter/material.dart';
import 'package:vitwoai_report/src/settings/colors.dart';
import 'package:vitwoai_report/src/settings/texts.dart';

class newAllPRDetailsScreen extends StatelessWidget {
  final List<dynamic> data;
  final int index;

  const newAllPRDetailsScreen({
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
          HandText.prAllDetailsTitle,
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
            _buildSectionHeader(HandText.prAllVendor),
            _buildCard([
              _buildDetailRow(
                  Icons.person, "Vendor Document No:", item.vendorDocumentNo),
              _buildDoubleColumn([
                _buildDetailColumn(
                    Icons.store, "Vendor Name", item.grn_vendors_tradename),
                _buildDetailColumn(
                    Icons.code, "Vendor Code", item.grnVendors_Vendor_code),
              ]),
              _buildDetailRow(
                  Icons.calendar_today, "Posting Date:", item.postingDate),
              _buildDetailRow(
                  Icons.date_range, "Document Date:", item.vendorDocumentDate),
              _buildDetailRow(Icons.qr_code, "GRN IV Code:", item.grnIvCode),
            ]),
            const SizedBox(height: 16),
            _buildSectionHeader(HandText.prAllPO),
            _buildCard([
              _buildDoubleColumn([
                _buildDetailColumn(
                    Icons.date_range, "GRN PO Date", item.grnPO_PODate),
                _buildDetailColumn(
                    Icons.receipt, "GRN PO Number", item.grnPo_Po_number),
              ]),
              _buildDoubleColumn([
                _buildDetailColumn(
                    Icons.inventory_2, "GRN PO Item QTY", item.grnPoItemsQty),
                _buildDetailColumn(Icons.attach_money, "GRN PO Total Amount",
                    item.grnPO_totalAmount),
              ]),
              _buildDetailRow(
                  Icons.money, "GRN PO Sub Total:", item.grnPoSubtotal),
              _buildDetailRow(
                  Icons.attach_money, "GRN SUB Total:", item.grnSubTotal),
            ]),
            const SizedBox(height: 16),
            _buildSectionHeader(HandText.prAllUOM_ItemInfo),
            _buildCard([
              _buildDoubleColumn([
                _buildDetailColumn(Icons.straighten, "Alternate UOM",
                    item.grnInvoiceItemsAlternateUomName),
                _buildDetailColumn(
                    Icons.scale, "Base UOM", item.grnInvoiceItemsBaseUomName),
              ]),
              const Divider(),
              _buildDetailRow(Icons.shopping_bag, "Item Name:",
                  item.grnInvoiceItems_ItemName),
              _buildDetailRow(Icons.category, "Item Group:",
                  item.grnInvoiceItems_GoodsGroup_GoodGroupName),
              _buildDetailRow(
                  Icons.numbers, "HSN Code:", item.grnInvoiceItems_GoodHSN),
              _buildDoubleColumn([
                _buildDetailColumn(Icons.inventory, "Good Quantity",
                    item.grnInvoiceItems_goodQty),
                _buildDetailColumn(Icons.check_circle, "Received Quantity",
                    item.grnInvoiceItemsReceivedQty),
              ]),
              _buildDetailRow(Icons.qr_code_scanner, "Good Code:",
                  item.grnInvoiceItems_GoodCode),
            ]),
            const SizedBox(height: 16),
            _buildSectionHeader(HandText.prAllTaxSummary),
            _buildCard([
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildDetailColumn(Icons.percent, "SGST", item.grnTotalSgst),
                  _buildDetailColumn(Icons.percent, "CGST", item.grnTotalCgst),
                  _buildDetailColumn(Icons.percent, "IGST", item.grnTotalIgst),
                  _buildDetailColumn(
                      Icons.money_off, "Total TDS", item.grnTotalTds),
                ],
              ),
              const Divider(),
              _buildDetailRow(
                  Icons.attach_money, "Total Amount:", item.grnTotalAmount),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(List<Widget> children) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: children),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 6),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
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
          Icon(icon, color: Colors.blueGrey),
          const SizedBox(width: 10),
          Expanded(
            child: RichText(
              text: TextSpan(
                text: "$label ",
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
                children: [
                  TextSpan(
                    text: _getValue(value),
                    style: const TextStyle(
                        fontWeight: FontWeight.normal, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailColumn(IconData icon, String label, dynamic value) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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

  Widget _buildDoubleColumn(List<Widget> children) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }

  String _getValue(dynamic value) {
    return value != null ? value.toString() : "N/A";
  }
}
