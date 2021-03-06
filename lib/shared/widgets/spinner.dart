import 'package:flutter/material.dart';

class SpinnerWidget extends StatelessWidget {
  
  final Color color;

  SpinnerWidget({
    this.color
  }) : assert(color != null);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(this.color),
      )
    );
  }
}
