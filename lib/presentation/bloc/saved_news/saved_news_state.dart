part of 'saved_news_bloc.dart';

@immutable
abstract class SavedNewsState {}

class SavedNewsInitial extends SavedNewsState {}

class SavedNewsLoading extends SavedNewsState {}

class SavedNewsDone extends SavedNewsState {
  final List<NewsEntity> list;
  SavedNewsDone(this.list);
}

class SavedNewsError extends SavedNewsState {}
