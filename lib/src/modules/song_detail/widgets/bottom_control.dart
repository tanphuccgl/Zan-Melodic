import 'package:flutter/material.dart';
import 'package:zanmelodic/src/modules/song_detail/widgets/process_bar.dart';
import 'package:zanmelodic/src/widgets/button/next_button.dart';
import 'package:zanmelodic/src/widgets/button/play_button.dart';
import 'package:zanmelodic/src/widgets/button/previous_button.dart';
import 'package:zanmelodic/src/widgets/button/repeat_button.dart';
import 'package:zanmelodic/src/widgets/button/shuffle_button.dart';

class BottomControl extends StatelessWidget {
  const BottomControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [ShuffleButton(), RepeatButton()],
        ),
        const ProcessBar(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [PreviousButton(), PlayButton(), NextButton()],
        )
      ],
    );
  }
}
