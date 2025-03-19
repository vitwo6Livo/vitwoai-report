import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vitwoai_report/src/utils/api_urls.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//All Sales Register Data
final salesRegisterProvider = FutureProvider((ref) async {
  return await fetchSalesRegisterData();
});

Future<Map<String, dynamic>> fetchSalesRegisterData() async {
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
    "filter": [],
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
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    throw Exception('Failed to load data');
  }
}

//SO Wise Sales Register Data
final salesRegisterSOProvider = FutureProvider((ref) async {
  return await fetchSalesRegisterSOData();
});

Future<Map<String, dynamic>> fetchSalesRegisterSOData() async {
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
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
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

Future<Map<String, dynamic>> fetchSalesRegisterCustomerData() async {
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
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
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

Future<Map<String, dynamic>> fetchSalesRegisterItemData() async {
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
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
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

Future<Map<String, dynamic>> fetchSalesRegisterItemGroupData() async {
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
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
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

Future<Map<String, dynamic>> fetchSalesRegisterHSNCodeData() async {
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
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    throw Exception('Failed to load data');
  }
}
