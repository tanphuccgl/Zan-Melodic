import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/constants/my_icons.dart';
import 'package:zanmelodic/src/modules/album/album/logic/album_bloc.dart';
import 'package:zanmelodic/src/modules/album/album_detail/logic/album_detail_bloc.dart';
import 'package:zanmelodic/src/modules/artist/artist/logic/artist_bloc.dart';
import 'package:zanmelodic/src/modules/artist/artist_detail/logic/artist_detail_bloc.dart';
import 'package:zanmelodic/src/modules/favorites/logic/favorites_bloc.dart';
import 'package:zanmelodic/src/modules/folder/logic/folder_bloc.dart';
import 'package:zanmelodic/src/modules/genre/genre/logic/genre_bloc.dart';
import 'package:zanmelodic/src/modules/genre/genre_detail/logic/genre_detail_bloc.dart';
import 'package:zanmelodic/src/modules/playlist/playlist/logic/playlist_bloc.dart';
import 'package:zanmelodic/src/modules/playlist/playlist_detail/logic/playlist_detail_bloc.dart';
import 'package:zanmelodic/src/modules/songs/logic/songs_bloc.dart';
import 'package:zanmelodic/src/widgets/button/image_button.dart';

class ShuffleButton extends StatelessWidget {
  const ShuffleButton({Key? key, this.size = 40}) : super(key: key);
  final double size;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongsBloc, SongsState>(builder: (context, state) {
      return ImageButton(
        size: size,
        onPressed: () {
          context.read<AlbumBloc>().onShuffleToList();
          context.read<FavoritesBloc>().onShuffleToList();
          context.read<SongsBloc>().onShuffleToList();
          context.read<PlaylistBloc>().onShuffleToList();
          context.read<FolderBloc>().onShuffleToList();
          context.read<PlaylistDetailBloc>().onShuffleToList();
          context.read<AlbumDetailBloc>().onShuffleToList();
          context.read<ArtistBloc>().onShuffleToList();
          context.read<ArtistDetailBloc>().onShuffleToList();
          context.read<GenreBloc>().onShuffleToList();
          context.read<GenreDetailBloc>().onShuffleToList();
        },
        icon: MyIcons.shuffleIcon,
        color: state.isShuffle ? MyColors.colorPrimary : MyColors.colorWhite,
      );
    });
  }
}
