import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';

class ImageButton extends StatelessWidget {
  final double size;
  final VoidCallback onPressed;
  final String icon;
  final Color color;
  const ImageButton({
    Key? key,
    this.size = 40,
    required this.onPressed,
    required this.icon,
    this.color = MyColors.colorWhite,
  }) : super(key: key);

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
