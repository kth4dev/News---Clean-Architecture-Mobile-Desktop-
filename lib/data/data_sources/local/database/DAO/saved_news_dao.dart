import 'package:floor/floor.dart';
import 'package:kyawthiha/data/model/news/saved_news.dart';


@dao
abstract class SavedNewsDao {
  
  @Insert()
  Future<void> insertSavedNews(SavedNewsModel newsModel);
  
  @delete
  Future<void> deleteSavedNews(SavedNewsModel newsModel);

  @Query('SELECT * FROM saved_news where author = :author and title = :title and description = :description and content = :content')
  Future<List<SavedNewsModel>> isHaveSaveNews(String source,String author, String title,String description,String content);
  
  @Query('SELECT * FROM saved_news')
  Future<List<SavedNewsModel>> getSavedNews();
}