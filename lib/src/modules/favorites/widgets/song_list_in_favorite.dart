import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:on_audio_room/details/rooms/favorites/favorites_entity.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/modules/audio_control/logic/audio_handle_bloc.dart';
import 'package:zanmelodic/src/modules/favorites/logic/favorites_bloc.dart';
import 'package:zanmelodic/src/modules/songs/logic/song_list_bloc.dart';
import 'package:zanmelodic/src/widgets/custom_card/song_card.dart';
import 'package:zanmelodic/src/widgets/state/state_empty_widget.dart';
import 'package:zanmelodic/src/widgets/state/state_error_widget.dart';
import 'package:zanmelodic/src/widgets/state/state_loading_widget.dart';

class SongListFavoriteWidget extends StatelessWidget {
  const SongListFavoriteWidget({Key? key}) : super(key: key);

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
                      padding: const EdgeInsets.only(bottom: 90),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return SongCard(
                            song: _listSong[index],
                            onTap: () =>
                                context.read<AudioHandleBloc>().skipToQueueItem(
                                      items: _listSong,
                                      index: index,
                                    ),
                          );
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
}
