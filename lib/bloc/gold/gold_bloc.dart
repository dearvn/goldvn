import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:giavang/helpers/sentry_helper.dart';

import 'package:giavang/models/gold/gold.dart';

import 'package:giavang/respository/gold/repository.dart';

part 'gold_event.dart';
part 'gold_state.dart';

class GoldBloc extends Bloc<GoldEvent, GoldState> {

  final  _goldRepository = GoldRepository();

  @override
  GoldState get initialState => GoldInitial();

  @override
  Stream<GoldState> mapEventToState( GoldEvent event ) async* {
    if (event is FetchGold) {
      yield GoldLoading();
      yield* _fetchGold();
    }
  }

  Stream<GoldState> _fetchGold() async* {

    try {

      final datas =  await Future
        .wait(['SJC']
        .map((symbol) async => await _goldRepository.fetchGold(symbol)));

        yield GoldLoaded(datas: datas);
    } catch (e, stack) {
      yield GoldError(message: 'Có lỗi trong quá trình khởi tạo.');
      await SentryHelper(exception: e, stackTrace: stack).report();
    }
  }
}
