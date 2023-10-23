import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyawthiha/core/routes/routes.dart';
import 'package:kyawthiha/core/styles/text/default_text.dart';
import 'package:kyawthiha/core/styles/text/textstyles.dart';
import 'package:kyawthiha/domain/entities/news/news.dart';
import 'package:kyawthiha/presentation/screens/details/news_detail.dart';
import 'package:kyawthiha/presentation/screens/news/widgets/news_image_widget.dart';

class SubHeaderNewsWidget extends StatelessWidget {
  final NewsEntity newsEntitiy;

  const SubHeaderNewsWidget({super.key, required this.newsEntitiy});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        goToNextPage(context, NewsDetailScreen(newsEntity:newsEntitiy));
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultText(
                      newsEntitiy.source ?? "",
                      style: TextStyles.footerTextStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                      child: DefaultText(
                        newsEntitiy.title ?? "",
                        style: TextStyles.subTitleTextStyle,
                        maxLine: 3,
                      ),
                    ),
                    DefaultText(
                      newsEntitiy.getFormattedDate(),
                      style: TextStyles.footerTextStyle.copyWith(fontWeight: FontWeight.w100),
                    ),
                  ],
            )),
            NewsImageWidget(
              imgUrl: newsEntitiy.urlToImage ?? "",
              width: 100,
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
