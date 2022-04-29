import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
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
          SizedBox(
            width: 60,
            height: 60,
            child: IconButton(
                onPressed: () =>
                    context.read<PlayMusicBloc>().onSkipToPrevious(),
                icon: const Icon(
                  Icons.skip_previous,
                  color: MyColors.colorWhite,
                  size: 40,
                )),
          ),
          SizedBox(
            width: 60,
            height: 60,
            child: IconButton(
                onPressed: () {
                  if (state.isEndSong) {
                    context.read<PlayMusicBloc>().onButtonPlayer(_song);
                  }
                  state.isPlaying
                      ? context.read<PlayMusicBloc>().onPause()
                      : context.read<PlayMusicBloc>().onButtonPlayer(_song);
                },
                icon: Icon(
                  state.playIcon,
                  color: MyColors.colorWhite,
                  size: 40,
                )),
          ),
          SizedBox(
            width: 60,
            height: 60,
            child: IconButton(
                onPressed: () => context.read<PlayMusicBloc>().onSkipToNext(),
                icon: const Icon(
                  Icons.skip_next,
                  color: MyColors.colorWhite,
                  size: 40,
                )),
          )
        ],
      );
    });
  }
}
