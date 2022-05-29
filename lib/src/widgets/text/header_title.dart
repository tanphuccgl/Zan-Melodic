import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Text(
        title,
        style: Style.textTheme().titleLarge,
      ),
    );
  }
}
