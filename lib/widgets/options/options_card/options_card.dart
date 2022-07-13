import 'package:flutter/material.dart';
import 'package:giavang/helpers/url/url.dart';

import 'package:giavang/models/options/single_option_model.dart';
import 'package:giavang/shared/styles.dart';

class OptionsCardWidget extends StatelessWidget {

  final String title;
  final List<SingleOptionModel> options;

  OptionsCardWidget({
    @required this.title,
    @required this.options
  }) : assert (options != null);

  @override
  Widget build(BuildContext context) {
    return DataTable(
        columnSpacing: 6,
        columns: <DataColumn>[
          DataColumn(
            label: Text('Call'),
          ),
          DataColumn(
            label: Text("Change"),
          ),
          DataColumn(
            label: Text("High"),
          ),
          DataColumn(
            label: Text("Low"),
          ),
          DataColumn(
            label: Text("Put"),
          ),
          DataColumn(
            label: Text("Change"),
          ),
          DataColumn(
            label: Text("High"),
          ),
          DataColumn(
            label: Text("Low"),
          )
        ],
        rows: options
            .map(
                (option) => DataRow(
              cells: [
                DataCell(
                  Text('${option.callPrice != null ?option.callPrice.toStringAsFixed(2):0}'),
                ),
                DataCell(
                  Text('${option.callChange != null ? option.callChange.toStringAsFixed(2):0}'),
                ),
                DataCell(
                  Text('${option.callHigh != null ? option.callHigh.toStringAsFixed(2): 0 }'),
                ),
                DataCell(
                  Text('${option.callLow != null ? option.callLow.toStringAsFixed(2) : 0}'),
                ),
                DataCell(
                  Text('${option.putPrice != null ? option.putPrice.toStringAsFixed(2) : 0}'),
                ),
                DataCell(
                  Text('${option.putChange != null ? option.putChange.toStringAsFixed(2) : 0}'),
                ),
                DataCell(
                  Text('${option.putHigh != null? option.putHigh.toStringAsFixed(2) : 0}'),
                ),
                DataCell(
                  Text('${option.putLow != null ? option.putLow.toStringAsFixed(2) : 0}'),
                ),
              ],
            )
        )
        .toList());

  }


  Widget _renderOptionsArticle(SingleOptionModel singleOption) {

    return GestureDetector(
      //onTap: () => launchUrl(singleOption.strike),
      child: Container(
        width: 200,
        child: Column(
          children: <Widget>[

            Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text(
                singleOption.strike.toString(),
                style: TextStyle(
                  height: 1.6,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color:  Color(0XFFc2c2c2)
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            //Container(
            //  height: 125,
            //  decoration: BoxDecoration(
            //    image: DecorationImage( image: null)
            //  ),
            //),
          ],
        ),
      ),
    );
  }

  ImageProvider _imageIsValid(String url) {
    return url == null 
    ? AssetImage('assets/images/default.jpg')
    : NetworkImage(url);
  }
}