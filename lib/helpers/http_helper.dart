//import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:giavang/keys/api_keys.dart';

class FetchClient {
  Future<Response> fetchData({Uri uri}) async {
    return await Dio().getUri(uri);
  }

  Future<Response> post({Uri uri, Map<String, dynamic> data}) async {
    return await Dio().postUri(uri, data: data);
  }

  // Makes an HTTP request to any endpoint from Financial Modeling Prep API.
  Future<Response> financialModelRequest(String endpoint ) async {
    final Uri uri = Uri.https('financialmodelingprep.com', endpoint, {
      'apikey': kFinancialModelingPrepApi
    });
    
    return await Dio().getUri(uri);
  }

  // Makes an HTTP request to any endpoint from Financial Modeling Prep API.
  Future<Response> fetchDataOptions(String endpoint, String interval, String expirationDate, String strikePrice) async {
    final Uri uri = Uri.https('trade.snagprofit.com', endpoint, {
      'interval': interval,
      'expiration_date': expirationDate,
      'strike_price': strikePrice
    });

    var headers = Map<String, String>();
    headers['Authorization'] = 'Bearer ' + kSnagProfitKey;
    headers['Content-Type'] = 'application/json';
    Dio dio = Dio();
    dio.options.headers.addAll(headers);

    return await dio.getUri(uri);
  }
}
