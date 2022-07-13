//import 'dart:ffi';

import 'package:meta/meta.dart';

class SingleOptionModel {
  final String symbol;
  final String callContract;
  final String putContract;
  final num strike;
  final num trackCallPrice;
  final num callPrice;
  final num callHigh;
  final num callLow;
  final num callChange;
  final num callPctOverall;
  final num callDaily;
  final num putDaily;
  final num callPctDaily;
  final num putPctDaily;
  final bool callUp;
  final num trackPutPrice;
  final num putPrice;
  final num putHigh;
  final num putLow;
  final num putChange;
  final num putPct;
  final bool putUp;
  final int callOpenInterest;
  final int putOpenInterest;
  
  SingleOptionModel({
    this.symbol,
    this.callContract,
    this.putContract,
    this.strike,
    this.trackCallPrice,
    this.callPrice,
    this.callHigh,
    this.callLow,
    this.callChange,
    this.callPctOverall,
    this.callDaily,
    this.putDaily,
    this.callPctDaily,
    this.putPctDaily,
    this.callUp,
    this.trackPutPrice,
    this.putPrice,
    this.putHigh,
    this.putLow,
    this.putChange,
    this.putPct,
    this.putUp,
    this.callOpenInterest,
    this.putOpenInterest,
  });

  factory SingleOptionModel.fromJson(Map<String, dynamic> json) {

    return SingleOptionModel(
      symbol: 'SPY',
      callContract: json['call_contract'],
      putContract: json['put_contract'],
      strike: json['strike'],
      trackCallPrice: json['track_call_price'],
      callPrice: json['call_price'],
      callHigh: json['call_high'],
      callLow: json['call_low'],
      callChange: json['call_change'],
      callPctOverall: json['call_pct_overall'],
      callDaily: json['call_daily'],
      putDaily: json['put_daily'],
      callPctDaily: json['call_pct_daily'],
      putPctDaily: json['put_pct_daily'],
      callUp: json['call_up'],
      trackPutPrice: json['track_put_price'],
      putPrice: json['put_price'],
      putHigh: json['put_high'],
      putLow: json['put_low'],
      putChange: json['put_change'],
      putPct: json['put_pct'],
      putUp: json['put_up'],
      callOpenInterest: json['call_open_interest'],
      putOpenInterest: json['put_open_interest'],
    );
  }

  static List<SingleOptionModel> toList(List<dynamic> items) {
    return items
    .map((item) => SingleOptionModel.fromJson(item))
    .toList();
  }
}


