//import 'package:meta/meta.dart';
import 'package:giavang/models/alerts/single_alert_model.dart';

class AlertsDataModel {

  final String keyWord;
  final String page;
  final String symbol;
  final String fromDate;
  final String toDate;
  final String fromPrice;
  final String toPrice;
  final String status;
  
  final List<SingleAlertModel> alerts;

  AlertsDataModel({
    this.keyWord,
    this.page,
    this.symbol,
    this.fromDate,
    this.toDate,
    this.fromPrice,
    this.toPrice,
    this.status,
    this.alerts
  });
   
}