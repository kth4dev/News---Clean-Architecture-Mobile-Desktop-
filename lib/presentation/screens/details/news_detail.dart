import 'package:flutter/material.dart';
import 'package:kyawthiha/core/styles/text/default_text.dart';
import 'package:kyawthiha/presentation/screens/news/widgets/news_image_widget.dart';
import 'package:kyawthiha/presentation/screens/saved_news/widgets/saved_news_icon_widget.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/styles/text/textstyles.dart';
import '../../../domain/entities/news/news.dart';
import '../../../injection_container.dart';

class NewsDetailScreen extends StatefulWidget {
  final NewsEntity newsEntity;

  const NewsDetailScreen({super.key, required this.newsEntity});

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(onPressed: (){
                  Navigator.of(context).pop();
                }, icon: const Icon(Icons.arrow_back)),
              ),
              NewsImageWidget(imgUrl: widget.newsEntity.urlToImage ?? "",width: double.maxFinite,height: MediaQuery.sizeOf(context).height*0.45,),
              DefaultText(widget.newsEntity.source ?? "", style: TextStyles.footerTextStyle),
              DefaultText(widget.newsEntity.title ?? "", style: TextStyles.titleTextStyle),
              DefaultText(widget.newsEntity.getFormattedDate(), style: TextStyles.footerTextStyle),
              _buildActionsButtons,
              DefaultText(widget.newsEntity.description ?? "", style: TextStyles.bodyTextStyle),
              DefaultText(widget.newsEntity.content ?? "", style: TextStyles.bodyTextStyle),
            ],
          ),
        ));
  }

  Widget get _buildActionsButtons =>  Row(
    children: [
      SavedNewsIconWidget(newsEntity: widget.newsEntity,savedNewsUseCase: sl(),removeSavedNewsUseCase: sl(),appDatabase: sl(),),
      IconButton(onPressed: (){
        Share.share(widget.newsEntity.url ?? "");
      }, icon: const Icon(Icons.share))
    ],
  );
}
