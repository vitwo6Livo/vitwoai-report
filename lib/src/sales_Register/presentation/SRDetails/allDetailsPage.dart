import 'package:flutter/material.dart';
import 'package:vitwoai_report/src/sales_Register/model/salesAllDetailsModel.dart';
import 'package:vitwoai_report/src/settings/colors.dart';

class AllDetailsPage extends StatelessWidget {
  List<SalesAllDetailsContentList> data;
  int index;

  AllDetailsPage({super.key, required this.data, required this.index});

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
          "Sales Register Details",
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
            _buildSection("Invoice Info", [
              _buildTile("Invoice No", item.invoiceNo),
              _buildTile("Invoice Date", item.invoiceDate),
            ]),
            _buildSection("Customer Info", [
              _buildTile("Trade Name", item.customer_Trade_name),
              _buildTile("GSTIN", item.customer_Customer_gstin),
              _buildTile("State", item.customer_Customer_address_state),
            ]),
            _buildSection("Order Info", [
              _buildTile("SO Number", item.salesOrder_So_number),
              _buildTile("SO Date", item.salesOrder_So_date),
            ]),
            _buildSection("Item Details", [
              _buildTile("Item Name", item.items_ItemName),
              _buildTile("Item Code", item.items_ItemCode),
              _buildTile("HSN Code", item.items_HSNCode),
              _buildTile("UOM", item.items_Uom_uomName),
              _buildTile("Quantity", item.items_Qty),
              _buildTile("Unit Price",
                  "₹${item.salesOrder_SalesOrderItems_UnitPrice}"),
              _buildTile("Total Price",
                  "₹${item.salesOrder_SalesOrderItems_TotalPrice}"),
              _buildTile("Goods Group", item.items_GoodsItems_goodGroupName),
            ]),
            _buildSection("Tax & Amounts", [
              _buildTile("Sub Total", "₹${item.sub_total_amt}"),
              _buildTile("IGST", "₹${item.igst}"),
              _buildTile("CGST", "₹${item.cgst}"),
              _buildTile("SGST", "₹${item.sgst}"),
              const Divider(),
              _buildTile("Grand Total", "₹${item.allTotalAmount}"),
            ]),
            _buildSection("KAM Details", [
              _buildTile("KAM Name", item.kam_KamName),
              _buildTile("KAM Code", item.kam_KamCode),
              _buildTile("Function", item.companyFunction_functionalities_name),
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
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
    );
  }
}
