import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';

class XStateLoadingWidget extends StatelessWidget {
  const XStateLoadingWidget({Key? key, this.isSliver = true}) : super(key: key);
  final bool isSliver;

  @override
  Widget build(BuildContext context) {
    return isSliver
        ? SliverToBoxAdapter(child: _customLoading())
        : _customLoading();
  }

  Widget _customLoading() {
    return const Center(
      child: CircularProgressIndicator(color: MyColors.colorPrimary),
    );
  }
}
