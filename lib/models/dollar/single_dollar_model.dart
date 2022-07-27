//import 'dart:ffi';

//import 'package:meta/meta.dart';

class SingleDollarModel {
  final num buyingPrice;
  final num sellingPrice;
  final num code;
  final num sellChange;
  final num sellChangePercent;
  final num buyChange;
  final num buyChangePercent;
  final String dateTime;
  
  SingleDollarModel({
    this.code,
    this.buyingPrice,
    this.sellingPrice,
    this.sellChange,
    this.sellChangePercent,
    this.buyChange,
    this.buyChangePercent,
    this.dateTime
  });

  factory SingleDollarModel.fromJson(Map<String, dynamic> json) {

    return SingleDollarModel(
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

  static List<SingleDollarModel> toList(List<dynamic> items) {
    return items
    .map((item) => SingleDollarModel.fromJson(item))
    .toList();
  }
}


