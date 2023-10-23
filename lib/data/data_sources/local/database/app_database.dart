
import 'package:floor/floor.dart';
import 'package:kyawthiha/data/data_sources/local/database/DAO/news_dao.dart';
import 'package:kyawthiha/data/data_sources/local/database/DAO/saved_news_dao.dart';
import 'package:kyawthiha/data/model/news/news.dart';
import 'package:kyawthiha/data/model/news/saved_news.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

part 'app_database.g.dart';

@Database(version: 1, entities: [NewsModel,SavedNewsModel])
abstract class AppDatabase extends FloorDatabase {
  NewsDao get newsDao;
  SavedNewsDao get savedNewsDao;
}