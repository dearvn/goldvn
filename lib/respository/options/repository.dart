
import 'package:giavang/models/options/options.dart';
import 'package:giavang/respository/options/options_client.dart';

class OptionsRepository extends OptionsClient {
  
  Future<OptionsDataModel> fetchOptions(String symbol) async {
    return await super.fetchOptions(symbol);
  }

}