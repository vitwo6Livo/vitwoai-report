import 'package:flutter/material.dart';

class ItemGroupWiseDetails extends StatelessWidget {
  final List<dynamic> data;
  final int index;
  const ItemGroupWiseDetails({
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
                "Item Group Wise",
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
                    _buildSectionHeaderTitle(data[index]["Item Group Name"]),
                    Column(
                      children: [
                        _buildDetailRow(Icons.person, "Invoice Quantity:",
                            _getValue(data[index]["Invoice Quantity"])),
                        _buildDetailRow(Icons.code, "Received Quantity:",
                            _getValue(data[index]["Received Quantity"])),
                        _buildDetailRow(Icons.store, "PO Quantity:",
                            _getValue(data[index]["PO Quantity"])),
                        _buildDetailRow(Icons.store, "PO Value (Net):",
                            _getValue(data[index]["PO Value (Net)"])),
                        _buildDetailRow(Icons.store, "PO Value (Gross):",
                            _getValue(data[index]["PO Value (Gross)"])),
                      ],
                    ),
                    const Divider(thickness: 1, color: Colors.grey),
                    _buildSectionHeader("Tax Information"),
                    Column(
                      children: [
                        _buildDetailRow(Icons.calendar_today, "Base Value:",
                            _getValue(data[index]["Base Value"])),
                        _buildDetailRow(Icons.money, "IGST:",
                            _getValue(data[index]["IGST"])),
                        _buildDetailRow(Icons.money, "SGST:",
                            _getValue(data[index]["SGST"])),
                        _buildDetailRow(Icons.money, "CGST:",
                            _getValue(data[index]["CGST"])),
                        _buildDetailRow(Icons.money_off, "Total TDS:",
                            _getValue(data[index]["TDS"])),
                        _buildDetailRow(Icons.money, "Invoice Value:",
                            _getValue(data[index]["Invoice Value"])),
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
