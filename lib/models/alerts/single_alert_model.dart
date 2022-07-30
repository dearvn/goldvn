class SingleAlertModel {
  final String id;
  final String name;
  final String ticker;
  final String type;
  final String close;
  final String datetime;

  SingleAlertModel({
    this.id,
    this.ticker,
    this.name,
    this.type,
    this.close,
    this.datetime,
  });

  factory SingleAlertModel.fromJson(Map<String, dynamic> json) {
    return SingleAlertModel(
      id: json['id'],
      name: json['name'],
      ticker: json['ticker'],
      type: json['type'],
      close: json['close'] != '' && num.tryParse(json['close']) != null
          ? json['close']
          : 0,
      datetime: json['datetime'],
    );
  }

  static List<SingleAlertModel> toList(List<dynamic> items) {
    return items.map((item) => SingleAlertModel.fromJson(item)).toList();
  }
}
