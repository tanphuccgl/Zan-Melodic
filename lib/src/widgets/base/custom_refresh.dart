import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';

class CustomRefresh extends StatelessWidget {
  const CustomRefresh({
    Key? key,
    required this.child,
    required this.onRefresh,
  }) : super(key: key);
  final Widget child;
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: MyColors.colorPrimary,
      backgroundColor: MyColors.colorWhite,
      onRefresh: () async => onRefresh,
      child: child,
    );
  }
}
