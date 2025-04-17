class SalesHSNCodewisemodel {
  final List<SalesHSNCodeContentList> content;
  final int pageNumber;
  final int pageSize;
  final int totalElements;
  final int totalPages;
  final bool lastPage;

  SalesHSNCodewisemodel({
    required this.content,
    required this.pageNumber,
    required this.pageSize,
    required this.totalElements,
    required this.totalPages,
    required this.lastPage,
  });

  factory SalesHSNCodewisemodel.fromJson(Map<String, dynamic> json) {
    return SalesHSNCodewisemodel(
      content: (json['content'] as List)
          .map((e) => SalesHSNCodeContentList.fromJson(e))
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

class SalesHSNCodeContentList {
  final String hsnCode;
  final String soQuantity;
  final String invoiceQuantity;
  final String soValueNet;
  final String soValueGross;
  final String baseValue;
  final String igst;
  final String cgst;
  final String sgst;
  final String invoiceValue;

  SalesHSNCodeContentList({
    required this.hsnCode,
    required this.soQuantity,
    required this.invoiceQuantity,
    required this.soValueNet,
    required this.soValueGross,
    required this.baseValue,
    required this.igst,
    required this.cgst,
    required this.sgst,
    required this.invoiceValue,
  });

  factory SalesHSNCodeContentList.fromJson(Map<String, dynamic> json) {
    String _toString(dynamic value) => value != null ? value.toString() : '';

    return SalesHSNCodeContentList(
      hsnCode: _toString(json['HSN Code']),
      soQuantity: _toString(json['SO Quantity']),
      invoiceQuantity: _toString(json['Invoice Quantity']),
      soValueNet: _toString(json['SO Value (Net)']),
      soValueGross: _toString(json['SO Value (Gross)']),
      baseValue: _toString(json['Base Value']),
      igst: _toString(json['IGST']),
      cgst: _toString(json['CGST']),
      sgst: _toString(json['SGST']),
      invoiceValue: _toString(json['Invoice Value']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'HSN Code': hsnCode,
      'SO Quantity': soQuantity,
      'Invoice Quantity': invoiceQuantity,
      'SO Value (Net)': soValueNet,
      'SO Value (Gross)': soValueGross,
      'Base Value': baseValue,
      'IGST': igst,
      'CGST': cgst,
      'SGST': sgst,
      'Invoice Value': invoiceValue,
    };
  }
}
