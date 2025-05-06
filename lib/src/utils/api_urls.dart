import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

const baseURL = 'http://192.168.0.250:81/';

// const baseURL = 'https://www.analytic.vitwo.ai/'; // Live URL

// const baseURL = 'http://192.168.0.102:81/';

Future<String?> getTokenData() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final String? responseData = sharedPreferences.getString('response_data');

  if (responseData == null) {
    throw Exception('No response data found in SharedPreferences');
  }

  final Map<String, dynamic> decodedResponseData = json.decode(responseData);

  final String? accessToken = decodedResponseData['accesstoken'];
  if (accessToken == null) {
    throw Exception('No access token found');
  }

  return accessToken;
}

const loginUrl = 'user/login';
const receivablCustomerurl = 'receivable/customer';
const payableCustomerurl = 'payable/vendor';
const receivablTotalDueurl = 'receivable/all-total-dues';
const purchaseRegisterAllListUrl = 'purchase/purchase-groupby-data';
const purchaseRegisterPOWiseUrl = 'purchase/po-sub-total';
const purchaseRegisterVendorWiseUrl = 'purchase/vendor-sub-total';
const purchaseRegisterItemWiseUrl = 'purchase/item-sub-total';
const purchaseRegisterItemGroupWiseUrl = 'purchase/item-gr-sub-total';
const purchaseRegisterHSNCodeWiseUrl = 'purchase/hsn-sub-total';
const salesRegisterAllListUrl = 'sales/sales-groupby-data';
const salesRegisterSOWiseUrl = 'sales/so-sub-total';
const salesRegisterCustomerWiseUrl = 'sales/customer-sub-total';
const salesRegisterItemWiseUrl = 'sales/item-sub-total';
const salesRegisterItemGroupWiseUrl = 'sales/item-gr-sub-total';
const salesRegisterHSNCodeWiseUrl = 'sales/hsn-sub-total';
const trandingProducturl = 'sales/product-desc';
const trandingRegionurl = 'sales/region-desc';
const salesGraphurl = 'sales/graph/mobile-sales-graph';
const purchaseRegisterSummaryUrl = 'purchase/all-purchase-summary';
const purchaseRegisterGraphAll = 'purchase/all-part-graph';
const salesRegisterSummaryUrl = 'sales/all-sales-summary';
const totalSalesurl = 'sales/total-sales';
const totalPurchesUrl = 'purchase/total-purchase';
