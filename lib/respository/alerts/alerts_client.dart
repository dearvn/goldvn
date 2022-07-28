//import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:giavang/helpers/http_helper.dart';
import 'package:giavang/models/alerts/alerts.dart';
import 'package:giavang/models/alerts/single_alert_model.dart';

class AlertsClient extends FetchClient {
  Future<AlertsDataModel> fetchAlerts(String symbol) async {

    final Uri uri = Uri.https('trade.snagprofit.com', '/api/alert/orders', {
      //'symbol': '"$symbol"'
    });

    var headers = Map<String, String>();
    
    headers['Content-Type'] = 'application/json';
    Dio dio = Dio();
    dio.options.headers.addAll(headers);

    final Response<dynamic> alertsResponse = await dio.getUri(uri);

    print(">>>>>>>>");
    print(alertsResponse.data['data']);
    print(">>>>>>>>");

    final List<SingleAlertModel> alerts = SingleAlertModel.toList(alertsResponse.data["data"]);

    return AlertsDataModel(
      alerts: alerts
    );
  }
}