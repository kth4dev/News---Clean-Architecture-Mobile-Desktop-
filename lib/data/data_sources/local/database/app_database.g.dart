// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  NewsDao? _newsDaoInstance;

  SavedNewsDao? _savedNewsDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `news` (`id` INTEGER, `source` TEXT, `sourceId` TEXT, `author` TEXT, `title` TEXT, `description` TEXT, `url` TEXT, `urlToImage` TEXT, `publishedAt` TEXT, `content` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `saved_news` (`id` INTEGER, `source` TEXT, `sourceId` TEXT, `author` TEXT, `title` TEXT, `description` TEXT, `url` TEXT, `urlToImage` TEXT, `publishedAt` TEXT, `content` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  NewsDao get newsDao {
    return _newsDaoInstance ??= _$NewsDao(database, changeListener);
  }

  @override
  SavedNewsDao get savedNewsDao {
    return _savedNewsDaoInstance ??= _$SavedNewsDao(database, changeListener);
  }
}

class _$NewsDao extends NewsDao {
  _$NewsDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _newsModelInsertionAdapter = InsertionAdapter(
            database,
            'news',
            (NewsModel item) => <String, Object?>{
                  'id': item.id,
                  'source': item.source,
                  'sourceId': item.sourceId,
                  'author': item.author,
                  'title': item.title,
                  'description': item.description,
                  'url': item.url,
                  'urlToImage': item.urlToImage,
                  'publishedAt': item.publishedAt,
                  'content': item.content
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<NewsModel> _newsModelInsertionAdapter;

  @override
  Future<void> deleteAll() async {
    await _queryAdapter.queryNoReturn('DELETE FROM news');
  }

  @override
  Future<List<NewsModel>> getNews() async {
    return _queryAdapter.queryList('SELECT * FROM news',
        mapper: (Map<String, Object?> row) => NewsModel(
            id: row['id'] as int?,
            source: row['source'] as String?,
            sourceId: row['sourceId'] as String?,
            author: row['author'] as String?,
            title: row['title'] as String?,
            description: row['description'] as String?,
            url: row['url'] as String?,
            urlToImage: row['urlToImage'] as String?,
            publishedAt: row['publishedAt'] as String?,
            content: row['content'] as String?));
  }

  @override
  Future<void> insertAllNews(List<NewsModel> newsModel) async {
    await _newsModelInsertionAdapter.insertList(
        newsModel, OnConflictStrategy.abort);
  }
}

class _$SavedNewsDao extends SavedNewsDao {
  _$SavedNewsDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _savedNewsModelInsertionAdapter = InsertionAdapter(
            database,
            'saved_news',
            (SavedNewsModel item) => <String, Object?>{
                  'id': item.id,
                  'source': item.source,
                  'sourceId': item.sourceId,
                  'author': item.author,
                  'title': item.title,
                  'description': item.description,
                  'url': item.url,
                  'urlToImage': item.urlToImage,
                  'publishedAt': item.publishedAt,
                  'content': item.content
                }),
        _savedNewsModelDeletionAdapter = DeletionAdapter(
            database,
            'saved_news',
            ['id'],
            (SavedNewsModel item) => <String, Object?>{
                  'id': item.id,
                  'source': item.source,
                  'sourceId': item.sourceId,
                  'author': item.author,
                  'title': item.title,
                  'description': item.description,
                  'url': item.url,
                  'urlToImage': item.urlToImage,
                  'publishedAt': item.publishedAt,
                  'content': item.content
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<SavedNewsModel> _savedNewsModelInsertionAdapter;

  final DeletionAdapter<SavedNewsModel> _savedNewsModelDeletionAdapter;

  @override
  Future<List<SavedNewsModel>> isHaveSaveNews(
    String source,
    String author,
    String title,
    String description,
    String content,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM saved_news where source = ?1 and author = ?2 and title = ?3 and description = ?4 and content = ?5',
        mapper: (Map<String, Object?> row) => SavedNewsModel(id: row['id'] as int?, source: row['source'] as String?, sourceId: row['sourceId'] as String?, author: row['author'] as String?, title: row['title'] as String?, description: row['description'] as String?, url: row['url'] as String?, urlToImage: row['urlToImage'] as String?, publishedAt: row['publishedAt'] as String?, content: row['content'] as String?),
        arguments: [source, author, title, description, content]);
  }

  @override
  Future<List<SavedNewsModel>> getSavedNews() async {
    return _queryAdapter.queryList('SELECT * FROM saved_news',
        mapper: (Map<String, Object?> row) => SavedNewsModel(
            id: row['id'] as int?,
            source: row['source'] as String?,
            sourceId: row['sourceId'] as String?,
            author: row['author'] as String?,
            title: row['title'] as String?,
            description: row['description'] as String?,
            url: row['url'] as String?,
            urlToImage: row['urlToImage'] as String?,
            publishedAt: row['publishedAt'] as String?,
            content: row['content'] as String?));
  }

  @override
  Future<void> insertSavedNews(SavedNewsModel newsModel) async {
    await _savedNewsModelInsertionAdapter.insert(
        newsModel, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteSavedNews(SavedNewsModel newsModel) async {
    await _savedNewsModelDeletionAdapter.delete(newsModel);
  }
}
