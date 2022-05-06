import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';

class CustomIconButtonWithImage extends StatelessWidget {
  const CustomIconButtonWithImage({
    Key? key,
    this.size = 40,
    required this.onPressed,
    required this.icon,
    this.color = MyColors.colorWhite,
  }) : super(key: key);
  final double size;
  final VoidCallback onPressed;
  final String icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        iconSize: size,
        onPressed: onPressed,
        icon: Image.asset(
          icon,
          color: color,
        ));
  }
}
