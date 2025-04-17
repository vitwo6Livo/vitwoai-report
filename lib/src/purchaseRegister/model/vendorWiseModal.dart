class Vendorwisemodal {
  final List<VendorContentList> content;
  final int pageNumber;
  final int pageSize;
  final int totalElements;
  final int totalPages;
  final bool lastPage;

  Vendorwisemodal({
    required this.pageNumber,
    required this.pageSize,
    required this.totalElements,
    required this.totalPages,
    required this.lastPage,
    required this.content,
  });

  factory Vendorwisemodal.fromJson(Map<String, dynamic> json) {
    return Vendorwisemodal(
      content: (json['content'] as List)
          .map((e) => VendorContentList.fromJson(e))
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

class VendorContentList {
  final String vendorCode;
  final String vendorName;
  final double? poQuantity;
  final double? invoiceQuantity;
  final double? receivedQuantity;
  final double? poValueNet;
  final double? poValueGross;
  final double? baseValue;
  final double? igst;
  final double? cgst;
  final double? sgst;
  final double? tds;
  final double? invoiceValue;

  VendorContentList({
    required this.vendorCode,
    required this.vendorName,
    this.poQuantity,
    this.invoiceQuantity,
    this.receivedQuantity,
    this.poValueNet,
    this.poValueGross,
    this.baseValue,
    this.igst,
    this.cgst,
    this.sgst,
    this.tds,
    this.invoiceValue,
  });

  factory VendorContentList.fromJson(Map<String, dynamic> json) {
    double? _toDouble(dynamic value) =>
        value != null ? double.tryParse(value.toString()) : null;

    String _toString(dynamic value) => value != null ? value.toString() : '';

    return VendorContentList(
      vendorCode: _toString(json['Vendor Code']),
      vendorName: _toString(json['Vendor Name']),
      poQuantity: _toDouble(json['PO Quantity']),
      invoiceQuantity: _toDouble(json['Invoice Quantity']),
      receivedQuantity: _toDouble(json['Received Quantity']),
      poValueNet: _toDouble(json['PO Value (Net)']),
      poValueGross: _toDouble(json['PO Value (Gross)']),
      baseValue: _toDouble(json['Base Value']),
      igst: _toDouble(json['IGST']),
      cgst: _toDouble(json['CGST']),
      sgst: _toDouble(json['SGST']),
      tds: _toDouble(json['TDS']),
      invoiceValue: _toDouble(json['Invoice Value']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'Vendor Code': vendorCode,
      'Vendor Name': vendorName,
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
