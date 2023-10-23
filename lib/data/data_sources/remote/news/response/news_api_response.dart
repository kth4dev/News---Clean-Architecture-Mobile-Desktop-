import 'package:kyawthiha/data/model/news/news.dart';

class NewsApiResponse {
  NewsApiResponse({
    this.status,
    this.totalResults,
    this.articles,
  });

  String? status;
  num? totalResults;
  List<NewsModel>? articles;

  NewsApiResponse.fromJson(dynamic json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(NewsModel.fromJson(v));
      });
    }
  }
}
