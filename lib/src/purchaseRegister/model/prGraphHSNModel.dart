class PrGraphHSNModel {
  final List<PrGraphHSNContent> data;

  PrGraphHSNModel({
    required this.data,
  });
  factory PrGraphHSNModel.fromJson(Map<String, dynamic> json) {
    return PrGraphHSNModel(
      data: List<PrGraphHSNContent>.from(
        json['data'].map((item) => PrGraphHSNContent.fromJson(item)),
      ),
    );
  }
}

class PrGraphHSNContent {
  final String? range;
  final double? TotalInvoiceValue;
  final List<HSNDetails> HSNCodes;

  PrGraphHSNContent({
    required this.range,
    required this.TotalInvoiceValue,
    required this.HSNCodes,
  });

  factory PrGraphHSNContent.fromJson(Map<String, dynamic> json) {
    return PrGraphHSNContent(
      range: json['range'] ?? 'N/A',
      TotalInvoiceValue: double.tryParse(json['totalInvoiceValue'].toString()),
      HSNCodes: (json['hsnCodes'] as List)
          .map((item) => HSNDetails.fromJson(item))
          .toList(),
    );
  }
}

class HSNDetails {
  final String? hsnCode;
  final String? totalInvoiceValue;

  HSNDetails({
    required this.hsnCode,
    required this.totalInvoiceValue,
  });

  factory HSNDetails.fromJson(Map<String, dynamic> json) {
    return HSNDetails(
      hsnCode: json['hsnCode'] ?? 'N/A',
      totalInvoiceValue: json['totalInvoiceValue'] ?? '0.0',
    );
  }
}
