class Salesitemwisemodel {
  final List<SalesItemContentList> content;
  final int pageNumber;
  final int pageSize;
  final int totalElements;
  final int totalPages;
  final bool lastPage;

  Salesitemwisemodel({
    required this.content,
    required this.pageNumber,
    required this.pageSize,
    required this.totalElements,
    required this.totalPages,
    required this.lastPage,
  });

  factory Salesitemwisemodel.fromJson(Map<String, dynamic> json) {
    return Salesitemwisemodel(
      content: (json['content'] as List)
          .map((e) => SalesItemContentList.fromJson(e))
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

class SalesItemContentList {
  final String itemCode;
  final String itemName;
  final String ItemGroupName;
  final String BaseUoM;
  final String AlternateUoM;
  final String HSNCode;
  final String soQuantity;
  final String invoiceQuantity;
  final String soValueNet;
  final String soValueGross;
  final String baseValue;
  final String igst;
  final String cgst;
  final String sgst;
  final String invoiceValue;

  SalesItemContentList({
    required this.itemCode,
    required this.itemName,
    required this.ItemGroupName,
    required this.BaseUoM,
    required this.AlternateUoM,
    required this.HSNCode,
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

  factory SalesItemContentList.fromJson(Map<String, dynamic> json) {
    String _toString(dynamic value) => value != null ? value.toString() : '';

    return SalesItemContentList(
      itemCode: _toString(json['Item Code']),
      itemName: _toString(json['Item Name']),
      ItemGroupName: _toString(json['Item Group Name']),
      BaseUoM: _toString(json['Base UoM']),
      AlternateUoM: _toString(json['Alternate UoM']),
      HSNCode: _toString(json['HSN Code']),
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
      'Item Code': itemCode,
      'Item Name': itemName,
      'Item Group Name': ItemGroupName,
      'Base UoM': BaseUoM,
      'Alternate UoM': AlternateUoM,
      'HSN Code': HSNCode,
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
