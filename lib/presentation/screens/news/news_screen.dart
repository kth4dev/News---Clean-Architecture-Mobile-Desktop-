import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyawthiha/core/styles/text/default_text.dart';
import 'package:kyawthiha/core/values/constants.dart';
import 'package:kyawthiha/presentation/bloc/news/news_bloc.dart';
import 'package:kyawthiha/presentation/screens/news/widgets/header_news_widget.dart';
import 'package:kyawthiha/presentation/screens/news/widgets/news_widget.dart';
import 'package:kyawthiha/presentation/screens/news/widgets/sub_header_news_widget.dart';
import 'package:kyawthiha/presentation/screens/widgets/no_data.dart';

import '../../../core/styles/text/textstyles.dart';
import '../../../domain/entities/news/news.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchController.addListener(() {
      setState(() {});
    });
    BlocProvider.of<NewsBloc>(context).add(GetNewsEvent());
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is NewsDone) {
          return Column(
            children: [
              _buildSearch(),
              Expanded(child: _buildNews(getFilterBySearch(state.list))),
            ],
          );
        }
        if (state is NewsError) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [_buildError(),_buildSearch(), Expanded(child: _buildNews(getFilterBySearch(state.list)))],
          );
        }
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      },
    ));
  }

  Widget _buildError() => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              onPressed: () {
                BlocProvider.of<NewsBloc>(context).add(GetNewsEvent());
              },
              icon: const Icon(Icons.refresh)),
          const DefaultText("Refresh Updated News",style: TextStyles.bodyTextStyle,)
        ],
      );

  Widget _buildNews(List<NewsEntity> list) {
    List<NewsEntity> headerList = [];
    List<NewsEntity> bodyList = [];
    for (int i = 0; i < list.length; i++) {
      if (i < 4) {
        headerList.add(list[i]);
      } else {
        bodyList.add(list[i]);
      }
    }
    if (list.isNotEmpty) {
      return ListView(
        children: [ _buildHeader(headerList), const Divider(), _buildBody(bodyList)],
      );
    } else {
      return const NoDataWidget();
    }
  }

  Widget _buildSearch() {
    return Container(
      margin: const EdgeInsets.only(right: 17, left: 5, top: 8, bottom: 8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.grey[200]),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                style: TextStyles.textFieldsTextStyle(context),
                textInputAction: TextInputAction.search,
                controller: _searchController,
                decoration: InputDecoration(border: InputBorder.none, hintText: "Search for topics", hintStyle: TextStyles.textFieldsTextStyle(context)),
              ),
            ),
          ),
          if (_searchController.text.isNotEmpty)
            IconButton(
                onPressed: () {
                  setState(() {
                    _searchController.text = "";
                  });
                },
                icon: const Icon(
                  Icons.clear,
                  color: Colors.black,
                ))
        ],
      ),
    );
  }

  Widget _buildHeader(List<NewsEntity> list) {
    if (MediaQuery.sizeOf(context).width > mobileMaxWidth) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 1, child: HeaderNewsWidget(newsEntitiy: list.first)),
          if (list.length > 1)
            Expanded(
                flex: 2,
                child: Column(
                  children: list.sublist(1).map((e) => SubHeaderNewsWidget(newsEntitiy: e)).toList(),
                )),
        ],
      );
    } else {
      return Column(
        children: [HeaderNewsWidget(newsEntitiy: list.first), ...list.sublist(1).map((e) => SubHeaderNewsWidget(newsEntitiy: e)).toList()],
      );
    }
  }

  Widget _buildBody(List<NewsEntity> list) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: (MediaQuery.sizeOf(context).width > mobileMaxWidth) ? 2 : 1,
        mainAxisExtent: 100,
      ),
      itemBuilder: (_, index) => NewsWidget(newsEntitiy: list[index]),
    );
  }

  List<NewsEntity> getFilterBySearch(List<NewsEntity> list) {
    return list
        .where((e) =>
            (e.title?.toLowerCase().contains(_searchController.text.toLowerCase()) ?? false) ||
            (e.source?.toLowerCase().contains(_searchController.text.toLowerCase()) ?? false) ||
            (e.author?.toLowerCase().contains(_searchController.text.toLowerCase()) ?? false))
        .toList();
  }
}
