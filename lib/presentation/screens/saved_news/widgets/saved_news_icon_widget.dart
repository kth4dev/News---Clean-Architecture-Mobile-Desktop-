import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyawthiha/data/data_sources/local/database/app_database.dart';
import 'package:kyawthiha/domain/entities/news/news.dart';
import 'package:kyawthiha/domain/usecases/news/remove_saved_news.dart';
import 'package:kyawthiha/domain/usecases/news/save_news.dart';

import '../../../bloc/saved_news/saved_news_bloc.dart';

class SavedNewsIconWidget extends StatefulWidget {
  final NewsEntity newsEntity;
  final SavedNewsUseCase savedNewsUseCase;
  final RemoveSavedNewsUseCase removeSavedNewsUseCase;
  final AppDatabase appDatabase;

  const SavedNewsIconWidget({super.key, required this.appDatabase, required this.newsEntity, required this.savedNewsUseCase, required this.removeSavedNewsUseCase});

  @override
  State<SavedNewsIconWidget> createState() => _SavedNewsIconWidgetState();
}

class _SavedNewsIconWidgetState extends State<SavedNewsIconWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.appDatabase.savedNewsDao
            .isHaveSaveNews(widget.newsEntity.source ?? "", widget.newsEntity.author ?? "", widget.newsEntity.title ?? "", widget.newsEntity.description ?? "", widget.newsEntity.content ?? ""),
        builder: (context, state) {
          if (state.hasData) {
            if (state.data?.isEmpty ?? true) {
              return IconButton(
                  onPressed: () async {
                    try {
                      await widget.savedNewsUseCase(params: widget.newsEntity);
                      refresh();
                    } catch (e) {
                      ///
                    }
                  },
                  icon: const Icon(Icons.star_outline));
            } else {
              return IconButton(
                  onPressed: () async {
                    try {
                      await widget.removeSavedNewsUseCase(params: state.data?.first);
                      refresh();
                    } catch (e) {
                      ///
                    }
                  },
                  icon: const Icon(Icons.star));
            }
          }
          return const SizedBox();
        });
  }

  void refresh() {
    setState(() {});
    BlocProvider.of<SavedNewsBloc>(context).add(GetSavedNewsEvent());
  }
}
