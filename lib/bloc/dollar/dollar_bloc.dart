import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:giavang/helpers/sentry_helper.dart';

import 'package:giavang/models/dollar/dollar.dart';

import 'package:giavang/respository/dollar/repository.dart';

part 'dollar_event.dart';
part 'dollar_state.dart';

class DollarBloc extends Bloc<DollarEvent, DollarState> {

  final  _dollarRepository = DollarRepository();

  @override
  DollarState get initialState => DollarInitial();

  @override
  Stream<DollarState> mapEventToState( DollarEvent event ) async* {
    if (event is FetchDollar) {
      yield DollarLoading();
      yield* _fetchDollar();
    }
  }

  Stream<DollarState> _fetchDollar() async* {

    try {

      final datas =  await Future
        .wait(['USD']
        .map((symbol) async => await _dollarRepository.fetchDollar(symbol)));

        yield DollarLoaded(datas: datas);
    } catch (e, stack) {
      yield DollarError(message: 'Có lỗi trong quá trình khởi tạo.');
      await SentryHelper(exception: e, stackTrace: stack).report();
    }
  }
}
