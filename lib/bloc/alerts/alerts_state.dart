part of 'alerts_bloc.dart';

@immutable
abstract class AlertsState {}

class AlertsInitial extends AlertsState {}

class AlertsLoading extends AlertsState {}

class AlertsError extends AlertsState {
  final String message;

  AlertsError({
    @required this.message
  });
}

class AlertsLoaded extends AlertsState {
  final List<AlertsDataModel> alerts;

  AlertsLoaded({
    @required this.alerts
  });
}