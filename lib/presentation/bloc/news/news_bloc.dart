
import 'package:bloc/bloc.dart';
import 'package:kyawthiha/domain/usecases/news/get_news.dart';
import 'package:kyawthiha/domain/usecases/news/store_all_news.dart';
import 'package:meta/meta.dart';

import '../../../core/resources/data_state.dart';
import '../../../domain/entities/news/news.dart';
import '../../../domain/usecases/news/get_offline_news.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetNewsUseCase _getNewsUseCase;
  final StoreAllNewsUseCase _storeAllNewsUseCase;
  final GetOfflineNewsUseCase _getOfflineNewsUseCase;

  NewsBloc(this._getNewsUseCase, this._storeAllNewsUseCase, this._getOfflineNewsUseCase) : super(NewsInitial()) {
    on<GetNewsEvent>(onGetNews);
  }

  void onGetNews(GetNewsEvent event, Emitter<NewsState> emit) async {
    try {
      final dataState = await _getNewsUseCase();
      if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
        await _storeAllNewsUseCase(params: dataState.data!);
        emit(NewsDone(dataState.data!));
      }
      if (dataState is DataFailed) {
        final list = await _getOfflineNewsUseCase();
        emit(NewsError(dataState.error?.message ?? "something went wrong!", list));
      }
    } catch (e) {
      final list = await _getOfflineNewsUseCase();
      emit(NewsDone(list));
    }
  }
}
