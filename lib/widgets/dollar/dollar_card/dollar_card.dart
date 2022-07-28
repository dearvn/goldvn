import 'package:flutter/material.dart';

import 'package:giavang/models/dollar/single_dollar_model.dart';

class DollarCardWidget extends StatelessWidget {

  final String title;
  final List<SingleDollarModel> datas;

  DollarCardWidget({
    @required this.title,
    @required this.datas
  }) : assert (datas != null);

  @override
  Widget build(BuildContext context) {
    return DataTable(
        columnSpacing: 6,
        columns: <DataColumn>[
          DataColumn(
            label: Text(''),
          ),
          DataColumn(
            label: Text("Ngân hàng"),
          ),
          DataColumn(
            label: Text("Thị trường"),
          ),
        ],
        rows: datas
            .map(
                (item) => DataRow(
              cells: [
                DataCell(
                  Text('${item.code}'),
                ),
                DataCell(Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    
                    Text(
                      '${item.bankBuyingPrice != null ? item.bankBuyingPrice.toStringAsFixed(0): 0 }',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w600, color: item.bankBuyChange > 0 ? Colors.lightGreenAccent : Colors.redAccent),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          WidgetSpan(child: Icon(item.bankBuyChange > 0 ? Icons.arrow_upward : Icons.arrow_downward,
                          size: 12, color: item.buyChange > 0 ? Colors.lightGreenAccent : Colors.redAccent)),
                          TextSpan(
                            text: '${item.bankBuyChange != null ? item.bankBuyChange.toStringAsFixed(0): 0 }',
                            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400, color: item.bankBuyChange > 0 ? Colors.lightGreenAccent : Colors.redAccent),
                          ),
                        ],
                      ),
                    )
                    
                  ])),
                DataCell(Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    
                    Text(
                      '${item.buyingPrice != null ? item.buyingPrice.toStringAsFixed(0): 0 }',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w600, color: item.buyChange > 0 ? Colors.lightGreenAccent : Colors.redAccent),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          WidgetSpan(child: Icon(item.buyChange > 0 ? Icons.arrow_upward : Icons.arrow_downward,
                          size: 12, color: item.buyChange > 0 ? Colors.lightGreenAccent : Colors.redAccent)),
                          TextSpan(
                            text: '${item.buyChange != null ? item.buyChange.toStringAsFixed(0): 0 }',
                            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400, color: item.buyChange > 0 ? Colors.lightGreenAccent : Colors.redAccent),
                          ),
                        ],
                      ),
                    )
                    
                  ])),
              ],
            )
        )
        .toList());

  }

}