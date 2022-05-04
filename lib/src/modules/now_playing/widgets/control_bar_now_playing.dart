import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/constants/my_icons.dart';
import 'package:zanmelodic/src/modules/play_music/logic/play_music_bloc.dart';

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
          IconButton(
              iconSize: 40,
              onPressed: () => context.read<PlayMusicBloc>().onSkipToPrevious(),
              icon: Image.asset(
                MyIcons.skipIcon,
                color: MyColors.colorWhite,
              )),
          IconButton(
              iconSize: state.sizePlayIconCircled,
              onPressed: () {
                if (state.isEndSong) {
                  context.read<PlayMusicBloc>().onButtonPlayer(_song);
                }
                state.isPlaying
                    ? context.read<PlayMusicBloc>().onPause()
                    : context.read<PlayMusicBloc>().onButtonPlayer(_song);
              },
              icon: Image.asset(
                state.playIconCircled,
                color: MyColors.colorWhite,
              )),
          IconButton(
              iconSize: 40,
              onPressed: () => context.read<PlayMusicBloc>().onSkipToNext(),
              icon: Image.asset(
                MyIcons.endIcon,
                color: MyColors.colorWhite,
              ))
        ],
      );
    });
  }
}
