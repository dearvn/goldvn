part of 'dollar_bloc.dart';

@immutable
abstract class DollarState {}

class DollarInitial extends DollarState {}

class DollarLoading extends DollarState {}

class DollarError extends DollarState {
  final String message;

  DollarError({
    @required this.message
  });
}

class DollarLoaded extends DollarState {
  final List<DollarDataModel> datas;

  DollarLoaded({
    @required this.datas
  });
}