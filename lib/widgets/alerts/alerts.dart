import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giavang/bloc/alerts/alerts_bloc.dart';
import 'package:giavang/widgets/alerts/alerts_card/alerts_card.dart';
import 'package:giavang/widgets/widgets/empty_screen.dart';
import 'package:giavang/widgets/widgets/loading_indicator.dart';

class AlertsSectionWidget extends StatefulWidget {
  const AlertsSectionWidget();

  @override
  _AlertsSectionWidget createState() => _AlertsSectionWidget();
}

class _AlertsSectionWidget extends State<AlertsSectionWidget> {
  Timer timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(seconds: 60), (Timer t) => _reload());
  }

  void _reload() {
    print("***************************reload alert***************************");
    BlocProvider.of<AlertsBloc>(context).add(FetchAlerts());
  }

  @override
  void dispose() {
    timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlertsBloc, AlertsState>(
        builder: (BuildContext context, AlertsState state) {
      if (state is AlertsInitial) {
        BlocProvider.of<AlertsBloc>(context).add(FetchAlerts());
      }

      if (state is AlertsError) {
        return Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
          child: EmptyScreen(message: state.message),
        );
      }

      if (state is AlertsLoaded) {
        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: state.alerts.length,
          itemBuilder: (BuildContext context, int index) {
            // Ensure that we don't have empty headlines.
            if (state.alerts[index].alerts.isEmpty) {
              return EmptyScreen(
                  message:
                      'There are no alerts related to ${state.alerts[index].keyWord}.');
            }
            return AlertsCardWidget(
              title: 'Alerts',
              alerts: state.alerts[index].alerts,
            );
          },
        );
      }

      return Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 3, left: 4, right: 4),
        child: LoadingIndicatorWidget(),
      );
    });
  }
}
