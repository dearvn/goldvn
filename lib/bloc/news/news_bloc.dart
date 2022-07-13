import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:giavang/helpers/sentry_helper.dart';

import 'package:giavang/models/news/news.dart';

import 'package:giavang/respository/news/repository.dart';
import 'package:giavang/respository/portfolio/storage_client.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {

  final  _newsRepository = NewsRepository(); 
  final  _databaseRepository = PortfolioStorageClient();

  @override
  NewsState get initialState => NewsInitial();

  @override
  Stream<NewsState> mapEventToState( NewsEvent event ) async* {
    if (event is FetchNews) {
      yield NewsLoading();
      yield* _fetchNews();
    }
  }

  Stream<NewsState> _fetchNews() async* {

    try {
      
      final symbolsStored = await this._databaseRepository.fetch();
      print(">>>>>>>>>>>>>>>>>>>>>>>.");
      print(symbolsStored);

      if (symbolsStored.isNotEmpty) {
        final news =  await Future
        .wait(symbolsStored
        .map((symbol) async => await _newsRepository.fetchNews(title: symbol.companyName)));

        yield NewsLoaded(news: news);  
        
      } else {

        final news =  await Future
        .wait(['GOLD']
        .map((symbol) async => await _newsRepository.fetchNews(title: symbol)));

        yield NewsLoaded(news: news);
      }

    } catch (e, stack) {
      yield NewsError(message: 'There was an error loading');
      await SentryHelper(exception: e, stackTrace: stack).report();
    }
  }
}
