import 'dart:io';

import 'package:kyawthiha/core/resources/data_state.dart';
import 'package:kyawthiha/core/values/constants.dart';
import 'package:kyawthiha/data/data_sources/local/database/app_database.dart';
import 'package:kyawthiha/data/model/news/news.dart';
import 'package:kyawthiha/data/model/news/saved_news.dart';
import 'package:kyawthiha/domain/entities/news/news.dart';
import 'package:kyawthiha/domain/repository/news/news_repository.dart';
import 'package:dio/dio.dart';

import '../../data_sources/remote/news/news_api_service.dart';

class NewsRepositoryImpl extends NewsRepository{
  final NewsApiService _newsApiService;
  final AppDatabase _appDatabase;
  NewsRepositoryImpl(this._newsApiService,this._appDatabase);

  @override
  Future<DataState<List<NewsEntity>>> getNews() async{
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey:apiKey,
        country: country,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.articles ?? []);
      } else {
        return DataFailed(
            DioException(
                error: httpResponse.response.statusMessage,
                response: httpResponse.response,
                requestOptions: httpResponse.response.requestOptions
            )
        );
      }
    } on DioException catch(e){
      return DataFailed(e);
    }
  }

  @override
  Future<void> saveAllNews(List<NewsEntity> allNews) async{
    await _appDatabase.newsDao.deleteAll();
    await _appDatabase.newsDao.insertAllNews(allNews.map((e) => NewsModel.fromEntity(e)).toList());
  }

  @override
  Future<List<NewsEntity>> getOfflineNews() {
    return _appDatabase.newsDao.getNews();
  }

  @override
  Future<List<NewsEntity>> getSavedNews() {
    return _appDatabase.savedNewsDao.getSavedNews();
  }

  @override
  Future<void> removeSavedNews(NewsEntity newsEntity) async{
    await _appDatabase.savedNewsDao.deleteSavedNews(SavedNewsModel.fromEntity(newsEntity));
  }

  @override
  Future<void> saveNews(NewsEntity newsEntity) async{
    await _appDatabase.savedNewsDao.insertSavedNews(SavedNewsModel.fromEntity(newsEntity));
  }
}