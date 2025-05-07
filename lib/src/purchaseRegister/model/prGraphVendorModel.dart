class PrGraphVendorModel {
  final List<PrGraphVendorContent> data;

  PrGraphVendorModel({
    required this.data,
  });
  factory PrGraphVendorModel.fromJson(Map<String, dynamic> json) {
    return PrGraphVendorModel(
      data: List<PrGraphVendorContent>.from(
        json['data'].map((item) => PrGraphVendorContent.fromJson(item)),
      ),
    );
  }
}

class PrGraphVendorContent {
  final String? range;
  final double? TotalInvoiceValue;
  final String? TotalQty;
  final String? TotalVendors;
  final List<VendorDetails> Vendors;
  PrGraphVendorContent({
    required this.range,
    required this.TotalInvoiceValue,
    required this.TotalQty,
    required this.TotalVendors,
    required this.Vendors,
  });

  factory PrGraphVendorContent.fromJson(Map<String, dynamic> json) {
    return PrGraphVendorContent(
      range: json['range'] ?? 'N/A',
      TotalInvoiceValue: double.tryParse(json['totalInvoiceValue'].toString()),
      TotalQty: json['totalQty'] ?? '0.0',
      TotalVendors: json['totalVendors'] ?? '0.0',
      Vendors: (json['vendors'] as List)
          .map((item) => VendorDetails.fromJson(item))
          .toList(),
    );
  }
}

class VendorDetails {
  final String? vendorId;
  final String? vendorCode;
  final String? vendorName;
  final String? totalInvoiceValue;
  final String? qty;

  VendorDetails({
    required this.vendorId,
    required this.vendorCode,
    required this.vendorName,
    required this.totalInvoiceValue,
    required this.qty,
  });

  factory VendorDetails.fromJson(Map<String, dynamic> json) {
    return VendorDetails(
      vendorId: json['vendorId'] ?? 'N/A',
      vendorCode: json['vendorCode'] ?? 'N/A',
      vendorName: json['vendorName'] ?? 'N/A',
      totalInvoiceValue: json['totalInvoiceValue'] ?? '0.0',
      qty: json['totalQty'] ?? '0.0',
    );
  }
}
