import 'package:flutter/material.dart';
//import 'package:giavang/helpers/url/url.dart';

import 'package:giavang/models/alerts/single_alert_model.dart';
//import 'package:giavang/shared/styles.dart';

class AlertsCardWidget extends StatelessWidget {

  final String title;
  final List<SingleAlertModel> alerts;

  AlertsCardWidget({
    @required this.title,
    @required this.alerts
  }) : assert (alerts != null);

  @override
  Widget build(BuildContext context) {
    return DataTable(
        columnSpacing: 6,
        columns: <DataColumn>[
          DataColumn(
            label: Text('Symbol'),
          ),
          DataColumn(
            label: Text("Order Type"),
          ),
          DataColumn(
            label: Text("Entry Date"),
          ),
          DataColumn(
            label: Text("Entry Price"),
          ),
          DataColumn(
            label: Text("Exit Date"),
          ),
          DataColumn(
            label: Text("Exit Price"),
          ),
          DataColumn(
            label: Text("Gain/Loss"),
          ),
        ],
        rows: alerts
            .map(
                (alert) => DataRow(
              cells: [
                DataCell(
                  Text('${alert.symbol}'),
                ),
                DataCell(
                  Text('${alert.entry_order_type != null ? alert.entry_order_type:""}'),
                ),
                DataCell(
                  Text('${alert.entry_datetime != null ? alert.entry_datetime: "" }'),
                ),
                DataCell(
                  Text('${alert.entry_price != null ? alert.entry_price.toStringAsFixed(2) : 0}'),
                ),
                DataCell(
                  Text('${alert.exit_datetime != null ? alert.exit_datetime : ""}'),
                ),
                DataCell(
                  Text('${alert.exit_price != null ? alert.exit_price.toStringAsFixed(2) : 0}'),
                ),
                DataCell(
                  Text('${alert.gain_loss != null? alert.gain_loss.toStringAsFixed(2) : 0}'),
                ),
              ],
            )
        )
        .toList());

  }

}