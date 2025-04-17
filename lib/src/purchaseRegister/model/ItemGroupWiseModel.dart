class ItemGroupwisemodel {
  final List<ItemGrContentList> content;
  final int pageNumber;
  final int pageSize;
  final int totalElements;
  final int totalPages;
  final bool lastPage;

  ItemGroupwisemodel({
    required this.content,
    required this.pageNumber,
    required this.pageSize,
    required this.totalElements,
    required this.totalPages,
    required this.lastPage,
  });

  factory ItemGroupwisemodel.fromJson(Map<String, dynamic> json) {
    return ItemGroupwisemodel(
      content: (json['content'] as List)
          .map((e) => ItemGrContentList.fromJson(e))
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

class ItemGrContentList {
  final String ItemGroupName;
  final String poQuantity;
  final String invoiceQuantity;
  final String receivedQuantity;
  final String poValueNet;
  final String poValueGross;
  final String baseValue;
  final String igst;
  final String cgst;
  final String sgst;
  final String tds;
  final String invoiceValue;

  ItemGrContentList({
    required this.ItemGroupName,
    required this.poQuantity,
    required this.invoiceQuantity,
    required this.receivedQuantity,
    required this.poValueNet,
    required this.poValueGross,
    required this.baseValue,
    required this.igst,
    required this.cgst,
    required this.sgst,
    required this.tds,
    required this.invoiceValue,
  });

  factory ItemGrContentList.fromJson(Map<String, dynamic> json) {
    String _toString(dynamic value) => value != null ? value.toString() : '';

    return ItemGrContentList(
      ItemGroupName: _toString(json['Item Group Name']),
      poQuantity: _toString(json['PO Quantity']),
      invoiceQuantity: _toString(json['Invoice Quantity']),
      receivedQuantity: _toString(json['Received Quantity']),
      poValueNet: _toString(json['PO Value (Net)']),
      poValueGross: _toString(json['PO Value (Gross)']),
      baseValue: _toString(json['Base Value']),
      igst: _toString(json['IGST']),
      cgst: _toString(json['CGST']),
      sgst: _toString(json['SGST']),
      tds: _toString(json['TDS']),
      invoiceValue: _toString(json['Invoice Value']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Item Group Name': ItemGroupName,
      'PO Quantity': poQuantity,
      'Invoice Quantity': invoiceQuantity,
      'Received Quantity': receivedQuantity,
      'PO Value (Net)': poValueNet,
      'PO Value (Gross)': poValueGross,
      'Base Value': baseValue,
      'IGST': igst,
      'CGST': cgst,
      'SGST': sgst,
      'TDS': tds,
      'Invoice Value': invoiceValue,
    };
  }
}
