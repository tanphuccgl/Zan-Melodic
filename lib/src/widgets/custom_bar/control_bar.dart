import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/modules/play_music/logic/play_music_bloc.dart';
import 'package:zanmelodic/src/modules/songs/logic/song_list_bloc.dart';

class ControlBar extends StatelessWidget {
  const ControlBar({Key? key, required this.songList}) : super(key: key);
  final List<SongModel> songList;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayMusicBloc, PlayMusicState>(
      builder: (context, state) {
        return BlocBuilder<SongListBloc, SongListState>(
          builder: (context, songState) {
            return SliverToBoxAdapter(
              child: SizedBox(
                width: double.infinity,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _customIconButton(
                          icon: Icons.sort,
                          onPressed: () =>
                              context.read<SongListBloc>().onSortNameToList()),
                      Row(
                        children: [
                          _customIconButton(
                              icon: songState.shuffleIcon,
                              onPressed: () => context
                                  .read<SongListBloc>()
                                  .onShuffleToList()),
                          _customIconButton(
                            icon: Icons.play_arrow,
                            onPressed: () => context
                                .read<PlayMusicBloc>()
                                .onPlayerItem(songList: songList),
                          ),
                        ],
                      )
                    ]),
              ),
            );
          },
        );
      },
    );
  }

  IconButton _customIconButton(
      {required IconData icon, required VoidCallback onPressed}) {
    return IconButton(
        onPressed: onPressed,
        iconSize: 30,
        icon: Icon(icon, color: MyColors.colorWhite));
  }
}
