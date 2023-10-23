import 'package:kyawthiha/domain/entities/news/news.dart';
import 'package:kyawthiha/domain/repository/news/news_repository.dart';

import '../../../core/usecase/usecase.dart';

class RemoveSavedNewsUseCase implements UseCase<void,NewsEntity>{
  
  final NewsRepository _newsRepository;

  RemoveSavedNewsUseCase(this._newsRepository);
  
  @override
  Future<void> call({NewsEntity ? params}) {
    return _newsRepository.removeSavedNews(params!);
  }
  
}