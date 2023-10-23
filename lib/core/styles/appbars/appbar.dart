import 'package:flutter/material.dart';
import 'package:kyawthiha/core/widgets/theme_switch_widget.dart';

import '../text/default_text.dart';
import '../text/textstyles.dart';


AppBar defaultAppBar(BuildContext context, {required final String title}) {
  return AppBar(
    title: DefaultText(
      title,
      style: TextStyles.appBarTextStyle,
    ),
    actions: [
      ThemeSwitchWidget()
    ],
  );
}

AppBar appBarWithSubTitle(BuildContext context, {required final String title,required final String subTitle}) {
  return AppBar(
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultText(
          title,
          style: TextStyles.appBarTextStyle,
        ),
        DefaultText(
          subTitle,
          style: TextStyles.descriptionTextStyle,
        ),
      ],
    ),
  );
}


AppBar appBarWithIcons(BuildContext context, {required final String title,required final List<Widget> actions}) {
  return AppBar(
    title: DefaultText(
      title,
      style: TextStyles.appBarTextStyle,
    ),
    actions: actions,
  );
}


AppBar appBarWithSubTitleAndIcons(BuildContext context, {required final String title,required final String subTitle,required final List<Widget> actions}) {
  return AppBar(
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultText(
          title,
          style: TextStyles.appBarTextStyle,
        ),
        DefaultText(
          subTitle,
          style: TextStyles.descriptionTextStyle,
        ),
      ],
    ),
    actions: actions,
  );
}

