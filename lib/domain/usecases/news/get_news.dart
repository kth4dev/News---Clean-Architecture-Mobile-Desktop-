

import 'package:kyawthiha/domain/entities/news/news.dart';
import 'package:kyawthiha/domain/repository/news/news_repository.dart';

import '../../../core/resources/data_state.dart';
import '../../../core/usecase/usecase.dart';

class GetNewsUseCase implements UseCase<DataState<List<NewsEntity>>,void>{
  
  final NewsRepository _newsRepository;

  GetNewsUseCase(this._newsRepository);
  
  @override
  Future<DataState<List<NewsEntity>>> call({void params}) {
    return _newsRepository.getNews();
  }
  
}