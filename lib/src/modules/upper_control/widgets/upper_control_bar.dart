import 'package:flutter/material.dart';
import 'package:zanmelodic/src/widgets/button/play_all_button.dart';
import 'package:zanmelodic/src/widgets/button/shuffle_button.dart';
import 'package:zanmelodic/src/widgets/button/sort_button.dart';

class UpperControlBar extends StatelessWidget {
  final VoidCallback? onPressedPlay;
  const UpperControlBar({
    Key? key,
    this.onPressedPlay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _sizeButton = 30.0;
    return SizedBox(
      width: double.infinity,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const SortButton(),
        Row(
          children: [
            const ShuffleButton(size: _sizeButton),
            PlayAllButton(
              onPressedPlay: onPressedPlay,
            )
          ],
        )
      ]),
    );
  }
}
