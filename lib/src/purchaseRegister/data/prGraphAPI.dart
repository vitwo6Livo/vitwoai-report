// Graph - All
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:vitwoai_report/src/purchaseRegister/model/prGraphAllModel.dart';
import 'package:vitwoai_report/src/purchaseRegister/model/prGraphHSNModel.dart';
import 'package:vitwoai_report/src/purchaseRegister/model/prGraphItemGRModel.dart';
import 'package:vitwoai_report/src/purchaseRegister/model/prGraphItemModel.dart';
import 'package:vitwoai_report/src/purchaseRegister/model/prGraphVendorModel.dart';
import 'package:vitwoai_report/src/utils/api_urls.dart';

final prGraphAllProvider = FutureProvider<PrGraphAllModel>((ref) async {
  return await fetchPRGraphAllData();
});

Future<PrGraphAllModel> fetchPRGraphAllData() async {
  final accessToken = await getTokenData();

  final url = Uri.parse('$baseURL$purchaseRegisterGraphAll');
  try {
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      return PrGraphAllModel.fromJson(data);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error fetching data: $e');
  }
}

// Graph - Vendor

final prGraphVendorProvider = FutureProvider<PrGraphVendorModel>((ref) async {
  return await fetchPRGraphVendorData();
});

Future<PrGraphVendorModel> fetchPRGraphVendorData() async {
  final accessToken = await getTokenData();

  final url = Uri.parse('$baseURL$purchaseRegisterGraphVendor');
  try {
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      return PrGraphVendorModel.fromJson(data);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error fetching data: $e');
  }
}

// Graph - Item

final prGraphItemProvider = FutureProvider<PrGraphItemModel>((ref) async {
  return await fetchPRGraphItemData();
});

Future<PrGraphItemModel> fetchPRGraphItemData() async {
  final accessToken = await getTokenData();

  final url = Uri.parse('$baseURL$purchaseRegisterGraphItem');
  try {
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      return PrGraphItemModel.fromJson(data);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error fetching data: $e');
  }
}

// Graph - Item Group

final prGraphItemGRProvider = FutureProvider<PrGraphItemGRModel>((ref) async {
  return await fetchPRGraphItemGRData();
});

Future<PrGraphItemGRModel> fetchPRGraphItemGRData() async {
  final accessToken = await getTokenData();

  final url = Uri.parse('$baseURL$purchaseRegisterGraphItemGR');
  try {
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      return PrGraphItemGRModel.fromJson(data);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error fetching data: $e');
  }
}

// Graph - HSN

final prGraphHSNProvider = FutureProvider<PrGraphHSNModel>((ref) async {
  return await fetchPRGraphHSNData();
});

Future<PrGraphHSNModel> fetchPRGraphHSNData() async {
  final accessToken = await getTokenData();

  final url = Uri.parse('$baseURL$purchaseRegisterGraphHSN');
  try {
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      return PrGraphHSNModel.fromJson(data);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error fetching data: $e');
  }
}
