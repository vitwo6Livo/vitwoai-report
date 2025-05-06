import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitwoai_report/src/utils/api_urls.dart';
import 'package:http/http.dart' as http;

// tranding products data fatch
final trandingProductProvider = FutureProvider((ref) async {
  return await fetchtrandingProductData();
});

Future<Map<String, dynamic>> fetchtrandingProductData() async {
  final accessToken = await getTokenData();
  final url = Uri.parse('$baseURL$trandingProducturl');

  try {
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
      'User-Agent': 'Mobile'
    });

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error fetching data: $e');
  }
}

// tranding region data fatch

final trandingRegionProvider = FutureProvider((ref) async {
  return await fetchtrandingRegionData();
});

Future<Map<String, dynamic>> fetchtrandingRegionData() async {
  final accessToken = await getTokenData();
  final url = Uri.parse('$baseURL$trandingRegionurl');

  try {
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
      'User-Agent': 'Mobile'
    });

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error fetching data: $e');
  }
}

// total Sales Api fatch Data

final totalSalesProvider = FutureProvider((ref) async {
  return await fetchTotalSalesData();
});

Future<Map<String, dynamic>> fetchTotalSalesData() async {
  final accessToken = await getTokenData();
  final url = Uri.parse('$baseURL$totalSalesurl');

  try {
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
      'User-Agent': 'Mobile'
    });

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error fetching data: $e');
  }
}

// total Purches Api fatch Data
final totalPurchesProvider = FutureProvider((ref) async {
  return await fetchTotalPurchesData();
});

Future<Map<String, dynamic>> fetchTotalPurchesData() async {
  final accessToken = await getTokenData();
  final url = Uri.parse('$baseURL$totalPurchesUrl');

  try {
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
      'User-Agent': 'Mobile'
    });

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error fetching data: $e');
  }
}
