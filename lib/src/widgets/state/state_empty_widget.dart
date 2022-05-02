import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';

class XStateEmptyWidget extends StatelessWidget {
  const XStateEmptyWidget({Key? key, this.isSliver = true}) : super(key: key);
  final bool isSliver;

  @override
  Widget build(BuildContext context) {
    return isSliver
        ? SliverToBoxAdapter(child: _customEmpty())
        : _customEmpty();
  }

  Widget _customEmpty() {
    return Center(
      child: Text('List Empty', style: Style.textTheme().titleMedium),
    );
  }
}
