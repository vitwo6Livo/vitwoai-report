class SalesAllDetailsmodel {
  final List<SalesAllDetailsContentList> content;
  final int pageNumber;
  final int pageSize;
  final int totalElements;
  final int totalPages;
  final bool lastPage;

  SalesAllDetailsmodel({
    required this.content,
    required this.pageNumber,
    required this.pageSize,
    required this.totalElements,
    required this.totalPages,
    required this.lastPage,
  });

  factory SalesAllDetailsmodel.fromJson(Map<String, dynamic> json) {
    return SalesAllDetailsmodel(
      content: (json['content'] as List)
          .map((e) => SalesAllDetailsContentList.fromJson(e))
          .toList(),
      pageNumber: json['pageNumber'],
      pageSize: json['pageSize'],
      totalElements: json['totalElements'],
      totalPages: json['totalPages'],
      lastPage: json['lastPage'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'content': content.map((index) => index.toJson()).toList(),
      'pageNumber': pageNumber,
      'pageSize': pageSize,
      'totalElements': totalElements,
      'totalPages': totalPages,
      'lastPage': lastPage,
    };
  }
}

class SalesAllDetailsContentList {
  final String sgst;
  final String allTotalAmount;
  final String items_HSNCode;
  final String kam_KamName;
  final String salesOrder_So_number;
  final String salesOrder_So_date;
  final String igst;
  final String invoiceDate;
  final String items_Qty;
  final String salesOrder_SalesOrderItems_TotalPrice;
  final String customer_Customer_address_state;
  final String invoiceNo;
  final String kam_KamCode;
  final String salesOrder_SalesOrderItems_Qty;
  final String cgst;
  final String items_GoodsItems_goodGroupName;
  final String customer_Trade_name;
  final String items_ItemName;
  final String items_ItemCode;
  final String customer_Customer_code;
  final String companyFunction_functionalities_name;
  final String sub_total_amt;
  final String customer_Customer_gstin;
  final String salesOrder_SalesOrderItems_UnitPrice;
  final String items_Uom_uomName;

  SalesAllDetailsContentList({
    required this.sgst,
    required this.allTotalAmount,
    required this.items_HSNCode,
    required this.kam_KamName,
    required this.salesOrder_So_number,
    required this.salesOrder_So_date,
    required this.igst,
    required this.invoiceDate,
    required this.items_Qty,
    required this.salesOrder_SalesOrderItems_TotalPrice,
    required this.customer_Customer_address_state,
    required this.invoiceNo,
    required this.kam_KamCode,
    required this.salesOrder_SalesOrderItems_Qty,
    required this.cgst,
    required this.items_GoodsItems_goodGroupName,
    required this.customer_Trade_name,
    required this.items_ItemName,
    required this.items_ItemCode,
    required this.customer_Customer_code,
    required this.companyFunction_functionalities_name,
    required this.sub_total_amt,
    required this.customer_Customer_gstin,
    required this.salesOrder_SalesOrderItems_UnitPrice,
    required this.items_Uom_uomName,
  });

  factory SalesAllDetailsContentList.fromJson(Map<String, dynamic> json) {
    String _toString(dynamic value) => value != null ? value.toString() : '';

    return SalesAllDetailsContentList(
      sgst: _toString(json['sgst']),
      allTotalAmount: _toString(json['all_total_amt']),
      items_HSNCode: _toString(json['items.hsnCode']),
      kam_KamName: _toString(json['kam.kamName']),
      salesOrder_So_number: _toString(json['salesOrder.so_number']),
      salesOrder_So_date: _toString(json['salesOrder.so_date']),
      igst: _toString(json['igst']),
      invoiceDate: _toString(json['invoice_date']),
      items_Qty: _toString(json['items.qty']),
      salesOrder_SalesOrderItems_TotalPrice:
          _toString(json['salesOrder.salesOrderItems.totalPrice']),
      customer_Customer_address_state:
          _toString(json['customer.customerAddress.customer_address_state']),
      invoiceNo: _toString(json['invoice_no']),
      kam_KamCode: _toString(json['kam.kamCode']),
      salesOrder_SalesOrderItems_Qty:
          _toString(json['salesOrder.salesOrderItems.qty']),
      cgst: _toString(json['cgst']),
      items_GoodsItems_goodGroupName:
          _toString(json['items.goodsItems.goodsGroup.goodGroupName']),
      customer_Trade_name: _toString(json['customer.trade_name']),
      items_ItemName: _toString(json['items.itemName']),
      items_ItemCode: _toString(json['items.itemCode']),
      customer_Customer_code: _toString(json['customer.customer_code']),
      companyFunction_functionalities_name:
          _toString(json['companyFunction.functionalities_name']),
      sub_total_amt: _toString(json['sub_total_amt']),
      customer_Customer_gstin: _toString(json['customer.customer_gstin']),
      salesOrder_SalesOrderItems_UnitPrice:
          _toString(json['salesOrder.salesOrderItems.unitPrice']),
      items_Uom_uomName: _toString(json['items.uom.uomName']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sgst': sgst,
      'all_total_amt': allTotalAmount,
      'items.hsnCode': items_HSNCode,
      'kam.kamName': kam_KamName,
      'salesOrder.so_number': salesOrder_So_number,
      'salesOrder.so_date': salesOrder_So_date,
      'igst': igst,
      'invoice_date': invoiceDate,
      'items.qty': items_Qty,
      'salesOrder.salesOrderItems.totalPrice':
          salesOrder_SalesOrderItems_TotalPrice,
      'customer.customerAddress.customer_address_state':
          customer_Customer_address_state,
      'invoice_no': invoiceNo,
      'kam.kamCode': kam_KamCode,
      'salesOrder.salesOrderItems.qty': salesOrder_SalesOrderItems_Qty,
      'cgst': cgst,
      'items.goodsItems.goodsGroup.goodGroupName':
          items_GoodsItems_goodGroupName,
      'customer.trade_name': customer_Trade_name,
      'items.itemName': items_ItemName,
      'items.itemCode': items_ItemCode,
      'customer.customer_code': customer_Customer_code,
      'companyFunction.functionalities_name':
          companyFunction_functionalities_name,
      'sub_total_amt': sub_total_amt,
      'customer.customer_gstin': customer_Customer_gstin,
      'salesOrder.salesOrderItems.unitPrice':
          salesOrder_SalesOrderItems_UnitPrice,
      'items.uom.uomName': items_Uom_uomName,
    };
  }
}
