import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:giavang/helpers/sentry_helper.dart';

import 'package:giavang/models/options/options.dart';

import 'package:giavang/respository/options/repository.dart';
import 'package:giavang/respository/options/storage_client.dart';

part 'options_event.dart';
part 'options_state.dart';

class OptionsBloc extends Bloc<OptionsEvent, OptionsState> {

  final  _optionsRepository = OptionsRepository();
  final  _databaseRepository = OptionStorageClient();

  @override
  OptionsState get initialState => OptionsInitial();

  @override
  Stream<OptionsState> mapEventToState( OptionsEvent event ) async* {
    if (event is FetchOptions) {
      yield OptionsLoading();
      yield* _fetchOptions();
    }
  }

  Stream<OptionsState> _fetchOptions() async* {

    try {

      final options =  await Future
        .wait(['SPY']
        .map((symbol) async => await _optionsRepository.fetchOptions(symbol)));

        yield OptionsLoaded(options: options);
    } catch (e, stack) {
      yield OptionsError(message: 'There was an error loading');
      await SentryHelper(exception: e, stackTrace: stack).report();
    }
  }
}
