import 'package:bloc/bloc.dart';
import 'package:kyawthiha/domain/usecases/news/get_saved_news.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/news/news.dart';

part 'saved_news_event.dart';

part 'saved_news_state.dart';

class SavedNewsBloc extends Bloc<SavedNewsEvent, SavedNewsState> {
  final GetSavedNewsUseCase _getSavedNewsUseCase;

  SavedNewsBloc(this._getSavedNewsUseCase) : super(SavedNewsInitial()) {
    on<GetSavedNewsEvent>(onGetSavedNews);
  }

  void onGetSavedNews(GetSavedNewsEvent event, Emitter<SavedNewsState> emit) async {
    try {
      final list = await _getSavedNewsUseCase();
      emit(SavedNewsDone(list));
    } catch (e) {
      emit(SavedNewsError());
    }
  }
}
