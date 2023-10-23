import 'package:kyawthiha/data/model/news/news.dart';
import 'package:kyawthiha/data/model/news/saved_news.dart';

import '../../../core/resources/data_state.dart';
import '../../entities/news/news.dart';

abstract class NewsRepository {
  /// remote
  Future<DataState<List<NewsEntity>>> getNews();

  /// Local
  Future<void> saveAllNews(List<NewsEntity> allNews);

  Future<List<NewsEntity>> getOfflineNews();

  Future<List<NewsEntity>> getSavedNews();

  Future<void> saveNews(NewsEntity newsEntity);

  Future<void> removeSavedNews(NewsEntity newsEntity);
}
