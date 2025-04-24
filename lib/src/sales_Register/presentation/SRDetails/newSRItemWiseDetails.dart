import 'package:flutter/material.dart';
import 'package:vitwoai_report/src/sales_Register/model/salesItemWiseModel.dart';
import 'package:vitwoai_report/src/settings/colors.dart';
import 'package:vitwoai_report/src/settings/texts.dart';

class newSRItemWiseDetailsScreen extends StatelessWidget {
  List<SalesItemContentList> data;
  int index;

  newSRItemWiseDetailsScreen(
      {super.key, required this.data, required this.index});

  @override
  Widget build(BuildContext context) {
    final item = data[index];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          HandText.srItemGWiseDetailsTitle,
          style: TextStyle(color: AppColor.appbarFont),
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSection(HandText.srItemW_ItemInfo, [
              _buildTile("Item Code", item.itemCode),
              _buildTile("Item Name", item.itemName),
              _buildTile("Item Group Name", item.ItemGroupName),
              _buildTile("HSN Code", item.HSNCode),
              _buildTile("Base UOM", item.BaseUoM),
              _buildTile("Alternate UOM", item.AlternateUoM),
            ]),
            _buildSection(HandText.srItemWQtyVal, [
              _buildTile("SO Quantity", "₹${item.soQuantity}"),
              _buildTile("Invoice Quantity", item.invoiceQuantity),
              _buildTile("SO Value (Net)", "₹${item.soValueNet}"),
              _buildTile("SO Value (Gross)", item.soValueGross),
            ]),
            _buildSection(HandText.srItemWTaxAmt, [
              _buildTile("Base Value", "₹${item.baseValue}"),
              _buildTile("IGST", "₹${item.igst}"),
              _buildTile("CGST", "₹${item.cgst}"),
              _buildTile("SGST", "₹${item.sgst}"),
              const Divider(),
              _buildTile("Grand Total", "₹${item.invoiceValue}"),
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
            Text(title.toString(),
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
          style: const TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}
