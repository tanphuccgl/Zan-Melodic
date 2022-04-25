import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';

class XStateLoadingWidget extends StatelessWidget {
  const XStateLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Center(
        child: CircularProgressIndicator(color: MyColors.colorPrimary),
      ),
    );
  }
}
