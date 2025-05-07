class PrGraphItemModel {
  final List<PrGraphItemContent> data;

  PrGraphItemModel({
    required this.data,
  });
  factory PrGraphItemModel.fromJson(Map<String, dynamic> json) {
    return PrGraphItemModel(
      data: List<PrGraphItemContent>.from(
        json['data'].map((item) => PrGraphItemContent.fromJson(item)),
      ),
    );
  }
}

class PrGraphItemContent {
  final String? range;
  final double? TotalInvoiceValue;
  final String? TotalQty;
  final String? TotalItems;
  final List<ItemDetails> Items;
  PrGraphItemContent({
    required this.range,
    required this.TotalInvoiceValue,
    required this.TotalQty,
    required this.TotalItems,
    required this.Items,
  });

  factory PrGraphItemContent.fromJson(Map<String, dynamic> json) {
    return PrGraphItemContent(
      range: json['range'] ?? 'N/A',
      TotalInvoiceValue: double.tryParse(json['totalInvoiceValue'].toString()),
      TotalQty: json['totalQty'] ?? '0.0',
      TotalItems: json['totalItems'] ?? '0.0',
      Items: (json['items'] as List)
          .map((item) => ItemDetails.fromJson(item))
          .toList(),
    );
  }
}

class ItemDetails {
  final String? itemCode;
  final String? itemName;
  final String? totalInvoiceValue;
  final String? totalQty;

  ItemDetails({
    required this.itemCode,
    required this.itemName,
    required this.totalInvoiceValue,
    required this.totalQty,
  });

  factory ItemDetails.fromJson(Map<String, dynamic> json) {
    return ItemDetails(
      itemCode: json['itemCode'] ?? 'N/A',
      itemName: json['itemName'] ?? 'N/A',
      totalInvoiceValue: json['totalInvoiceValue'] ?? '0.0',
      totalQty: json['totalQty'] ?? '0.0',
    );
  }
}
