import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:giavang/helpers/sentry_helper.dart';

import 'package:giavang/models/gold/gold.dart';

import 'package:giavang/respository/gold/repository.dart';
import 'package:giavang/respository/gold/storage_client.dart';

part 'gold_event.dart';
part 'gold_state.dart';

class GoldBloc extends Bloc<GoldEvent, GoldState> {

  final  _goldRepository = GoldRepository();
  final  _databaseRepository = GoldStorageClient();

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
        .wait(['SPY']
        .map((symbol) async => await _goldRepository.fetchGold(symbol)));

        yield GoldLoaded(datas: datas);
    } catch (e, stack) {
      yield GoldError(message: 'There was an error loading');
      await SentryHelper(exception: e, stackTrace: stack).report();
    }
  }
}
