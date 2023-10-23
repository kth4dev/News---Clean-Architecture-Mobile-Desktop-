import 'package:flutter/material.dart';
import 'package:kyawthiha/core/routes/routes.dart';
import 'package:kyawthiha/core/styles/text/default_text.dart';
import 'package:kyawthiha/core/styles/text/textstyles.dart';
import 'package:kyawthiha/domain/entities/news/news.dart';
import 'package:kyawthiha/presentation/screens/details/news_detail.dart';
import 'package:kyawthiha/presentation/screens/news/widgets/news_image_widget.dart';

class HeaderNewsWidget extends StatelessWidget {
  final NewsEntity newsEntitiy;

  const HeaderNewsWidget({super.key, required this.newsEntitiy});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        goToNextPage(context, NewsDetailScreen(newsEntity: newsEntitiy));
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NewsImageWidget(
              imgUrl: newsEntitiy.urlToImage ?? "",
              width: double.maxFinite,
              height: 200,
            ),
            DefaultText(
              newsEntitiy.source ?? "",
              style: TextStyles.footerTextStyle,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3.0),
              child: DefaultText(
                newsEntitiy.title ?? "",
                style: TextStyles.titleTextStyle,
              ),
            ),
            if (newsEntitiy.publishedAt != null)
              DefaultText(
                newsEntitiy.getFormattedDate(),
                style: TextStyles.footerTextStyle.copyWith(fontWeight: FontWeight.w100),
              ),
          ],
        ),
      ),
    );
  }
}
