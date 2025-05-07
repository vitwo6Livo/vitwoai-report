class Pomodel {
  final List<POContentList> content;
  final int pageNumber;
  final int pageSize;
  final int totalElements;
  final int totalPages;
  final bool lastPage;

  Pomodel({
    required this.pageNumber,
    required this.pageSize,
    required this.totalElements,
    required this.totalPages,
    required this.lastPage,
    required this.content,
  });

  factory Pomodel.fromJson(Map<String, dynamic> json) {
    return Pomodel(
      content: json[''],
      pageNumber: json['pageNumber'],
      pageSize: json['pageSize'],
      totalElements: json['totalElements'],
      totalPages: json['totalPages'],
      lastPage: json['lastPage'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'pageNumber': pageNumber,
      'pageSize': pageSize,
      'totalElements': totalElements,
      'totalPages': totalPages,
      'lastPage': lastPage,
    };
  }
}

class POContentList {
  final String poNumber;
  final String poDate;
  final String vendorCode;
  final String vendorName;
  final String? poQuantity;
  final String? invoiceQuantity;
  final String? receivedQuantity;
  final String? poValueNet;
  final String? poValueGross;
  final String? baseValue;
  final String? igst;
  final String? cgst;
  final String? sgst;
  final String? tds;
  final String? invoiceValue;

  POContentList({
    required this.poNumber,
    required this.poDate,
    required this.vendorCode,
    required this.vendorName,
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

  factory POContentList.fromJson(Map<String, dynamic> json) {
    String _toString(dynamic value) => value != '' ? value.toString() : '';

    return POContentList(
      poNumber: _toString(json['PO Number']),
      poDate: _toString(json['PO Date']),
      vendorCode: _toString(json['Vendor Code']),
      vendorName: _toString(json['Vendor Name']),
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
}
