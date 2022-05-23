import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';

class LyricEmpty extends StatelessWidget {
  const LyricEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
        child: Padding(
      padding: EdgeInsets.only(top: size.height / 3),
      child: Center(
          child: Text('No lyrics for this song',
              style: Style.textTheme().titleMedium)),
    ));
  }
}
