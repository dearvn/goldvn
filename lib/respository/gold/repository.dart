
import 'package:giavang/models/gold/gold.dart';
import 'package:giavang/respository/gold/gold_client.dart';

class GoldRepository extends GoldClient {
  
  Future<GoldDataModel> fetchGold(String symbol) async {
    return await super.fetchGold(symbol);
  }

}