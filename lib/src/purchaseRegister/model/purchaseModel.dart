// /*
class AllPurchasemodel {
  final List<PurchaseContentList> content;
  final int pageNumber;
  final int pageSize;
  final int totalElements;
  final int totalPages;
  final bool lastPage;

  AllPurchasemodel({
    required this.pageNumber,
    required this.pageSize,
    required this.totalElements,
    required this.totalPages,
    required this.lastPage,
    required this.content,
  });

  factory AllPurchasemodel.fromJson(Map<String, dynamic> json) {
    return AllPurchasemodel(
      content: (json['content'] as List)
          .map((e) => PurchaseContentList.fromJson(e))
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

class PurchaseContentList {
  final String vendorDocumentNo;
  final String postingDate;
  final String? vendorDocumentDate;
  final String? grnSubTotal;
  final String? grnInvoiceItemsAlternateUomName;
  final String? grnIvCode;
  final String? grnInvoiceItemsReceivedQty;
  final String? grnInvoiceItemsBaseUomName;
  final String? grnTotalSgst;
  final String? grnInvoiceItems_GoodsGroup_GoodGroupName;
  final String? grnPoSubtotal;
  final String? grnVendors_Vendor_code;
  final String? grnTotalIgst;
  final String? grnTotalCgst;
  final String? grnPo_Po_number;
  final String? grnInvoiceItems_ItemName;
  final String? grnPoItemsQty;
  final String? grnInvoiceItems_goodQty;
  final String? grnTotalTds;
  final String? grnTotalAmount;
  final String? grnInvoiceItems_GoodCode;
  final String? grnPO_PODate;
  final String? grnPO_totalAmount;
  final String? grn_vendors_tradename;
  final String? grnInvoiceItems_GoodHSN;

  PurchaseContentList({
    required this.vendorDocumentNo,
    required this.postingDate,
    required this.vendorDocumentDate,
    required this.grnSubTotal,
    required this.grnInvoiceItemsAlternateUomName,
    required this.grnIvCode,
    required this.grnInvoiceItemsReceivedQty,
    required this.grnInvoiceItemsBaseUomName,
    required this.grnTotalSgst,
    required this.grnInvoiceItems_GoodsGroup_GoodGroupName,
    required this.grnPoSubtotal,
    required this.grnVendors_Vendor_code,
    required this.grnTotalIgst,
    required this.grnTotalCgst,
    required this.grnPo_Po_number,
    required this.grnInvoiceItems_ItemName,
    required this.grnPoItemsQty,
    required this.grnInvoiceItems_goodQty,
    required this.grnTotalTds,
    required this.grnTotalAmount,
    required this.grnInvoiceItems_GoodCode,
    required this.grnPO_PODate,
    required this.grnPO_totalAmount,
    required this.grn_vendors_tradename,
    required this.grnInvoiceItems_GoodHSN,
  });

  factory PurchaseContentList.fromJson(Map<String, dynamic> json) {
    String _toString(dynamic value) => value != null ? value.toString() : '';

    return PurchaseContentList(
      vendorDocumentNo: _toString(json['vendorDocumentNo']),
      postingDate: _toString(json['postingDate']),
      vendorDocumentDate: _toString(json['vendorDocumentDate']),
      grnSubTotal: _toString(json['grnSubTotal']),
      grnInvoiceItemsAlternateUomName:
          _toString(json['grnInvoiceItems.items.alternateUom.uomName']),
      grnIvCode: _toString(json['grnIvCode)']),
      grnInvoiceItemsReceivedQty:
          _toString(json['grnInvoiceItems.receivedQty']),
      grnInvoiceItemsBaseUomName:
          _toString(json['grnInvoiceItems.items.baseUom.uomName']),
      grnTotalSgst: _toString(json['grnTotalSgst']),
      grnInvoiceItems_GoodsGroup_GoodGroupName:
          _toString(json['grnInvoiceItems.items.goodsGroup.goodGroupName']),
      grnPoSubtotal: _toString(json['grn.po.subtotal']),
      grnVendors_Vendor_code: _toString(json['grn.vendors.vendor_code']),
      grnTotalIgst: _toString(json['grnTotalIgst']),
      grnTotalCgst: _toString(json['grnTotalCgst']),
      grnPo_Po_number: _toString(json['grn.po.po_number']),
      grnInvoiceItems_ItemName:
          _toString(json['grnInvoiceItems.items.itemName']),
      grnPoItemsQty: _toString(json['grn.po.poItems.qty']),
      grnInvoiceItems_goodQty: _toString(json['grnInvoiceItems.goodQty']),
      grnTotalTds: _toString(json['grnTotalTds']),
      grnTotalAmount: _toString(json['grnTotalAmount']),
      grnInvoiceItems_GoodCode: _toString(json['grnInvoiceItems.goodCode']),
      grnPO_PODate: _toString(json['grn.po.po_date']),
      grnPO_totalAmount: _toString(json['grn.po.totalAmount']),
      grn_vendors_tradename: _toString(json['grn.vendors.trade_name']),
      grnInvoiceItems_GoodHSN: _toString(json['grnInvoiceItems.goodHsn']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'vendorDocumentNo': vendorDocumentNo,
      'postingDate': postingDate,
      'vendorDocumentDate': vendorDocumentDate,
      'grnSubTotal': grnSubTotal,
      'grnInvoiceItems.items.alternateUom.uomName':
          grnInvoiceItemsAlternateUomName,
      'grnIvCode': grnIvCode,
      'grnInvoiceItems.receivedQty': grnInvoiceItemsReceivedQty,
      'grnInvoiceItems.items.baseUom.uomName': grnInvoiceItemsBaseUomName,
      'grnTotalSgst': grnTotalSgst,
      'grnInvoiceItems.items.goodsGroup.goodGroupName':
          grnInvoiceItems_GoodsGroup_GoodGroupName,
      'grn.po.subtotal': grnPoSubtotal,
      'grn.vendors.vendor_code': grnVendors_Vendor_code,
      'grnTotalIgst': grnTotalIgst,
      'grnTotalCgst': grnTotalCgst,
      'grn.po.po_number': grnPo_Po_number,
      'grnInvoiceItems.items.itemName': grnInvoiceItems_ItemName,
      'grn.po.poItems.qty': grnPoItemsQty,
      'grnInvoiceItems.goodQty': grnInvoiceItems_goodQty,
      'grnTotalTds': grnTotalTds,
      'grnTotalAmount': grnTotalAmount,
      'grnInvoiceItems.goodCode': grnInvoiceItems_GoodCode,
      'grn.po.po_date': grnPO_PODate,
      'grn.po.totalAmount': grnPO_totalAmount,
      'grn.vendors.trade_name': grn_vendors_tradename,
      'grnInvoiceItems.goodHsn': grnInvoiceItems_GoodHSN,
    };
  }
}
