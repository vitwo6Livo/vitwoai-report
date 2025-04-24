import 'package:flutter/material.dart';
import 'package:vitwoai_report/src/sales_Register/model/salesCustomerWiseModel.dart';
import 'package:vitwoai_report/src/settings/colors.dart';

class CustomerWiseDetailsPage extends StatelessWidget {
  List<SalesCustomerContentList> data;
  int index;
  CustomerWiseDetailsPage({super.key, required this.data, required this.index});

  @override
  Widget build(BuildContext context) {
    final item = data[index];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColor.lightFontCpy,
          ),
        ),
        title: Text(
          "Customer Wise Details",
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSection("Customer Info", [
              _buildTile("Customer Name", item.customerName),
              _buildTile("Customer Code", item.customerCode),
              _buildTile("Customer GSTIN", item.customerGSTNO),
            ]),
            _buildSection("Item Details", [
              _buildTile("SO Quantity", item.soQuantity),
              _buildTile("Invoice Quantity", item.invoiceQuantity),
              _buildTile("SO Value Net", item.soValueNet),
              _buildTile("SO Value Gross", item.soValueGross),
            ]),
            _buildSection("Tax & Amounts", [
              _buildTile("Base Value", item.baseValue),
              _buildTile("IGST", item.igst),
              _buildTile("CGST", item.cgst),
              _buildTile("SGST", item.sgst),
              const Divider(),
              _buildTile("Invoice Value", item.invoiceValue),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> tiles) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...tiles
          ],
        ),
      ),
    );
  }

  Widget _buildTile(String title, String? value) {
    return ListTile(
      dense: true,
      title: Text(title),
      trailing: Text(value != null && value.isNotEmpty ? value : 'N/A',
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
    );
  }
}
