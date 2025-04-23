import 'package:flutter/material.dart';
import 'package:vitwoai_report/src/purchaseRegister/model/purchaseModel.dart';

class AllPRDetailsScreen extends StatelessWidget {
  final List<PurchaseContentList> data;
  final int index;

  const AllPRDetailsScreen({
    super.key,
    required this.data,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                "ALL",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade900, Colors.blue.shade600],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.receipt_long, size: 64, color: Colors.white),
                      SizedBox(height: 8),
                      Text(
                        "Purchase Register Details",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, color: Colors.white)),
            // actions: [
            //   IconButton(
            //     onPressed: () {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         const SnackBar(
            //             content: Text("Share functionality coming soon!")),
            //       );
            //     },
            //     icon: const Icon(Icons.share, color: Colors.white),
            //   ),
            // ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionHeader("Vendor Information"),
                    Column(
                      children: [
                        _buildDetailRow(Icons.person, "Vendor NO:",
                            _getValue(data[index].vendorDocumentNo)),
                        _buildDetailRow(Icons.code, "Vendor Code:",
                            _getValue(data[index].grnVendors_Vendor_code)),
                        _buildDetailRow(Icons.store, "Vendor Name:",
                            _getValue(data[index].grn_vendors_tradename)),
                      ],
                    ),
                    const Divider(thickness: 1, color: Colors.grey),
                    _buildSectionHeader("Dates & Totals"),
                    Column(
                      children: [
                        _buildDetailRow(Icons.calendar_today, "Posting Date:",
                            _getValue(data[index].postingDate)),
                        _buildDetailRow(Icons.date_range, "Document Date:",
                            _getValue(data[index].vendorDocumentDate)),
                        _buildDetailRow(Icons.attach_money, "GRN Sub Total:",
                            _getValue(data[index].grnSubTotal)),
                        _buildDetailRow(Icons.money, "SGST:",
                            _getValue(data[index].grnTotalSgst)),
                        _buildDetailRow(Icons.money, "IGST:",
                            _getValue(data[index].grnTotalIgst)),
                        _buildDetailRow(Icons.money, "CGST:",
                            _getValue(data[index].grnTotalCgst)),
                        _buildDetailRow(Icons.money_off, "Total TDS:",
                            _getValue(data[index].grnTotalTds)),
                        _buildDetailRow(Icons.money, "Total Amount:",
                            _getValue(data[index].grnTotalAmount)),
                      ],
                    ),
                    const Divider(thickness: 1, color: Colors.grey),
                    _buildSectionHeader("Item Details"),
                    Column(
                      children: [
                        _buildDetailRow(Icons.shopping_bag, "Item Name:",
                            _getValue(data[index].grnInvoiceItems_ItemName)),
                        _buildDetailRow(Icons.inventory, "Good Quantity:",
                            _getValue(data[index].grnInvoiceItems_goodQty)),
                        _buildDetailRow(
                            Icons.check_circle,
                            "Received Quantity:",
                            _getValue(data[index].grnInvoiceItemsReceivedQty)),
                        _buildDetailRow(Icons.qr_code, "Good Code:",
                            _getValue(data[index].grnInvoiceItems_GoodCode)),
                        _buildDetailRow(Icons.numbers, "HSN No:",
                            _getValue(data[index].grnInvoiceItems_GoodHSN)),
                        _buildDetailRow(
                            Icons.category,
                            "Item Group Name:",
                            _getValue(data[index]
                                .grnInvoiceItems_GoodsGroup_GoodGroupName)),
                      ],
                    ),
                    const Divider(thickness: 1, color: Colors.grey),
                    _buildSectionHeader("Unit of Measurement"),
                    Column(
                      children: [
                        _buildDetailRow(
                            Icons.format_list_numbered,
                            "Alternate UOM:",
                            _getValue(
                                data[index].grnInvoiceItemsAlternateUomName)),
                        _buildDetailRow(Icons.format_list_numbered, "Base UOM:",
                            _getValue(data[index].grnInvoiceItemsBaseUomName)),
                      ],
                    ),
                    const Divider(thickness: 1, color: Colors.grey),
                    _buildSectionHeader("Additional Details"),
                    Column(
                      children: [
                        _buildDetailRow(Icons.code, "GRN Iv Code:",
                            _getValue(data[index].grnIvCode)),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  String _getValue(dynamic value) {
    return value != null ? value.toString() : "N/A";
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueGrey),
      ),
    );
  }

  // Card Widget with Hover Effect
  // Widget _buildCard(Widget child) {
  //   return Card(
  //     elevation: 4,
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  //     margin: const EdgeInsets.symmetric(vertical: 8),
  //     child: Padding(
  //       padding: const EdgeInsets.all(16),
  //       child: child,
  //     ),
  //   );
  // }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.blue, size: 20),
          const SizedBox(width: 12),
          Expanded(
            flex: 3,
            child: Text(
              "$label ",
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              value,
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
