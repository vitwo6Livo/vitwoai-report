// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// final apiProvider = FutureProvider<Map<String, dynamic>>((ref) async {
//   final url =
//       Uri.parse('http://192.168.0.250:81/purchase/purchase-groupby-data');

//   const token =
//       'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJ2aXR3by5haSIsImF1ZCI6InZpdHdvLmFpIiwiaWF0IjoxNzM2NDE2MzYxLCJuYmYiOjE3MzY0MTYzNjEsImV4cCI6MTczNjQ0NTE2MSwiZGF0YSI6eyJjb21wYW55X2lkIjo1LCJicmFuY2hfaWQiOjUsImxvY2F0aW9uX2lkIjo1LCJjcmVhdGVkX2J5IjoiMjV8YnJhbmNoIiwidXBkYXRlZF9ieSI6IjI1fGJyYW5jaCIsImF1dGhVc2VySWQiOjI2LCJhdXRoVXNlck5hbWUiOiJBYmhpbGFzaCBBZ2Fyd2FsIiwiYXV0aFVzZXJFbWFpbCI6ImFiaGlsYXNoQHZpdHdvLmluIiwiYXV0aFVzZXJWYXJpYW50IjowLCJhdXRoVXNlclJvbGUiOjIsImF1dGhVc2VyVHlwZSI6ImxvY2F0aW9uIiwiY29tcGFueUN1cnJlbmN5IjoyLCJjb21wT3BlbmluZ0RhdGUiOiIyMDIzLTA0LTAxIiwiaXNQb0VuYWJsZWQiOjAsImNvbXBhbnlOYW1lIjoiNiBMaXZvIFRlY2hub2xvZ2llcyBQdnQgTHRkIiwiY29tcGFueUNvZGUiOiI5MjMxMDA1IiwiY29tcGFueVBBTiI6IkFBQkNaMDAzOE0iLCJjb21wYW55Q09CIjoiUHZ0IEx0ZCIsImJyYW5jaE5hbWUiOiJXZXN0IEJlbmdhbCIsImJyYW5jaENvZGUiOiI4MjMxMTAxIiwiYnJhbmNoR3N0aW4iOiIxOUFBQkNaMDAzOE0xWjIiLCJsb2NhdGlvbk5hbWUiOiJLb2xrYXRhIiwibG9jYXRpb25Db2RlIjoiNzIzMTEwMSIsImxvY2F0aW9uQ2l0eSI6IktvbGthdGEiLCJkZWNpbWFsUGxhY2VzIjoyfX0.7PFUxjYZcmTJZ7iuXQoz7NKCwVK-IKJDfDdn55gkTPo';

//   const requestBody = {
//     "data": [
//       "items.goodName",
//       "items.goodCode",
//       "SUM(items.goodQty)",
//       "SUM(items.receivedQty)",
//       "SUM(items.totalAmount)",
//       "grnCreatedAt",
//       "SUM(grnInvoice.grnTotalTds)",
//       "SUM(grnInvoice.grnTotalSgst)",
//       "SUM(grnInvoice.grnTotalIgst)",
//       "grnCreatedBy",
//       "grnCode",
//       "dueDate",
//       "grnUpdatedAt",
//       "grnUpdatedBy",
//       "SUM(grnInvoice.grnTotalCgst)",
//       "SUM(items.unitPrice)",
//       "items.goodsItems.stockSummary.movingWeightedPrice"
//     ],
//     "groupBy": ["items.goodName"],
//     "filter": [],
//     "page": 0,
//     "size": 50,
//     "sortDir": "asc",
//     "sortBy": "grnCreatedAt"
//   };

//   final headers = {
//     'Content-Type': 'application/json',
//     'Authorization': 'Bearer $token',
//   };

//   final response = await http.post(
//     url,
//     headers: headers,
//     body: json.encode(requestBody),
//   );

//   if (response.statusCode == 200) {
//     return json.decode(response.body) as Map<String, dynamic>;
//   } else {
//     throw Exception('Failed to load data: ${response.statusCode}');
//   }
// });
