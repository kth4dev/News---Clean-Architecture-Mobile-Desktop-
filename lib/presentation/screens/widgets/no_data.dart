import 'package:flutter/material.dart';

import '../../../core/styles/text/default_text.dart';
import '../../../core/styles/text/textstyles.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Icon(Icons.hourglass_empty), DefaultText("No Data", style: TextStyles.bodyTextStyle)],
      ),
    );
  }
}
