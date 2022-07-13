
import 'package:giavang/models/news/news.dart';
import 'package:giavang/respository/news/news_client.dart';

class NewsRepository extends NewsClient {
  
  Future<NewsDataModel> fetchNews({String title}) async {
    return await super.fetchNews(title: title);
  }

}