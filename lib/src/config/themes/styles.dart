import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';

class Style {
  static TextTheme textTheme() => const TextTheme(
        labelMedium: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.normal,
            height: 1,
            color: MyColors.colorGray6),
      );
}
