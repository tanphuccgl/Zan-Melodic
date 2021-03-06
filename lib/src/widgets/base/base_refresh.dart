import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';

class BaseRefresh extends StatelessWidget {
  final Widget child;
  final Future<void> Function() onRefresh;
  const BaseRefresh({
    Key? key,
    required this.child,
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: MyColors.colorPrimary,
      backgroundColor: MyColors.colorWhite,
      onRefresh: onRefresh,
      child: child,
    );
  }
}
