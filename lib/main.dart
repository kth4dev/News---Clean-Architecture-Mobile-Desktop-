import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyawthiha/presentation/bloc/news/news_bloc.dart';
import 'package:kyawthiha/presentation/bloc/saved_news/saved_news_bloc.dart';
import 'package:kyawthiha/presentation/bloc/theme/theme_cubit.dart';
import 'package:kyawthiha/presentation/screens/home/home_screen.dart';

import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (create) => sl<ThemeCubit>()),
        BlocProvider(create: (create) => sl<NewsBloc>()),
        BlocProvider(create: (create) => sl<SavedNewsBloc>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(title: 'Flutter Demo', theme: BlocProvider.of<ThemeCubit>(context).getTheme(), debugShowCheckedModeBanner: false, home: const HomeScreen());
        },
      ),
    );
  }
}
