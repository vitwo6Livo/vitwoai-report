import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:vitwoai_report/src/ageing/model/receivableModel.dart';
import 'package:vitwoai_report/src/ageing/model/receivableTotalModel.dart';
import 'package:vitwoai_report/src/utils/api_urls.dart';

final receivablesTotalDueProvider =
    FutureProvider.family<Total, String>((ref, dateData) async {
  return await fetchReceivablesData(dateData);
});

// Total Value of Total Due, On account due, Net Due
Future<Total> fetchReceivablesData(String dateInfo) async {
  final token = await getTokenData();
  final url = Uri.parse('$baseURL$receivablTotalDueurl');

  final Map<String, dynamic> bodyData = {
    'asOnDate': dateInfo,
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
      final data = json.decode(response.body);
      return Total.fromJson(data);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error fetching data: $e');
  }
}

//List of Receivable Customer Api Fatch

final receivablesCustomerProvider =
    FutureProvider.family<ReceivableAPIModel, Map<String, dynamic>>(
  (ref, params) async {
    final page = params['page'] as int;
    final dateInfo = params['dateInfo'] as DateTime;
    final searchData = params['searchData'] as String;
    return await fetchReceivablesCustomerData(page, dateInfo, searchData, ref);
  },
);

final totalElementsProvider = StateProvider<int?>((ref) => null);

Future<ReceivableAPIModel> fetchReceivablesCustomerData(
    int page, DateTime dateData, String searchInfo, ref) async {
  final accessToken = await getTokenData();
  final url = Uri.parse('$baseURL$receivablCustomerurl');

  final Map<String, dynamic> bodyData = {
    "interval": 30,
    "bucketNo": 7,
    "asOnDate": dateData.toString(),
    "page": page,
    "size": 10,
    "sortBy": "",
    "sortDir": "",
    "searchKey": searchInfo
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
      print('📦 Full API response: ${data['content']}');
      ref.read(totalElementsProvider.notifier).state = data['totalElements'];
      return ReceivableAPIModel.fromJson(data);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error fetching data: $e');
  }
}

//List of Payable Customer Api Data

final payableCustomerProvider = FutureProvider((ref) async {
  return await fetchPayableCustomerData();
});

Future<Map<String, dynamic>> fetchPayableCustomerData() async {
  final accessToken = await getTokenData();
  final url = Uri.parse('$baseURL$payableCustomerurl');

  final Map<String, dynamic> bodyData = {
    "interval": 30,
    "bucketNo": 6,
    "asOnDate": "2024-11-13",
    "page": 0,
    "size": 500,
    "sortBy": "total_onaccount",
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
