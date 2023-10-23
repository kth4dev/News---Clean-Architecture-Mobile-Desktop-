import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../core/styles/theme/themes.dart';
import '../../../core/values/constants.dart';
import '../../../data/data_sources/local/cache/cache_helper.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeInitial(''));

  void setDarkMode() => emit(const SetTheme(theme: 'dark'));

  void setLightMode() => emit(const SetTheme(theme: 'light'));

  getTheme() {
    String theme = state.theme;
    if (theme == "dark") {
      return darkTheme;
    } else if (theme == "light") {
      return lightTheme;
    } else if (CacheHelper.getData(key: isDarkModeKey) != null) {
      return (CacheHelper.getData(key: isDarkModeKey)) ? darkTheme : lightTheme;
    } else {
      return ThemeData.light();
    }
  }
}
