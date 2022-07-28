//import 'dart:ffi';

//import 'package:meta/meta.dart';

class SingleGoldModel {
  final num buyingPrice;
  final num sellingPrice;
  final String code;
  final num sellChange;
  final num sellChangePercent;
  final num buyChange;
  final num buyChangePercent;
  final String dateTime;
  
  SingleGoldModel({
    this.code,
    this.buyingPrice,
    this.sellingPrice,
    this.sellChange,
    this.sellChangePercent,
    this.buyChange,
    this.buyChangePercent,
    this.dateTime
  });

  factory SingleGoldModel.fromJson(Map<String, dynamic> json) {

    return SingleGoldModel(
      code: json['code'],
      buyingPrice: json['buyingPrice'],
      sellingPrice: json['sellingPrice'],
      sellChange: json['sellChange'],
      sellChangePercent: json['sellChangePercent'],
      buyChange: json['buyChange'],
      buyChangePercent: json['buyChangePercent'],
      dateTime: json['dateTime']
    );
  }

  static List<SingleGoldModel> toList(List<dynamic> items) {
    return items
    .map((item) => SingleGoldModel.fromJson(item))
    .toList();
  }
}


