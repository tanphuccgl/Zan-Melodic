import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';

class XStateEmptyWidget extends StatelessWidget {
  const XStateEmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: Text('List Empty', style: Style.textTheme().titleMedium),
      ),
    );
  }
}
