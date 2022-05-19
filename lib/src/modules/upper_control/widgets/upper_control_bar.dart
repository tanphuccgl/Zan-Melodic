import 'package:flutter/material.dart';
import 'package:zanmelodic/src/constants/my_icons.dart';
import 'package:zanmelodic/src/modules/audio_control/widgets/shuffle_button.dart';
import 'package:zanmelodic/src/modules/audio_control/widgets/sort_button.dart';
import 'package:zanmelodic/src/widgets/button/image_button.dart';

class UpperControlBar extends StatelessWidget {
  final VoidCallback onPressedPlay;
  final VoidCallback? onPressedSort;
  const UpperControlBar(
      {Key? key, required this.onPressedPlay, this.onPressedSort})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SortButton(
          onPressed: onPressedSort,
        ),
        Row(
          children: [
            const ShuffleButton(size: 30),
            ImageButton(
              icon: MyIcons.playIcon,
              size: 30,
              onPressed: onPressedPlay,
            )
          ],
        )
      ]),
    );
  }
}
