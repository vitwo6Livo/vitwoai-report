class PrGraphItemGRModel {
  final List<PrGraphItemGRContent> data;

  PrGraphItemGRModel({
    required this.data,
  });
  factory PrGraphItemGRModel.fromJson(Map<String, dynamic> json) {
    return PrGraphItemGRModel(
      data: List<PrGraphItemGRContent>.from(
        json['data'].map((item) => PrGraphItemGRContent.fromJson(item)),
      ),
    );
  }
}

class PrGraphItemGRContent {
  final String? range;
  final double? TotalInvoiceValue;
  final String? TotalQty;
  final String? TotalItemGroups;
  final List<ItemGRDetails> ItemGroups;
  PrGraphItemGRContent({
    required this.range,
    required this.TotalInvoiceValue,
    required this.TotalQty,
    required this.TotalItemGroups,
    required this.ItemGroups,
  });

  factory PrGraphItemGRContent.fromJson(Map<String, dynamic> json) {
    return PrGraphItemGRContent(
      range: json['range'] ?? 'N/A',
      TotalInvoiceValue: double.tryParse(json['totalInvoiceValue'].toString()),
      TotalQty: json['totalQty'] ?? '0.0',
      TotalItemGroups: json['totalItemGroups'] ?? 'N/A',
      ItemGroups: (json['itemGroups'] as List)
          .map((item) => ItemGRDetails.fromJson(item))
          .toList(),
    );
  }
}

class ItemGRDetails {
  final String? groupId;
  final String? groupName;
  final String? totalInvoiceValue;
  final String? totalQty;

  ItemGRDetails({
    required this.groupId,
    required this.groupName,
    required this.totalInvoiceValue,
    required this.totalQty,
  });

  factory ItemGRDetails.fromJson(Map<String, dynamic> json) {
    return ItemGRDetails(
      groupId: json['grId'] ?? 'N/A',
      groupName: json['groupName'] ?? 'N/A',
      totalInvoiceValue: json['totalInvoiceValue'] ?? '0.0',
      totalQty: json['totalQty'] ?? '0.0',
    );
  }
}
