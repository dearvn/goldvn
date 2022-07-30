import 'package:flutter/material.dart';
import 'package:giavang/models/alerts/single_alert_model.dart';

class AlertsCardWidget extends StatelessWidget {
  final String title;
  final List<SingleAlertModel> alerts;

  AlertsCardWidget({@required this.title, @required this.alerts})
      : assert(alerts != null);

  @override
  Widget build(BuildContext context) {
    return DataTable(
        columnSpacing: 6,
        columns: <DataColumn>[
          DataColumn(
            label: Text('Thời gian'),
          ),
          DataColumn(
            label: Text("Tín hiệu"),
          ),
        ],
        rows: alerts
            .map((alert) => DataRow(
                  cells: [
                    DataCell(
                      Text('${alert.datetime != null ? alert.datetime : ""}'),
                    ),
                    DataCell(
                      Text('${alert.name}'),
                    ),
                  ],
                ))
            .toList());
  }
}
