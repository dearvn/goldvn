part of 'gold_bloc.dart';

@immutable
abstract class GoldState {}

class GoldInitial extends GoldState {}

class GoldLoading extends GoldState {}

class GoldError extends GoldState {
  final String message;

  GoldError({
    @required this.message
  });
}

class GoldLoaded extends GoldState {
  final List<GoldDataModel> datas;

  GoldLoaded({
    @required this.datas
  });
}