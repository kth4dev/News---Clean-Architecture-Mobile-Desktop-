import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kyawthiha/data/data_sources/local/cache/cache_helper.dart';
import 'package:kyawthiha/data/data_sources/local/database/app_database.dart';
import 'package:kyawthiha/data/reposity/news/news_reposity_impl.dart';
import 'package:kyawthiha/domain/repository/news/news_repository.dart';
import 'package:kyawthiha/domain/usecases/news/get_news.dart';
import 'package:kyawthiha/domain/usecases/news/get_offline_news.dart';
import 'package:kyawthiha/domain/usecases/news/get_saved_news.dart';
import 'package:kyawthiha/domain/usecases/news/remove_saved_news.dart';
import 'package:kyawthiha/domain/usecases/news/store_all_news.dart';
import 'package:kyawthiha/presentation/bloc/news/news_bloc.dart';
import 'package:kyawthiha/presentation/bloc/saved_news/saved_news_bloc.dart';
import 'package:kyawthiha/presentation/bloc/theme/theme_cubit.dart';
import 'data/data_sources/remote/news/news_api_service.dart';
import 'domain/usecases/news/save_news.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  await CacheHelper.ensureInitialized();

  final database = await $FloorAppDatabase.databaseBuilder('news_database.db').build();
  sl.registerSingleton<AppDatabase>(database);

  /// Dio
  sl.registerSingleton<Dio>(Dio());

  /// Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  ///repository
  sl.registerSingleton<NewsRepository>(NewsRepositoryImpl(sl(), sl()));

  ///UseCases
  sl.registerSingleton<GetNewsUseCase>(GetNewsUseCase(sl()));

  sl.registerSingleton<GetOfflineNewsUseCase>(GetOfflineNewsUseCase(sl()));

  sl.registerSingleton<GetSavedNewsUseCase>(GetSavedNewsUseCase(sl()));

  sl.registerSingleton<RemoveSavedNewsUseCase>(RemoveSavedNewsUseCase(sl()));

  sl.registerSingleton<SavedNewsUseCase>(SavedNewsUseCase(sl()));

  sl.registerSingleton<StoreAllNewsUseCase>(StoreAllNewsUseCase(sl()));

  ///Blocs
  sl.registerSingleton<ThemeCubit>(ThemeCubit());

  sl.registerFactory<NewsBloc>(() => NewsBloc(sl(), sl(), sl()));
  sl.registerFactory<SavedNewsBloc>(() => SavedNewsBloc(sl()));
}
