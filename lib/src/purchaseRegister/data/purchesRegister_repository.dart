import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vitwoai_report/src/purchaseRegister/model/HsnCodeModel.dart';
import 'package:vitwoai_report/src/purchaseRegister/model/ItemGroupWiseModel.dart';
import 'package:vitwoai_report/src/purchaseRegister/model/ItemWiseModel.dart';
import 'package:vitwoai_report/src/purchaseRegister/model/POModel.dart';
import 'package:vitwoai_report/src/purchaseRegister/model/PRSummaryModel.dart';
import 'package:vitwoai_report/src/purchaseRegister/model/purchaseModel.dart';
import 'package:vitwoai_report/src/purchaseRegister/model/vendorWiseModal.dart';
import 'package:vitwoai_report/src/utils/api_urls.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final purchesRegisterProvider =
    FutureProvider.family<AllPurchasemodel, int>((ref, page) async {
  return await fetchPurchesRegisterData(page);
});

Future<AllPurchasemodel> fetchPurchesRegisterData(int pagedata) async {
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
    "page": pagedata,
    "size": 10,
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
      final data = json.decode(response.body);
      return AllPurchasemodel.fromJson(data);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error fetching data: $e');
  }
}

//PO Wise Data Api Call
final purchesRegisterPoWiseProvider =
    FutureProvider.family<Pomodel, int>((ref, page) async {
  return await fetchPurchesRegisterPoWiseData(page);
});

Future<Pomodel> fetchPurchesRegisterPoWiseData(int page) async {
  final accessToken = await getTokenData();

  final url = Uri.parse('$baseURL$purchaseRegisterPOWiseUrl');

  final Map<String, dynamic> bodyData = {
    "page": page,
    "size": 20,
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
      final data = json.decode(response.body);
      return Pomodel.fromJson(data);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error fetching data: $e');
  }
}

// Vendor wise Data Api Call

final purchesRegisterVendorWiseProvider =
    FutureProvider.family<Vendorwisemodal, int>((ref, page) async {
  return await fetchPurchesRegisterVendorWiseData(page);
});

Future<Vendorwisemodal> fetchPurchesRegisterVendorWiseData(int pagedata) async {
  final accessToken = await getTokenData();

  final url = Uri.parse('$baseURL$purchaseRegisterVendorWiseUrl');

  final Map<String, dynamic> bodyData = {
    "page": pagedata,
    "size": 10,
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
      final data = json.decode(response.body);
      return Vendorwisemodal.fromJson(data);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error fetching data: $e');
  }
}

// Item Wise Data Api Call

final purchesRegisterItemWiseProvider =
    FutureProvider.family<Itemwisemodel, int>((ref, page) async {
  return await fetchPurchesRegisterItemWiseData(page);
});

Future<Itemwisemodel> fetchPurchesRegisterItemWiseData(int pageData) async {
  final accessToken = await getTokenData();

  final url = Uri.parse('$baseURL$purchaseRegisterItemWiseUrl');

  final Map<String, dynamic> bodyData = {
    "page": pageData,
    "size": 10,
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
      final data = json.decode(response.body);
      return Itemwisemodel.fromJson(data);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error fetching data: $e');
  }
}

// Item Group Wise Data Api Call

final purchesRegisterItemGroupWiseProvider =
    FutureProvider.family<ItemGroupwisemodel, int>((ref, page) async {
  return await fetchPurchesRegisterItemGroupWiseData(page);
});

Future<ItemGroupwisemodel> fetchPurchesRegisterItemGroupWiseData(
    int pageData) async {
  final accessToken = await getTokenData();

  final url = Uri.parse('$baseURL$purchaseRegisterItemGroupWiseUrl');

  final Map<String, dynamic> bodyData = {
    "page": pageData,
    "size": 10,
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
      final data = json.decode(response.body);
      return ItemGroupwisemodel.fromJson(data);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error fetching data: $e');
  }
}

// HSN Code Wise Api Data

final purchesRegisterHsnCodeWiseProvider =
    FutureProvider.family<Hsncodemodel, int>((ref, page) async {
  return await fetchPurchesRegisterHsnCodeWiseData(page);
});

Future<Hsncodemodel> fetchPurchesRegisterHsnCodeWiseData(int pageData) async {
  final accessToken = await getTokenData();

  final url = Uri.parse('$baseURL$purchaseRegisterHSNCodeWiseUrl');

  final Map<String, dynamic> bodyData = {
    "page": pageData,
    "size": 10,
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
      final data = json.decode(response.body);
      return Hsncodemodel.fromJson(data);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error fetching data: $e');
  }
}

// Summary Api Call Data

final purchesRegisterSummaryProvider =
    FutureProvider.family<PrSummaryModel, String>((ref, typeData) async {
  return await fetchPurchesRegisterSummaryData(typeData);
});

Future<PrSummaryModel> fetchPurchesRegisterSummaryData(
    String typeDefine) async {
  final accessToken = await getTokenData();

  final url = Uri.parse('$baseURL$purchaseRegisterSummaryUrl');

  final Map<String, dynamic> bodyData = {"type": typeDefine};

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
      final SummaryData = json.decode(response.body);
      return PrSummaryModel.fromMap(SummaryData);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error fetching data: $e');
  }
}
