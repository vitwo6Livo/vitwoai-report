import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitwoai_report/src/login/data/logiModel.dart';
import 'package:vitwoai_report/src/routes/routeNames.dart';
import 'package:vitwoai_report/src/utils/api_urls.dart';
import 'package:flutter/material.dart';

class ApiService {
  final String apiUrl = '$baseURL$loginUrl';

  Future<ApiResponse> postData(
    Map<String, dynamic> bodyData,
    BuildContext context,
  ) async {
    final prefs = await SharedPreferences.getInstance();

    try {
      final headers = {
        "Content-Type": "application/json",
        "username": bodyData["username"].toString(),
        "password": bodyData["password"].toString(),
        "User-Agent": "Mobile"
      };

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: jsonEncode(bodyData),
      );

      print("Response status code: ${response.statusCode}");

      if (response.statusCode == 200) {
        prefs.setString('response_data', response.body);
        print("Stored Response Data: ${prefs.getString('response_data')}");

        Navigator.pushNamed(context, RouteNames.bottomnav);
        return ApiResponse.fromJson(jsonDecode(response.body));
      } else {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid username or password')),
        );
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Something went wrong. Try again.')),
      );
      throw Exception('Failed to load data: $e');
    }
  }
}
