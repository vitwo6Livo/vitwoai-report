class Hsncodemodel {
  final List<HSNContentList> content;
  final int pageNumber;
  final int pageSize;
  final int totalElements;
  final int totalPages;
  final bool lastPage;

  Hsncodemodel({
    required this.content,
    required this.pageNumber,
    required this.pageSize,
    required this.totalElements,
    required this.totalPages,
    required this.lastPage,
  });

  factory Hsncodemodel.fromJson(Map<String, dynamic> json) {
    return Hsncodemodel(
      content: (json['content'] as List)
          .map((e) => HSNContentList.fromJson(e))
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

class HSNContentList {
  final String HSNCode;
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

  HSNContentList({
    required this.HSNCode,
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

  factory HSNContentList.fromJson(Map<String, dynamic> json) {
    String _toString(dynamic value) => value != null ? value.toString() : 'N/A';

    return HSNContentList(
      HSNCode: _toString(json['HSN Code']),
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
      'HSN Code': HSNCode,
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
