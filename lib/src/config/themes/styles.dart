import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';

class Style {
  static TextTheme textTheme() => const TextTheme(
        labelMedium: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.normal,
            height: 1,
            color: MyColors.colorGray6),
        titleMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            height: 1.2,
            color: MyColors.colorWhite),
        titleLarge: TextStyle(
            fontSize: 41,
            fontWeight: FontWeight.bold,
            height: 1,
            color: MyColors.colorWhite),
        displaySmall: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.normal,
            height: 1.2,
            color: MyColors.colorWhite),
        displayLarge: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            height: 1.22,
            color: MyColors.colorWhite),
      );
}
