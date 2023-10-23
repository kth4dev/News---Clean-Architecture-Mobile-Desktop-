import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kyawthiha/core/styles/text/default_text.dart';
import 'package:kyawthiha/core/styles/text/textstyles.dart';
import 'package:kyawthiha/domain/entities/news/news.dart';
import 'package:kyawthiha/presentation/screens/news/widgets/news_image_widget.dart';
import 'package:kyawthiha/presentation/screens/saved_news/widgets/saved_news_icon_widget.dart';

import '../../../../core/routes/routes.dart';
import '../../../../injection_container.dart';
import '../../details/news_detail.dart';

class SavedNewsWidget extends StatelessWidget {
  final NewsEntity newsEntitiy;

  const SavedNewsWidget({super.key, required this.newsEntitiy});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        goToNextPage(context, NewsDetailScreen(newsEntity: newsEntitiy));
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NewsImageWidget(
              imgUrl: newsEntitiy.urlToImage ?? "",
              width: 80,
              height: 80,
            ),
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
                        style: TextStyles.descriptionTextStyle,
                        maxLine: 3,
                      ),
                    ),
                    if (newsEntitiy.publishedAt != null)
                      DefaultText(
                        newsEntitiy.getFormattedDate(),
                        style: TextStyles.footerTextStyle.copyWith(fontWeight: FontWeight.w100),
                      ),
                  ],
                )),

            SavedNewsIconWidget(appDatabase: sl(), newsEntity:  newsEntitiy, savedNewsUseCase:  sl(), removeSavedNewsUseCase:  sl())

          ],
        ),
      ),
    );
  }
}
