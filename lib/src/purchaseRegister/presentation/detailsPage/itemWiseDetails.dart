import 'package:flutter/material.dart';
import 'package:vitwoai_report/src/purchaseRegister/model/ItemWiseModel.dart';

class ItemWiseDetails extends StatelessWidget {
  final List<ItemContentList> data;
  final int index;
  const ItemWiseDetails({
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
                "Item Wise",
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
                    _buildSectionHeaderTitle(data[index].itemName),
                    Column(
                      children: [
                        _buildDetailRow(Icons.person, "Item Code:",
                            _getValue(data[index].itemCode)),
                        _buildDetailRow(Icons.code, "Item Group Name:",
                            _getValue(data[index].ItemGroupName)),
                        _buildDetailRow(Icons.store, "Base UOM:",
                            _getValue(data[index].BaseUoM)),
                        _buildDetailRow(Icons.store, "Alternate UoM:",
                            _getValue(data[index].AlternateUoM)),
                        _buildDetailRow(Icons.store, "HSN Code:",
                            _getValue(data[index].HSNCode)),
                        _buildDetailRow(Icons.store, "Invoice Quantity:",
                            _getValue(data[index].invoiceQuantity)),
                        _buildDetailRow(Icons.store, "Received Quantity:",
                            _getValue(data[index].receivedQuantity)),
                        _buildDetailRow(Icons.store, "PO Value (Net):",
                            _getValue(data[index].poValueNet)),
                        _buildDetailRow(Icons.store, "PO Value (Gross):",
                            _getValue(data[index].poValueGross)),
                      ],
                    ),
                    const Divider(thickness: 1, color: Colors.grey),
                    _buildSectionHeader("Tax Information"),
                    Column(
                      children: [
                        _buildDetailRow(Icons.calendar_today, "Base Value:",
                            _getValue(data[index].baseValue)),
                        _buildDetailRow(
                            Icons.money, "IGST:", _getValue(data[index].igst)),
                        _buildDetailRow(
                            Icons.money, "SGST:", _getValue(data[index].sgst)),
                        _buildDetailRow(
                            Icons.money, "CGST:", _getValue(data[index].cgst)),
                        _buildDetailRow(Icons.money_off, "Total TDS:",
                            _getValue(data[index].tds)),
                        _buildDetailRow(Icons.money, "Invoice Value:",
                            _getValue(data[index].invoiceValue)),
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

  Widget _buildSectionHeaderTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
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
