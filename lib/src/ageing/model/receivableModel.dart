class ReceivableAPIModel {
  final int pageNumber;
  final int pageSize;
  final int totalElements;
  final int totalPages;
  final bool lastPage;
  final List<ContentList> content;

  ReceivableAPIModel({
    required this.pageNumber,
    required this.pageSize,
    required this.totalElements,
    required this.totalPages,
    required this.lastPage,
    required this.content,
  });

  factory ReceivableAPIModel.fromJson(Map<String, dynamic> json) {
    return ReceivableAPIModel(
      content: (json['content'] as List)
          .map((e) => ContentList.fromJson(e))
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

class ContentList {
  final String customerCode;
  final String customerName;
  final double totalDue;
  final double onAccountDue;
  final double netDue;
  final DueAmount dueAmounts;
  final AmountMap onAccountAmounts;

  ContentList({
    required this.customerCode,
    required this.customerName,
    required this.totalDue,
    required this.onAccountDue,
    required this.netDue,
    required this.dueAmounts,
    required this.onAccountAmounts,
  });

  factory ContentList.fromJson(Map<String, dynamic> json) {
    return ContentList(
      customerCode: json['customer_code'],
      customerName: json['customer_name'],
      totalDue: (json['total_due'] as num).toDouble(),
      onAccountDue: (json['on_account_due'] as num).toDouble(),
      netDue: (json['net_due'] as num).toDouble(),
      dueAmounts: DueAmount.fromJson(json['dueAmounts']),
      onAccountAmounts: AmountMap.fromJson(json['onAccountAmounts']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customer_code': customerCode,
      'customer_name': customerName,
      'total_due': totalDue,
      'on_account_due': onAccountDue,
      'net_due': netDue,
      'dueAmounts': dueAmounts.toJson(),
      'onAccountAmounts': onAccountAmounts.toJson(), // .toJson for
    };
  }
}

class DueAmount {
  final Map<String, double> values;

  DueAmount({required this.values});

  factory DueAmount.fromJson(Map<String, dynamic> json) {
    return DueAmount(
      values: json.map(
        (key, value) => MapEntry(key, (value is num) ? value.toDouble() : 0.0),
      ),
    );
  }
  Map<String, double> toJson() => values;
}

class AmountMap {
  final Map<String, double> amount;

  AmountMap({required this.amount});

  factory AmountMap.fromJson(Map<String, dynamic> json) {
    return AmountMap(
      amount: json.map(
        (key, value) => MapEntry(key, (value as num).toDouble()),
      ),
    );
  }
  Map<String, double> toJson() => amount;
}
