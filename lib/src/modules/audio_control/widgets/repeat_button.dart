import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/modules/audio_control/logic/audio_handle_bloc.dart';
import 'package:zanmelodic/src/utils/enums/repeat_state.dart';

class RepeatButton extends StatelessWidget {
  const RepeatButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioHandleBloc, AudioHandleState>(
        builder: (context, state) {
      Icon icon;
      switch (state.repeatButton) {
        case RepeatState.off:
          icon = const Icon(Icons.repeat, color: MyColors.colorGray);
          break;
        case RepeatState.repeatSong:
          icon = const Icon(Icons.repeat_one, color: MyColors.colorPrimary);
          break;
        case RepeatState.repeatPlaylist:
          icon = const Icon(Icons.repeat, color: MyColors.colorPrimary);
          break;
      }
      return IconButton(
        icon: icon,
        onPressed: () {},
      );
    });
  }
}
