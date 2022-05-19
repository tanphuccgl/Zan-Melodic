import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:on_audio_room/details/rooms/favorites/favorites_entity.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/constants/my_padding.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/modules/audio_control/logic/audio_handle_bloc.dart';
import 'package:zanmelodic/src/modules/favorites/logic/favorites_bloc.dart';
import 'package:zanmelodic/src/modules/favorites/widgets/song_list_in_favorite.dart';
import 'package:zanmelodic/src/modules/songs/logic/song_list_bloc.dart';
import 'package:zanmelodic/src/modules/upper_control/widgets/upper_control_bar.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongListBloc, SongListState>(
        builder: (context, songState) {
      final XHandle<List<SongModel>> _handleSong = songState.songs;

      return BlocBuilder<FavoritesBloc, FavoritesState>(
          builder: (context, favoritesState) {
        final XHandle<List<FavoritesEntity>> _handleFavorites =
            favoritesState.items;
        final List<FavoritesEntity> _items = _handleFavorites.data ?? [];
        final _listSong = favoritesState.castFavoritesEntityToSong(
            listOfSongs: _handleSong.data ?? [], listOfFavoritesEntity: _items);
        return Scaffold(
          body: RefreshIndicator(
            color: MyColors.colorPrimary,
            backgroundColor: MyColors.colorWhite,
            onRefresh: () async =>
                context.read<FavoritesBloc>().fetchSongsFromFavorites(),
            child: Padding(
              padding: MyPadding.pPage,
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                      child: UpperControlBar(
                    onPressedPlay: () => context
                        .read<AudioHandleBloc>()
                        .skipToQueueItem(items: _listSong),
                  )),
                  const SongListFavoriteWidget(),
                ],
              ),
            ),
          ),
        );
      });
    });
  }
}
