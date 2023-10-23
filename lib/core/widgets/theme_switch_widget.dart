import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_sources/local/cache/cache_helper.dart';
import '../../presentation/bloc/theme/theme_cubit.dart';
import '../values/constants.dart';

class ThemeSwitchWidget extends StatefulWidget {
  const ThemeSwitchWidget({super.key});

  @override
  State<ThemeSwitchWidget> createState() => _ThemeSwitchWidgetState();
}

class _ThemeSwitchWidgetState extends State<ThemeSwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        bool value = CacheHelper.getData(key: isDarkModeKey) ?? false;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Icon(Icons.light_mode_outlined),
              Switch(
                value: value,
                onChanged: (value) {
                  CacheHelper.saveData(key: isDarkModeKey, value: value);
                  value ? BlocProvider.of<ThemeCubit>(context).setDarkMode() : BlocProvider.of<ThemeCubit>(context).setLightMode();
                  setState(() {
                    value = value;
                  });
                },
              ),
              const Icon(Icons.dark_mode_outlined),
            ],
          ),
        );
      },
    );
  }
}
