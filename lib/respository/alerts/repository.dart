
import 'package:giavang/models/alerts/alerts.dart';
import 'package:giavang/respository/alerts/alerts_client.dart';

class AlertsRepository extends AlertsClient {
  
  Future<AlertsDataModel> fetchAlerts(String symbol) async {
    return await super.fetchAlerts(symbol);
  }

}