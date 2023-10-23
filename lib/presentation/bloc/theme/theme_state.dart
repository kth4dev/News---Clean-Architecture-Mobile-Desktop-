part of 'theme_cubit.dart';

@immutable
abstract class ThemeState {
  final String theme;
  const ThemeState(this.theme);
}

class ThemeInitial extends ThemeState {
  const ThemeInitial(String theme) : super(theme);
}

class SetTheme extends ThemeState {
  const SetTheme({required String theme}) : super(theme);
}
