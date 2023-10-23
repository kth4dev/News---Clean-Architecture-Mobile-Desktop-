import 'package:kyawthiha/core/values/constants.dart';
import 'package:kyawthiha/data/data_sources/remote/news/response/news_api_response.dart';

import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl:newsApiBaseUrl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;
  
  @GET('top-headlines')
  Future<HttpResponse<NewsApiResponse>> getNewsArticles({
    @Query("apiKey") String ? apiKey,
    @Query("country") String ? country,
  });
}