
import 'package:giavang/models/dollar/dollar.dart';
import 'package:giavang/respository/dollar/dollar_client.dart';

class DollarRepository extends DollarClient {
  
  Future<DollarDataModel> fetchDollar(String symbol) async {
    return await super.fetchDollar(symbol);
  }

}