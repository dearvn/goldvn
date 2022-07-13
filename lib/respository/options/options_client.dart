//import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:giavang/helpers/http_helper.dart';
import 'package:giavang/keys/api_keys.dart';
import 'package:giavang/models/options/options.dart';
import 'package:giavang/models/options/single_option_model.dart';

class OptionsClient extends FetchClient {
  final FlutterSecureStorage storage = new FlutterSecureStorage();
  Future<OptionsDataModel> fetchOptions(String symbol) async {

    final Uri optionsUri = Uri.https('trade.snagprofit.com', '/api/option/SPY/options', {
      'interval': '5',
      'expiration_date': '2022-06-03'
    });

    var headers = Map<String, String>();
    var token = kSnagProfitKey;//await storage.read(key: 'token');
    
    headers['Authorization'] = 'Bearer ' + token;
    headers['Content-Type'] = 'application/json';
    Dio dio = Dio();
    dio.options.headers.addAll(headers);

    final Response<dynamic> optionsResponse = await dio.getUri(optionsUri);

    final List<SingleOptionModel> options = SingleOptionModel.toList(optionsResponse.data);

    return OptionsDataModel(
      options: options
    );
  }
}