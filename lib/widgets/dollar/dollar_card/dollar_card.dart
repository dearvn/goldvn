import 'package:flutter/material.dart';
import 'package:giavang/helpers/url/url.dart';

import 'package:giavang/models/dollar/single_dollar_model.dart';
import 'package:giavang/shared/styles.dart';

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
            label: Text(""),
          ),
          DataColumn(
            label: Text("MUA"),
          ),
          DataColumn(
            label: Text("BÁN"),
          ),
        ],
        rows: datas
            .map(
                (item) => DataRow(
              cells: [
                DataCell(
                  Text('${item.code}'),
                ),
                DataCell(
                  Text('${item.dateTime}'),
                ),
                DataCell(
                  Text('${item.buyingPrice != null ? item.buyingPrice.toStringAsFixed(2): 0 }'),
                ),
                DataCell(
                  Text('${item.sellingPrice != null ? item.sellingPrice.toStringAsFixed(2) : 0}'),
                ),
              ],
            )
        )
        .toList());

  }


  Widget _renderDollarArticle(SingleDollarModel singleDollar) {

    return GestureDetector(
      //onTap: () => launchUrl(singleOption.strike),
      child: Container(
        width: 200,
        child: Column(
          children: <Widget>[

            Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text(
                singleDollar.code.toString(),
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