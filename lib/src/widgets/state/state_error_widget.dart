import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';

class XStateErrorWidget extends StatelessWidget {
  const XStateErrorWidget({Key? key, this.isSliver = true}) : super(key: key);
  final bool isSliver;

  @override
  Widget build(BuildContext context) {
    return isSliver
        ? SliverToBoxAdapter(child: _customError())
        : _customError();
  }

  Widget _customError() {
    return Center(
      child:
          Text('Please try again later', style: Style.textTheme().titleMedium),
    );
  }
}
