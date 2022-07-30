import 'package:dio/dio.dart';

import 'package:giavang/helpers/http_helper.dart';
import 'package:giavang/models/dollar/dollar.dart';
import 'package:giavang/models/dollar/single_dollar_model.dart';

class DollarClient extends FetchClient {
  Future<DollarDataModel> fetchDollar(String symbol) async {
    final Uri uri = Uri.https('mihong.vn', '/api/v1/currency/current');

    var headers = Map<String, String>();
    headers['Content-Type'] = 'application/json';
    Dio dio = Dio();
    dio.options.headers.addAll(headers);

    final Response<dynamic> dollarResponse = await dio.getUri(uri);
    final List<SingleDollarModel> datas =
        SingleDollarModel.toList(dollarResponse.data['data']);

    return DollarDataModel(datas: datas);
  }
}
