import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/modules/favorites/logic/favorites_bloc.dart';
import 'package:zanmelodic/src/modules/playlist/router/playlist_router.dart';
import 'package:zanmelodic/src/widgets/custom_text/custom_text.dart';
import 'package:zanmelodic/src/widgets/image_widget/custom_image_widget.dart';

class SongCard extends StatelessWidget {
  final SongModel song;
  final VoidCallback? onTap;
  final PlaylistModel? playlistModel;
  const SongCard({
    Key? key,
    required this.song,
    this.onTap,
    this.playlistModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: playlistModel != null
          ? () => PlaylistCoordinator.showDialogRemoveFromPlaylist(context,
              song: song, playlist: playlistModel!)
          : () =>
              PlaylistCoordinator.showDialogAddToPlaylist(context, song: song),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13),
        child: SizedBox(
          height: 70,
          width: 70,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 8,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 70,
                        child: CustomImageWidget(
                          id: song.id,
                          height: 70.0,
                          width: 70.0,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CusText(
                              title: '${song.title}\n',
                              style: Style.textTheme().titleMedium,
                            ),
                            CusText(
                                title: song.artist ?? '',
                                style: Style.textTheme().titleMedium!.copyWith(
                                    fontSize: 17, color: MyColors.colorGray))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                _favoriteButton(context, song)
              ]),
        ),
      ),
    );
  }

  Widget _favoriteButton(BuildContext context, SongModel song) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        return Expanded(
          flex: 2,
          child: IconButton(
            onPressed: () => state.isFavorites(song.id)
                ? context
                    .read<FavoritesBloc>()
                    .removeFromFavorites(context, idSong: song.id)
                : context.read<FavoritesBloc>().addToFavorites(song),
            icon: Icon(
              state.isFavorites(song.id)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: MyColors.colorWhite,
            ),
            iconSize: 25,
          ),
        );
      },
    );
  }
}
