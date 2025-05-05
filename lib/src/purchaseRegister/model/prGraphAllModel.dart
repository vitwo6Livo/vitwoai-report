class PrGraphAllModel {
  final List<PrGraphAllContent> data;

  PrGraphAllModel({
    required this.data,
  });
  factory PrGraphAllModel.fromJson(Map<String, dynamic> json) {
    return PrGraphAllModel(
      data: List<PrGraphAllContent>.from(
        json['data'].map((item) => PrGraphAllContent.fromJson(item)),
      ),
    );
  }
}

class PrGraphAllContent {
  final String? Month;
  final double? TotalQty;
  final double? TotalAmount;
  PrGraphAllContent({
    this.Month,
    this.TotalQty,
    this.TotalAmount,
  });
  factory PrGraphAllContent.fromJson(Map<String, dynamic> json) {
    return PrGraphAllContent(
      Month: json['month'] ?? '',
      TotalQty: double.tryParse(json['totalQty'].toString()) ?? 0.0,
      TotalAmount: double.tryParse(json['totalAmount'].toString()) ?? 0.0,
    );
  }
}
