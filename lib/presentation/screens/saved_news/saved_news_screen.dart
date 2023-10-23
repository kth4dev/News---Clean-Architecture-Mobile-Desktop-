import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyawthiha/presentation/bloc/saved_news/saved_news_bloc.dart';
import 'package:kyawthiha/presentation/screens/news/widgets/news_widget.dart';
import 'package:kyawthiha/presentation/screens/saved_news/widgets/saved_news_widget.dart';
import 'package:kyawthiha/presentation/screens/widgets/no_data.dart';

class SavedNewsScreen extends StatefulWidget {
  const SavedNewsScreen({super.key});

  @override
  State<SavedNewsScreen> createState() => _SavedNewsScreenState();
}

class _SavedNewsScreenState extends State<SavedNewsScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedNewsBloc, SavedNewsState>(builder: (context, state) {
      if (state is SavedNewsDone) {
        if(state.list.isNotEmpty){
          return ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                return SavedNewsWidget(newsEntitiy: state.list[index]);
              });
        }else{
          return const NoDataWidget();
        }

      }

      return const Center(
        child: CupertinoActivityIndicator(),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<SavedNewsBloc>(context).add(GetSavedNewsEvent());
  }
}
