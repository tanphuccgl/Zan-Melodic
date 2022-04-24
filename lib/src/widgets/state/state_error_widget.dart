import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';

class XStateErrorWidget extends StatelessWidget {
  const XStateErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: Text('Please try again later',
            style: Style.textTheme().titleMedium),
      ),
    );
  }
}
