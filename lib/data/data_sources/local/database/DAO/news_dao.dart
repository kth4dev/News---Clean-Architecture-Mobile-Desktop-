import 'package:floor/floor.dart';
import 'package:kyawthiha/data/model/news/news.dart';


@dao
abstract class NewsDao {
  
  @Insert()
  Future<void> insertAllNews(List<NewsModel> newsModel);

  @Query('DELETE FROM news')
  Future<void> deleteAll();
  
  @Query('SELECT * FROM news')
  Future<List<NewsModel>> getNews();
}