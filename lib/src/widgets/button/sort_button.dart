import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/constants/my_icons.dart';
import 'package:zanmelodic/src/modules/album/album/logic/album_bloc.dart';
import 'package:zanmelodic/src/modules/album/album_detail/logic/album_detail_bloc.dart';
import 'package:zanmelodic/src/modules/favorites/logic/favorites_bloc.dart';
import 'package:zanmelodic/src/modules/folder/logic/folder_bloc.dart';
import 'package:zanmelodic/src/modules/playlist/playlist/logic/playlist_bloc.dart';
import 'package:zanmelodic/src/modules/playlist/playlist_detail/logic/playlist_detail_bloc.dart';
import 'package:zanmelodic/src/modules/songs/logic/songs_bloc.dart';
import 'package:zanmelodic/src/widgets/button/image_button.dart';

class SortButton extends StatelessWidget {
  const SortButton({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongsBloc, SongsState>(builder: (context, state) {
      return ImageButton(
        size: 30,
        onPressed: () {
          context.read<AlbumBloc>().onSortNameToList();
          context.read<FavoritesBloc>().onSortNameToList();
          context.read<SongsBloc>().onSortNameToList();
          context.read<PlaylistBloc>().onSortNameToList();
          context.read<FolderBloc>().onSortNameToList();
          context.read<PlaylistDetailBloc>().onSortNameToList();
          context.read<AlbumDetailBloc>().onSortNameToList();
        },
        icon: MyIcons.sortIcon,
        color: state.isSortName ? MyColors.colorPrimary : MyColors.colorWhite,
      );
    });
  }
}
