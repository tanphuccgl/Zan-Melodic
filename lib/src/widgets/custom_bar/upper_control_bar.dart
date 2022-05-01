import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/modules/play_music/logic/play_music_bloc.dart';
import 'package:zanmelodic/src/modules/songs/logic/song_list_bloc.dart';

class UpperControlBar extends StatelessWidget {
  const UpperControlBar({
    Key? key,
    this.iconSort,
    this.iconShuffle,
    this.onPressedPlayer,
    this.onPressedShuffle,
    this.onPressedSort,
  }) : super(key: key);
  final VoidCallback? onPressedSort;
  final VoidCallback? onPressedShuffle;
  final VoidCallback? onPressedPlayer;
  final IconData? iconSort;
  final IconData? iconShuffle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        _customIconButton(
            icon: iconSort ?? Icons.sort, onPressed: onPressedSort ?? () {}),
        Row(
          children: [
            BlocBuilder<PlayMusicBloc, PlayMusicState>(
              builder: (context, state) {
                return _customIconButton(
                    icon: iconShuffle ?? Icons.shuffle,
                    onPressed: onPressedShuffle ?? () {});
              },
            ),
            BlocBuilder<SongListBloc, SongListState>(builder: (context, state) {
              final _items = state.items.data ?? [];
              return _customIconButton(
                icon: Icons.play_arrow,
                onPressed: onPressedPlayer ??
                    () => context
                        .read<PlayMusicBloc>()
                        .onPlayerItem(songList: _items),
              );
            }),
          ],
        )
      ]),
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
