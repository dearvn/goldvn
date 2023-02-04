//import 'dart:convert';

import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:giavang/helpers/http_helper.dart';
import 'package:giavang/models/gold/gold.dart';
import 'package:giavang/models/gold/single_gold_model.dart';

class GoldClient extends FetchClient {
  Future<GoldDataModel> fetchGold(String symbol) async {
    final Uri uri = Uri.https('mihong.vn', '/api/v1/gold/prices/current');
    var headers = Map<String, String>();
    headers['Content-Type'] = 'application/json';
    Dio dio = Dio();
    dio.options.headers.addAll(headers);
    final Response<dynamic> goldResponse = await dio.getUri(uri);

    var data = goldResponse.data['data'];

    final Uri uriW =
        Uri.https('mihong.vn', '/api/v1/gold/prices/world/current');
    final Response<dynamic> goldWResponse = await dio.getUri(uriW);
    var dataWs = goldWResponse.data['data'];
    var dataW = dataWs[0];

    var item = {
      "buyingPrice": dataW['buyingPrice'],
      "sellingPrice": dataW['sellingPrice'],
      "code": "USD/OZ",
      "sellChange": dataW['sellChange'],
      "sellChangePercent": 0,
      "buyChange": dataW['buyChange'],
      "buyChangePercent": 0,
      "dateTime": dataW['dateTime']
    };
    data.add(item);

    final List<SingleGoldModel> datas = SingleGoldModel.toList(data);

    return GoldDataModel(datas: datas);
  }
}
