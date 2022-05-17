import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';

class CusText extends StatelessWidget {
  final String title;
  final TextStyle? style;
  const CusText({Key? key, required this.title, this.style}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: style ??
            Style.textTheme().titleMedium!.copyWith(
                color: MyColors.colorGray, fontSize: 17, height: 1.23));
  }
}
