import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:on_audio_room/details/rooms/favorites/favorites_entity.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/modules/favorites/logic/favorites_bloc.dart';
import 'package:zanmelodic/src/modules/favorites/router/favorites_router.dart';
import 'package:zanmelodic/src/modules/songs/logic/song_list_bloc.dart';
import 'package:zanmelodic/src/widgets/image_widget/custom_image_widget.dart';
import 'package:zanmelodic/src/widgets/state/state_empty_widget.dart';
import 'package:zanmelodic/src/widgets/state/state_error_widget.dart';
import 'package:zanmelodic/src/widgets/state/state_loading_widget.dart';

class SongFavotiresWidget extends StatelessWidget {
  const SongFavotiresWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongListBloc, SongListState>(
      builder: (context, songState) {
        final XHandle<List<SongModel>> _handleSong = songState.songs;

        return BlocBuilder<FavoritesBloc, FavoritesState>(
          builder: (context, favoritesState) {
            final XHandle<List<FavoritesEntity>> _handleFavorites =
                favoritesState.items;
            if (_handleFavorites.isCompleted && _handleSong.isCompleted) {
              final List<FavoritesEntity> _items = _handleFavorites.data ?? [];
              final _listSong = favoritesState.castFavoritesEntityToSong(
                  listOfSongs: _handleSong.data ?? [],
                  listOfFavoritesEntity: _items);
              return _listSong.isNotEmpty
                  ? SliverPadding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 100),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return Padding(
                              padding: const EdgeInsets.fromLTRB(0, 6, 20, 6),
                              child: _buildCard(context,
                                  song: _listSong[index], songs: _listSong));
                        }, childCount: _listSong.length),
                      ),
                    )
                  : const XStateEmptyWidget();
            } else if (_handleFavorites.isLoading || _handleSong.isLoading) {
              return const XStateLoadingWidget();
            } else {
              return const XStateErrorWidget();
            }
          },
        );
      },
    );
  }

  Widget _buildCard(BuildContext context,
      {required SongModel song, required List<SongModel> songs}) {
    return GestureDetector(
      onLongPress: () => FavoritesCoordinator.showDialogRemoveFromFavorites(
          context,
          song: song),

      ///  onTap: () => context.read<AudioHandleBloc>().playMediaItem(songs, song),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomImageWidget(
            id: song.id,
            height: 70.0,
            width: 70.0,
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${song.title}\n',
                  style: Style.textTheme().titleMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(song.artist ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Style.textTheme()
                        .titleMedium!
                        .copyWith(fontSize: 17, color: MyColors.colorGray))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
