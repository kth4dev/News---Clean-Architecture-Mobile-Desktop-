part of 'news_bloc.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsDone extends NewsState {
  final List<NewsEntity> list;
  NewsDone(this.list);
}

class NewsError extends NewsState {
  final String errorMessage;
  final List<NewsEntity> list;
  NewsError(this.errorMessage,this.list);
}
