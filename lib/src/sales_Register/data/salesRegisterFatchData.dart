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
final allDetailsSearch = FutureProvider.family((ref, String key) async {
  return await getSearchData(key);
});

Future<SalesAllDetailsmodel> getSearchData(String searchKey) async {
  final Map<String, dynamic> apiData = {
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
      "items.qty", // Invoice quantity
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
    "size": 50,
    "sortBy": "customer.trade_name",
    "sortDir": "asc"
  };

  final token = await getTokenData();
  final url = Uri.parse('$baseURL$salesRegisterAllListUrl');

  try {
    final response = await http.post(url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: json.encode(apiData));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return SalesAllDetailsmodel.fromJson(data);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Failed to load data');
  }
}

//SO Wise Sales Register Data
final salesRegisterSOProvider = FutureProvider((ref) async {
  return await fetchSalesRegisterSOData();
});

Future<SalesSOwisemodel> fetchSalesRegisterSOData() async {
  final accessToken = await getTokenData();

  final url = Uri.parse('$baseURL$salesRegisterSOWiseUrl');

  final Map<String, dynamic> bodyData = {
    "page": 0,
    "size": 100,
    "sortBy": "Invoice Value",
    "sortDir": "desc",
    "search": ""
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
      throw Exception('Failed to load data');
    }
  } catch (e) {
    throw Exception('Failed to load data');
  }
}

//Customer Wise Sales Register Data
final salesRegisterCustomerProvider = FutureProvider((ref) async {
  return await fetchSalesRegisterCustomerData();
});

Future<SalesCustomerwisemodel> fetchSalesRegisterCustomerData() async {
  final accessToken = await getTokenData();

  final url = Uri.parse('$baseURL$salesRegisterCustomerWiseUrl');

  final Map<String, dynamic> bodyData = {
    "page": 0,
    "size": 100,
    "sortBy": "Customer Name",
    "sortDir": "desc",
    "search": ""
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
final salesRegisterItemProvider = FutureProvider((ref) async {
  return await fetchSalesRegisterItemData();
});

Future<Salesitemwisemodel> fetchSalesRegisterItemData() async {
  final accessToken = await getTokenData();

  final url = Uri.parse('$baseURL$salesRegisterItemWiseUrl');

  final Map<String, dynamic> bodyData = {
    "page": 0,
    "size": 100,
    "sortBy": "Invoice Value",
    "sortDir": "desc",
    "search": ""
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
final salesRegisterItemGroupProvider = FutureProvider((ref) async {
  return await fetchSalesRegisterItemGroupData();
});

Future<SalesItemGroupwisemodel> fetchSalesRegisterItemGroupData() async {
  final accessToken = await getTokenData();

  final url = Uri.parse('$baseURL$salesRegisterItemGroupWiseUrl');

  final Map<String, dynamic> bodyData = {
    "page": 0,
    "size": 100,
    "sortBy": "Item Group Name",
    "sortDir": "desc",
    "search": ""
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
final salesRegisterHSNCodeProvider = FutureProvider((ref) async {
  return await fetchSalesRegisterHSNCodeData();
});

Future<SalesHSNCodewisemodel> fetchSalesRegisterHSNCodeData() async {
  final accessToken = await getTokenData();

  final url = Uri.parse('$baseURL$salesRegisterHSNCodeWiseUrl');

  final Map<String, dynamic> bodyData = {
    "page": 0,
    "size": 100,
    "sortBy": "HSN Code",
    "sortDir": "desc",
    "search": ""
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
