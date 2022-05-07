import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/constants/my_icons.dart';
import 'package:zanmelodic/src/modules/play_music/logic/play_music_bloc.dart';
import 'package:zanmelodic/src/widgets/custom_ic_button/custom_icon_button_with_image.dart';

class ControlBarNowPlaying extends StatelessWidget {
  const ControlBarNowPlaying({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayMusicBloc, PlayMusicState>(
        builder: (context, state) {
      final _song = state.song;

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButtonWithImage(
            icon: MyIcons.skipIcon,
            onPressed: () => context.read<PlayMusicBloc>().onSkipToPrevious(),
          ),
          CustomIconButtonWithImage(
            icon: state.playIconCircled,
            onPressed: () {
              if (state.isEndSong) {
                context.read<PlayMusicBloc>().onButtonPlayer(_song);
              }
              state.isPlaying
                  ? context.read<PlayMusicBloc>().onPause()
                  : context.read<PlayMusicBloc>().onButtonPlayer(_song);
            },
            size: state.sizePlayIconCircled,
          ),
          CustomIconButtonWithImage(
            icon: MyIcons.endIcon,
            onPressed: () => context.read<PlayMusicBloc>().onSkipToNext(),
          ),
        ],
      );
    });
  }
}
