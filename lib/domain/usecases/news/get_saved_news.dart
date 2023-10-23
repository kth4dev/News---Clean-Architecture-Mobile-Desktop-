import 'package:kyawthiha/domain/entities/news/news.dart';
import 'package:kyawthiha/domain/repository/news/news_repository.dart';

import '../../../core/usecase/usecase.dart';

class GetSavedNewsUseCase implements UseCase<List<NewsEntity>, void> {
  final NewsRepository _newsRepository;

  GetSavedNewsUseCase(this._newsRepository);

  @override
  Future<List<NewsEntity>> call({void params}) {
    return _newsRepository.getSavedNews();
  }
}
