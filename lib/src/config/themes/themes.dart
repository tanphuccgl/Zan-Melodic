import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/constants/fonts.dart';

class XTheme {
  static ThemeData light() => ThemeData(
        scaffoldBackgroundColor: MyColors.colorBlack,
        textTheme: Style.textTheme(),
        fontFamily: Fonts.inter,
        snackBarTheme:
            const SnackBarThemeData(backgroundColor: MyColors.colorPrimary),
        primaryColor: MyColors.colorPrimary,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: MyColors.colorPrimary,
            textStyle: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, height: 1.42),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
      );
  static ThemeData dark() => ThemeData.dark();
}
