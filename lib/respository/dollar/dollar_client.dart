//import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:giavang/helpers/http_helper.dart';
//import 'package:giavang/keys/api_keys.dart';
import 'package:giavang/models/dollar/dollar.dart';
import 'package:giavang/models/dollar/single_dollar_model.dart';

class DollarClient extends FetchClient {
  final FlutterSecureStorage storage = new FlutterSecureStorage();
  Future<DollarDataModel> fetchDollar(String symbol) async {

    final Uri uri = Uri.https('mihong.vn', '/api/v1/dollar/prices/current');

    var headers = Map<String, String>();
    headers['Content-Type'] = 'application/json';
    Dio dio = Dio();
    dio.options.headers.addAll(headers);

    final Response<dynamic> dollarResponse = await dio.getUri(uri);
print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
print(dollarResponse);
print("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    final List<SingleDollarModel> datas = SingleDollarModel.toList(dollarResponse.data);

    return DollarDataModel(
      datas: datas
    );
  }
}