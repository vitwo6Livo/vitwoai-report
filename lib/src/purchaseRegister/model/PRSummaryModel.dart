import 'dart:convert';

PrSummaryModel prSummaryModelFromMap(String str) =>
    PrSummaryModel.fromMap(json.decode(str));

String prSummaryModelToMap(PrSummaryModel data) => json.encode(data.toMap());

class PrSummaryModel {
  String totalAmount;
  String totalCgst;
  String totalIgst;
  String totalSgst;

  PrSummaryModel({
    required this.totalAmount,
    required this.totalCgst,
    required this.totalIgst,
    required this.totalSgst,
  });

  factory PrSummaryModel.fromMap(Map<String, dynamic> json) => PrSummaryModel(
        totalAmount: json["totalAmount"],
        totalCgst: json["totalCgst"],
        totalIgst: json["totalIgst"],
        totalSgst: json["totalSgst"],
      );

  Map<String, dynamic> toMap() => {
        "totalAmount": totalAmount,
        "totalCgst": totalCgst,
        "totalIgst": totalIgst,
        "totalSgst": totalSgst,
      };
}
