//import 'dart:ffi';

//import 'package:meta/meta.dart';

class SingleAlertModel {

  final String id;
  final String symbol;
  final String signal;
  final String entry_order_type;
  final String exit_order_type;
  final String entry_datetime;
  final String exit_datetime;
  final num gain_loss;
  final String status;
  //final num number_share;
  final num entry_price;
  final num exit_price;
  final num total_gain_loss;
  final num current_price;
  //final num trailing_stop_loss;
  final num stop_loss;
  final String datetime;

  
  SingleAlertModel({
    this.id,
    this.symbol,
    this.signal,
    this.entry_order_type,
    this.exit_order_type,
    this.entry_datetime,
    this.exit_datetime,
    this.gain_loss,
    this.status,
    //this.number_share,
    this.entry_price,
    this.exit_price,
    this.total_gain_loss,
    this.current_price,
    //this.trailing_stop_loss,
    this.stop_loss,
    this.datetime,
  });

  factory SingleAlertModel.fromJson(Map<String, dynamic> json) {

    return SingleAlertModel(
      id: json['id'],
      symbol: json['symbol'],
      signal: json['signal'],
      entry_order_type: json['entry_order_type'],
      exit_order_type: json['exit_order_type'],
      entry_datetime: json['entry_datetime'],
      exit_datetime: json['exit_datetime'],
      gain_loss: json['gain_loss'],
      status: json['status'],
      //number_share: json['number_share'],
      entry_price: json['entry_price'],
      exit_price: json['exit_price'],
      total_gain_loss: json['total_gain_loss'],
      current_price: json['current_price'],
      //trailing_stop_loss: json['trailing_stop_loss'],
      stop_loss: json['stop_loss'],
      datetime: json['datetime'],
    );
  }

  static List<SingleAlertModel> toList(List<dynamic> items) {
    return items
    .map((item) => SingleAlertModel.fromJson(item))
    .toList();
  }
}


