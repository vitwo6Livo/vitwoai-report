import 'dart:convert';

PayableModel payableModelFromMap(String str) =>
    PayableModel.fromMap(json.decode(str));

String payableModelToMap(PayableModel data) => json.encode(data.toMap());

class PayableModel {
  List<Content> content;
  int pageNumber;
  int pageSize;
  int totalElements;
  int totalPages;
  bool lastPage;

  PayableModel({
    required this.content,
    required this.pageNumber,
    required this.pageSize,
    required this.totalElements,
    required this.totalPages,
    required this.lastPage,
  });

  factory PayableModel.fromMap(Map<String, dynamic> json) => PayableModel(
        content:
            List<Content>.from(json["content"].map((x) => Content.fromMap(x))),
        pageNumber: json["pageNumber"],
        pageSize: json["pageSize"],
        totalElements: json["totalElements"],
        totalPages: json["totalPages"],
        lastPage: json["lastPage"],
      );

  Map<String, dynamic> toMap() => {
        "content": List<dynamic>.from(content.map((x) => x.toMap())),
        "pageNumber": pageNumber,
        "pageSize": pageSize,
        "totalElements": totalElements,
        "totalPages": totalPages,
        "lastPage": lastPage,
      };
}

class Content {
  String vendorCode;
  String vendorName;
  double totalDue;
  double onAccountDue;
  double netDue;
  Map<String, double> dueAmounts;
  Map<String, double> onAccountAmounts;

  Content({
    required this.vendorCode,
    required this.vendorName,
    required this.totalDue,
    required this.onAccountDue,
    required this.netDue,
    required this.dueAmounts,
    required this.onAccountAmounts,
  });

  factory Content.fromMap(Map<String, dynamic> json) => Content(
        vendorCode: json["vendor_code"],
        vendorName: json["vendor_name"],
        totalDue: json["total_due"]?.toDouble(),
        onAccountDue: json["on_account_due"]?.toDouble(),
        netDue: json["net_due"]?.toDouble(),
        dueAmounts: Map.from(json["dueAmounts"])
            .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        onAccountAmounts: Map.from(json["onAccountAmounts"])
            .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
      );

  Map<String, dynamic> toMap() => {
        "vendor_code": vendorCode,
        "vendor_name": vendorName,
        "total_due": totalDue,
        "on_account_due": onAccountDue,
        "net_due": netDue,
        "dueAmounts":
            Map.from(dueAmounts).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "onAccountAmounts": Map.from(onAccountAmounts)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
