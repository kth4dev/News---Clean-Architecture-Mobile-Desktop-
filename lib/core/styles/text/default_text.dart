import 'package:flutter/material.dart';

class DefaultText extends StatelessWidget {
  final String label;
  final TextStyle style;
  final int? maxLine;
  const DefaultText(this.label,{Key? key,required this.style,this.maxLine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(label, style: style,textScaleFactor: 1,maxLines: this.maxLine,);
  }
}
