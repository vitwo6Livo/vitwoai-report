import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vitwoai_report/src/sales_Register/model/salesAllDetailsModel.dart';
import 'package:vitwoai_report/src/sales_Register/model/salesCustomerWiseModel.dart';
import 'package:vitwoai_report/src/sales_Register/model/salesHSNCodeModel.dart';
import 'package:vitwoai_report/src/sales_Register/model/salesItemGroupWiseModel.dart';
import 'package:vitwoai_report/src/sales_Register/model/salesItemWiseModel.dart';
import 'package:vitwoai_report/src/sales_Register/model/salesSOWiseModel.dart';
import 'package:vitwoai_report/src/utils/api_urls.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//All Sales Register Data

final salesRegisterProvider = FutureProvider.family((ref, String key) async {
  return await fetchSalesRegisterData(key);
});

Future<SalesAllDetailsmodel> fetchSalesRegisterData(String searchKey) async {
  final accessToken = await getTokenData();

  final url = Uri.parse('$baseURL$salesRegisterAllListUrl');

  final Map<String, dynamic> bodyData = {
    "data": [
      "items.itemCode", // item code
      "items.itemName", // item name
      "customer.customer_code", // customer code
      "customer.trade_name", // customer name
      "customer.customer_gstin", // Customer GST No.
      "kam.kamCode", // kam code
      "kam.kamName", // kam name
      "items.goodsItems.goodsGroup.goodGroupName", // Gr name
      "invoice_no", // invoeice no.
      "invoice_date", // invoice date
      "salesOrder.so_number", // SO no.
      "salesOrder.so_date", // SO date
      "items.hsnCode", // hsn code
      "items.uom.uomName", // alternate uom
      "items.qty", // Total quantity
      "salesOrder.salesOrderItems.qty", // SO qty
      "salesOrder.salesOrderItems.unitPrice", // SO net value
      "salesOrder.salesOrderItems.totalPrice", // SO gross value
      "sub_total_amt", // Base value
      "igst",
      "sgst",
      "cgst",
      "all_total_amt", // Total amount
      "customer.customerAddress.customer_address_state", // Customer address
      "companyFunction.functionalities_name" // Fucntional area
    ],
    "groupBy": [],
    "filter": [
      {
        "column": "customer.trade_name",
        "operator": "like",
        "type": "String",
        "value": searchKey
      }
    ],
    "page": 0,
    "size": 500,
    "sortDir": "asc",
    "sortBy": "invoice_date"
  };

  try {
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
      body: json.encode(bodyData),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return SalesAllDetailsmodel.fromJson(data);
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    throw Exception('Failed to load data');
  }
}

//SO Wise Sales Register Data
final salesRegisterSOProvider =
    FutureProvider.family((ref, String searchItem) async {
  return await fetchSalesRegisterSOData(searchData: searchItem);
});

Future<SalesSOwisemodel> fetchSalesRegisterSOData({
  required String searchData,
  int page = 0,
  int size = 100,
  String sortBy = "Invoice Value",
  String sortDir = "desc",
}) async {
  final accessToken = await getTokenData();

  final url = Uri.parse('$baseURL$salesRegisterSOWiseUrl');

  final Map<String, dynamic> bodyData = {
    "page": page,
    "size": size,
    "sortBy": sortBy,
    "sortDir": sortDir,
    "search": searchData,
  };

  try {
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
      body: json.encode(bodyData),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return SalesSOwisemodel.fromJson(data);
    } else {
      throw Exception('HTTP Error: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('API Error: $e');
  }
}

//Customer Wise Sales Register Data
final salesRegisterCustomerProvider =
    FutureProvider.family((ref, String searchItem) async {
  return await fetchSalesRegisterCustomerData(searchData: searchItem);
});

Future<SalesCustomerwisemodel> fetchSalesRegisterCustomerData({
  required String searchData,
  int page = 0,
  int size = 100,
  String sortBy = "Customer Name",
  String sortDir = "desc",
}) async {
  final accessToken = await getTokenData();

  final url = Uri.parse('$baseURL$salesRegisterCustomerWiseUrl');

  final Map<String, dynamic> bodyData = {
    "page": page,
    "size": size,
    "sortBy": sortBy,
    "sortDir": sortDir,
    "search": searchData
  };

  try {
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
      body: json.encode(bodyData),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return SalesCustomerwisemodel.fromJson(data);
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    throw Exception('Failed to load data');
  }
}

//item Wise Sales Register Data
final salesRegisterItemProvider =
    FutureProvider.family((ref, String searchItem) async {
  return await fetchSalesRegisterItemData(searchData: searchItem);
});

Future<Salesitemwisemodel> fetchSalesRegisterItemData({
  required String searchData,
  int page = 0,
  int size = 100,
  String sortBy = "Invoice Value",
  String sortDir = "desc",
}) async {
  final accessToken = await getTokenData();

  final url = Uri.parse('$baseURL$salesRegisterItemWiseUrl');

  final Map<String, dynamic> bodyData = {
    "page": page,
    "size": size,
    "sortBy": sortBy,
    "sortDir": sortDir,
    "search": searchData
  };

  try {
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
      body: json.encode(bodyData),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Salesitemwisemodel.fromJson(data);
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    throw Exception('Failed to load data');
  }
}

//Item Group Wise Sales Register Data
final salesRegisterItemGroupProvider =
    FutureProvider.family((ref, String searchItem) async {
  return await fetchSalesRegisterItemGroupData(searchData: searchItem);
});

Future<SalesItemGroupwisemodel> fetchSalesRegisterItemGroupData({
  required String searchData,
  int page = 0,
  int size = 100,
  String sortBy = "Item Group Name",
  String sortDir = "desc",
}) async {
  final accessToken = await getTokenData();

  final url = Uri.parse('$baseURL$salesRegisterItemGroupWiseUrl');

  final Map<String, dynamic> bodyData = {
    "page": page,
    "size": size,
    "sortBy": sortBy,
    "sortDir": sortDir,
    "search": searchData
  };

  try {
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
      body: json.encode(bodyData),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return SalesItemGroupwisemodel.fromJson(data);
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    throw Exception('Failed to load data');
  }
}

//HSN Code Wise Sales Register Data
final salesRegisterHSNCodeProvider =
    FutureProvider.family((ref, String searchItem) async {
  return await fetchSalesRegisterHSNCodeData(searchData: searchItem);
});

Future<SalesHSNCodewisemodel> fetchSalesRegisterHSNCodeData({
  required String searchData,
  int page = 0,
  int size = 100,
  String sortBy = "HSN Code",
  String sortDir = "desc",
}) async {
  final accessToken = await getTokenData();

  final url = Uri.parse('$baseURL$salesRegisterHSNCodeWiseUrl');

  final Map<String, dynamic> bodyData = {
    "page": page,
    "size": size,
    "sortBy": sortBy,
    "sortDir": sortDir,
    "search": searchData
  };

  try {
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
      body: json.encode(bodyData),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return SalesHSNCodewisemodel.fromJson(data);
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    throw Exception('Failed to load data');
  }
}

// Sales Graph Data
final salesGraphProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  return await fetchSalesGraphData();
});

Future<Map<String, dynamic>> fetchSalesGraphData() async {
  final accessToken = await getTokenData();

  final url = Uri.parse('$baseURL$salesGraphurl');

  final Map<String, dynamic> bodyData = {"durationInMonths": 6};

  try {
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
      body: json.encode(bodyData),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error fetching data: $e');
  }
}
