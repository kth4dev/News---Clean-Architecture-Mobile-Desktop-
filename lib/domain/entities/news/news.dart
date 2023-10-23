import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class NewsEntity extends Equatable {
  final int? id;
  final String? source;
  final String? sourceId;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const NewsEntity({
    this.id,
    this.source,
    this.sourceId,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  @override
  List<Object?> get props {
    return [
      id,
      source,
      sourceId,
      author,
      title,
      description,
      url,
      urlToImage,
      publishedAt,
      content,
    ];
  }

  String getFormattedDate(){
    return DateFormat("yyyy-MM-dd").format(DateTime.parse(publishedAt!));
  }
}
