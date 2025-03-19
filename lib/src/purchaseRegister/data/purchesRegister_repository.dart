import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vitwoai_report/src/utils/api_urls.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final purchesRegisterProvider = FutureProvider((ref) async {
  return await fetchPurchesRegisterData();
});

Future<Map<String, dynamic>> fetchPurchesRegisterData() async {
  final accessToken = await getTokenData();

  final url = Uri.parse('$baseURL$purchaseRegisterAllListUrl');

  final Map<String, dynamic> bodyData = {
    "data": [
      "grn.po.po_number",
      "grn.po.po_date",
      "grnSubTotal", // Base value
      "grnTotalCgst",
      "grnTotalSgst",
      "grnTotalIgst",
      "grnTotalTds",
      "grnTotalAmount", // Invoice value
      "grn.vendors.vendor_code",
      "grn.vendors.trade_name",
      "grnInvoiceItems.goodCode",
      "grnInvoiceItems.items.itemName",
      "grnInvoiceItems.goodHsn",
      "grnInvoiceItems.items.baseUom.uomName", // base
      "grnInvoiceItems.items.alternateUom.uomName", // alternate
      "grnInvoiceItems.receivedQty",
      "grnInvoiceItems.goodQty",
      "grnInvoiceItems.items.goodsGroup.goodGroupName",
      "grn.po.poItems.qty", // PO quantity
      "grn.po.totalAmount", // PO gross value
      "grn.po.subtotal", // Po net value
      "grnIvCode", // grn iv code
      "postingDate", // grn iv posting date
      "vendorDocumentNo",
      "vendorDocumentDate"
    ],
    "groupBy": [],
    "filter": [],
    "page": 0,
    "size": 500,
    "sortBy": "grn.vendors.vendor_code",
    "sortDir": "asc"
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
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error fetching data: $e');
  }
}

//PO Wise Data Api Call
final purchesRegisterPoWiseProvider = FutureProvider((ref) async {
  return await fetchPurchesRegisterPoWiseData();
});

Future<Map<String, dynamic>> fetchPurchesRegisterPoWiseData() async {
  final accessToken = await getTokenData();

  final url = Uri.parse('$baseURL$purchaseRegisterPOWiseUrl');

  final Map<String, dynamic> bodyData = {
    "page": 0,
    "size": 100,
    "sortBy": "PO Date",
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
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error fetching data: $e');
  }
}

// Vendor wise Data Api Call

final purchesRegisterVendorWiseProvider = FutureProvider((ref) async {
  return await fetchPurchesRegisterVendorWiseData();
});

Future<Map<String, dynamic>> fetchPurchesRegisterVendorWiseData() async {
  final accessToken = await getTokenData();

  final url = Uri.parse('$baseURL$purchaseRegisterVendorWiseUrl');

  final Map<String, dynamic> bodyData = {
    "page": 0,
    "size": 100,
    "sortBy": "Vendor Name",
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
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error fetching data: $e');
  }
}

// Item Wise Data Api Call

final purchesRegisterItemWiseProvider = FutureProvider((ref) async {
  return await fetchPurchesRegisterItemWiseData();
});

Future<Map<String, dynamic>> fetchPurchesRegisterItemWiseData() async {
  final accessToken = await getTokenData();

  final url = Uri.parse('$baseURL$purchaseRegisterItemWiseUrl');

  final Map<String, dynamic> bodyData = {
    "page": 0,
    "size": 100,
    "sortBy": "Item Code",
    "sortDir": "asc",
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
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error fetching data: $e');
  }
}

// Item Group Wise Data Api Call

final purchesRegisterItemGroupWiseProvider = FutureProvider((ref) async {
  return await fetchPurchesRegisterItemGroupWiseData();
});

Future<Map<String, dynamic>> fetchPurchesRegisterItemGroupWiseData() async {
  final accessToken = await getTokenData();

  final url = Uri.parse('$baseURL$purchaseRegisterItemGroupWiseUrl');

  final Map<String, dynamic> bodyData = {
    "page": 0,
    "size": 100,
    "sortBy": "Item Group",
    "sortDir": "asc",
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
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error fetching data: $e');
  }
}

// HSN Code Wise Api Data

final purchesRegisterHsnCodeWiseProvider = FutureProvider((ref) async {
  return await fetchPurchesRegisterHsnCodeWiseData();
});

Future<Map<String, dynamic>> fetchPurchesRegisterHsnCodeWiseData() async {
  final accessToken = await getTokenData();

  final url = Uri.parse('$baseURL$purchaseRegisterHSNCodeWiseUrl');

  final Map<String, dynamic> bodyData = {
    "page": 0,
    "size": 100,
    "sortBy": "HSN Code",
    "sortDir": "asc",
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
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error fetching data: $e');
  }
}
