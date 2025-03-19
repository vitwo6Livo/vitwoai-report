import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:vitwoai_report/src/utils/api_urls.dart';

final receivablesTotalDueProvider = FutureProvider((ref) async {
  return await fetchReceivablesData();
});

// Total Value of Total Due, On account due, Net Due
Future<Map<String, dynamic>> fetchReceivablesData() async {
  final token = await getTokenData();
  final url = Uri.parse('$baseURL$receivablTotalDueurl');

  final Map<String, dynamic> bodyData = {
    'asOnDate': '2025-02-24',
  };

  try {
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
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

//List of Receivable Customer Api Fatch

final receivablesCustomerProvider = FutureProvider((ref) async {
  return await fetchReceivablesCustomerData();
});

Future<Map<String, dynamic>> fetchReceivablesCustomerData() async {
  final accessToken = await getTokenData();
  final url = Uri.parse('$baseURL$receivablCustomerurl');

  final Map<String, dynamic> bodyData = {
    "interval": 30,
    "bucketNo": 7,
    "asOnDate": "2024-11-13",
    "page": 0,
    "size": 500,
    "sortBy": "on_account_due",
    "sortDir": "desc"
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
