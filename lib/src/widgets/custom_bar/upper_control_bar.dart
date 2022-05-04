import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/constants/my_icons.dart';
import 'package:zanmelodic/src/modules/play_music/logic/play_music_bloc.dart';
import 'package:zanmelodic/src/modules/songs/logic/song_list_bloc.dart';

class UpperControlBar extends StatelessWidget {
  const UpperControlBar({
    Key? key,
    this.colorIconSort = MyColors.colorWhite,
    this.colorIconShuffle = MyColors.colorWhite,
    this.onPressedPlayer,
    this.onPressedShuffle,
    this.onPressedSort,
  }) : super(key: key);
  final VoidCallback? onPressedSort;
  final VoidCallback? onPressedShuffle;
  final VoidCallback? onPressedPlayer;
  final Color colorIconSort;
  final Color colorIconShuffle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        _customIconButton(
            icon: MyIcons.sortIcon,
            onPressed: onPressedSort ?? () {},
            color: colorIconSort),
        Row(
          children: [
            BlocBuilder<PlayMusicBloc, PlayMusicState>(
              builder: (context, state) {
                return _customIconButton(
                    icon: MyIcons.shuffleIcon,
                    color: colorIconShuffle,
                    onPressed: onPressedShuffle ?? () {});
              },
            ),
            BlocBuilder<SongListBloc, SongListState>(builder: (context, state) {
              final _items = state.items.data ?? [];
              return _customIconButton(
                icon: MyIcons.playIcon,
                color: MyColors.colorWhite,
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
      {required String icon,
      required VoidCallback onPressed,
      required Color color}) {
    return IconButton(
        onPressed: onPressed,
        iconSize: 30,
        icon: Image.asset(icon, color: color));
  }
}
