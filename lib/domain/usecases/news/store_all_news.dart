import 'package:kyawthiha/domain/entities/news/news.dart';
import 'package:kyawthiha/domain/repository/news/news_repository.dart';

import '../../../core/usecase/usecase.dart';

class StoreAllNewsUseCase implements UseCase<void, List<NewsEntity>> {
  final NewsRepository _newsRepository;

  StoreAllNewsUseCase(this._newsRepository);

  @override
  Future<void> call( {List<NewsEntity>? params}) async {
    await _newsRepository.saveAllNews(params ?? []);
  }
}
