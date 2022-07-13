part of 'options_bloc.dart';

@immutable
abstract class OptionsState {}

class OptionsInitial extends OptionsState {}

class OptionsLoading extends OptionsState {}

class OptionsError extends OptionsState {
  final String message;

  OptionsError({
    @required this.message
  });
}

class OptionsLoaded extends OptionsState {
  final List<OptionsDataModel> options;

  OptionsLoaded({
    @required this.options
  });
}