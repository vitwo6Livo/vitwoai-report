class SalesItemGroupwisemodel {
  final List<SalesItemGroupContentList> content;
  final int pageNumber;
  final int pageSize;
  final int totalElements;
  final int totalPages;
  final bool lastPage;

  SalesItemGroupwisemodel({
    required this.content,
    required this.pageNumber,
    required this.pageSize,
    required this.totalElements,
    required this.totalPages,
    required this.lastPage,
  });

  factory SalesItemGroupwisemodel.fromJson(Map<String, dynamic> json) {
    return SalesItemGroupwisemodel(
      content: (json['content'] as List)
          .map((e) => SalesItemGroupContentList.fromJson(e))
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

class SalesItemGroupContentList {
  final String itemGroupName;
  final String soQuantity;
  final String invoiceQuantity;
  final String soValueNet;
  final String soValueGross;
  final String baseValue;
  final String igst;
  final String cgst;
  final String sgst;
  final String invoiceValue;

  SalesItemGroupContentList({
    required this.itemGroupName,
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

  factory SalesItemGroupContentList.fromJson(Map<String, dynamic> json) {
    String _toString(dynamic value) => value != null ? value.toString() : '';

    return SalesItemGroupContentList(
      itemGroupName: _toString(json['Item Group Name']),
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
      'Item Group Name': itemGroupName,
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
