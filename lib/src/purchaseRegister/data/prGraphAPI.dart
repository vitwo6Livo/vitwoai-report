// Graph - All
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:vitwoai_report/src/purchaseRegister/model/prGraphAllModel.dart';
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
      final  data = json.decode(response.body);

      return  PrGraphAllModel.fromJson(data);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error fetching data: $e');
  }
}
