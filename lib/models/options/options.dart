import 'package:meta/meta.dart';
import 'package:giavang/models/options/single_option_model.dart';

class OptionsDataModel {

  final String keyWord;
  final String interval;
  final String expirationDate;
  final String strikePrice;
  final List<SingleOptionModel> options;

  OptionsDataModel({
    this.keyWord,
    this.interval,
    this.expirationDate,
    this.strikePrice,
    this.options
  });
   
}