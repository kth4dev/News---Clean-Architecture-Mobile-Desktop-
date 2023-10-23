import 'package:floor/floor.dart';
import 'package:kyawthiha/domain/entities/news/news.dart';

@Entity(tableName: 'saved_news', primaryKeys: ['id'])
class SavedNewsModel extends NewsEntity {
  const SavedNewsModel({
    int? id,
    String? source,
    String? sourceId,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) : super(
          id: id,
          source: source,
          sourceId: sourceId,
          author: author,
          title: title,
          description: description,
          url: url,
          urlToImage: urlToImage,
          publishedAt: publishedAt,
          content: content,
        );

  factory SavedNewsModel.fromJson(Map<String, dynamic> map) {
    return SavedNewsModel(
      source: map['source']['name'] ?? "",
      sourceId: map['source']['id'] ?? "",
      author: map['author'] ?? "",
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      url: map['url'] ?? "",
      urlToImage: map['urlToImage'] != null && map['urlToImage'] != "" ? map['urlToImage'] : "",
      publishedAt: map['publishedAt'] ?? "",
      content: map['content'] ?? "",
    );
  }

  factory SavedNewsModel.fromEntity(NewsEntity entity) {
    return SavedNewsModel(
        id: entity.id,
        source: entity.source ?? "",
        sourceId: entity.sourceId ?? "",
        author: entity.author ?? "",
        title: entity.title ?? "",
        description: entity.description ?? "",
        url: entity.url ?? "",
        urlToImage: entity.urlToImage ?? "",
        publishedAt: entity.publishedAt ?? "",
        content: entity.content ?? "");
  }
}
