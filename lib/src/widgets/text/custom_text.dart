import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';

class XText extends StatelessWidget {
  final String title;
  final TextStyle? style;
  final int maxLines;
  const XText({Key? key, required this.title, this.style, this.maxLines = 1})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(title,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: style ??
            Style.textTheme().titleMedium!.copyWith(
                color: MyColors.colorGray, fontSize: 17, height: 1.23));
  }
}
