//import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:giavang/helpers/http_helper.dart';
//import 'package:giavang/keys/api_keys.dart';
import 'package:giavang/models/gold/gold.dart';
import 'package:giavang/models/gold/single_gold_model.dart';

class GoldClient extends FetchClient {
  final FlutterSecureStorage storage = new FlutterSecureStorage();
  Future<GoldDataModel> fetchGold(String symbol) async {

    final Uri uri = Uri.https('mihong.vn', '/api/v1/gold/prices/current');

    var headers = Map<String, String>();
    headers['Content-Type'] = 'application/json';
    Dio dio = Dio();
    dio.options.headers.addAll(headers);

    final Response<dynamic> goldResponse = await dio.getUri(uri);
print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
print(goldResponse);
print("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    final List<SingleGoldModel> datas = SingleGoldModel.toList(goldResponse.data);

    return GoldDataModel(
      datas: datas
    );
  }
}