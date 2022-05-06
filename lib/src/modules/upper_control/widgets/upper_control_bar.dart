import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/constants/my_icons.dart';
import 'package:zanmelodic/src/modules/play_music/logic/play_music_bloc.dart';
import 'package:zanmelodic/src/modules/songs/logic/song_list_bloc.dart';
import 'package:zanmelodic/src/widgets/custom_ic_button/custom_icon_button_with_image.dart';

class UpperControlBar extends StatelessWidget {
  const UpperControlBar({
    Key? key,
    this.colorOfSortIcon = MyColors.colorWhite,
    this.colorOfShuffleIcon = MyColors.colorWhite,
    this.onPressedPlayer,
    required this.onPressedShuffle,
    required this.onPressedSort,
  }) : super(key: key);
  final VoidCallback onPressedSort;
  final VoidCallback onPressedShuffle;
  final VoidCallback? onPressedPlayer;
  final Color colorOfSortIcon;
  final Color colorOfShuffleIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        CustomIconButtonWithImage(
            size: 30,
            icon: MyIcons.sortIcon,
            onPressed: onPressedSort,
            color: colorOfSortIcon),
        Row(
          children: [
            CustomIconButtonWithImage(
                size: 30,
                icon: MyIcons.shuffleIcon,
                color: colorOfShuffleIcon,
                onPressed: onPressedShuffle),
            BlocBuilder<SongListBloc, SongListState>(builder: (context, state) {
              final _items = state.songs.data ?? [];
              return CustomIconButtonWithImage(
                icon: MyIcons.playIcon,
                size: 30,
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
}
