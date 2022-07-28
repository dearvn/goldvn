import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:giavang/helpers/sentry_helper.dart';

import 'package:giavang/models/alerts/alerts.dart';

import 'package:giavang/respository/alerts/repository.dart';

part 'alerts_event.dart';
part 'alerts_state.dart';

class AlertsBloc extends Bloc<AlertsEvent, AlertsState> {

  final  _alertsRepository = AlertsRepository();

  @override
  AlertsState get initialState => AlertsInitial();

  @override
  Stream<AlertsState> mapEventToState( AlertsEvent event ) async* {
    if (event is FetchAlerts) {
      yield AlertsLoading();
      yield* _fetchAlerts();
    }
  }

  Stream<AlertsState> _fetchAlerts() async* {

    try {

      final alerts =  await Future
        .wait(['']
        .map((symbol) async => await _alertsRepository.fetchAlerts(symbol)));

        yield AlertsLoaded(alerts: alerts);
    } catch (e, stack) {
      yield AlertsError(message: 'There was an error loading');
      await SentryHelper(exception: e, stackTrace: stack).report();
    }
  }
}
