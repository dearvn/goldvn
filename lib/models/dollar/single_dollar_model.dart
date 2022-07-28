//import 'dart:ffi';

//import 'package:meta/meta.dart';

class SingleDollarModel {
  final String code;
  final String name;

  final num buyingPrice;
  final num sellingPrice;
  final num sellChange;
  final num buyChange;
  final String dateTime;

  final num bankBuyingPrice;
  final num bankSellingPrice;
  final num bankSellChange;
  final num bankBuyChange;
  final String bankDateTime;
  
  SingleDollarModel({
    this.code,
    this.name,
    this.buyingPrice,
    this.sellingPrice,
    this.sellChange,
    this.buyChange,
    this.dateTime,
    this.bankBuyingPrice,
    this.bankSellingPrice,
    this.bankSellChange,
    this.bankBuyChange,
    this.bankDateTime
  });

  factory SingleDollarModel.fromJson(Map<String, dynamic> json) {

    return SingleDollarModel(
      code: json['mihong']['code'],
      name: json['mihong']['name'],
      
      buyingPrice: json['mihong']['buyingPrice'],
      sellingPrice: json['mihong']['sellingPrice'],
      sellChange: json['mihong']['sellChange'],
      buyChange: json['mihong']['buyChange'],
      dateTime: json['mihong']['dateTime'],

      bankBuyingPrice: json['viettin']['buyingPrice'],
      bankSellingPrice: json['viettin']['sellingPrice'],
      bankSellChange: json['viettin']['sellChange'],
      bankBuyChange: json['viettin']['buyChange'],
      bankDateTime: json['viettin']['dateTime'],
    );
  }

  static List<SingleDollarModel> toList(List<dynamic> items) {
    return items
    .map((item) => SingleDollarModel.fromJson(item))
    .toList();
  }
}


