import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';

class XStateEmptyWidget extends StatelessWidget {
  const XStateEmptyWidget(
      {Key? key, this.isSliver = true, this.height = 120, this.width = 120})
      : super(key: key);
  final bool isSliver;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return isSliver
        ? SliverToBoxAdapter(
            child:
                SizedBox(height: height, width: width, child: _customEmpty()))
        : _customEmpty();
  }

  Widget _customEmpty() {
    return Center(
      child: Text('List Empty',
          style: Style.textTheme()
              .titleMedium!
              .copyWith(color: MyColors.colorWhite.withOpacity(0.5))),
    );
  }
}
