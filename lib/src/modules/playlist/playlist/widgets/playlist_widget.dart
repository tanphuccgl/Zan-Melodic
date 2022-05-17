import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/modules/playlist/playlist/logic/playlist_bloc.dart';
import 'package:zanmelodic/src/modules/playlist/playlist_detail/logic/playlist_detail_bloc.dart';
import 'package:zanmelodic/src/modules/playlist/router/playlist_router.dart';
import 'package:zanmelodic/src/modules/songs/logic/song_list_bloc.dart';
import 'package:zanmelodic/src/utils/utils.dart';
import 'package:zanmelodic/src/widgets/image_widget/custom_image_widget.dart';
import 'package:zanmelodic/src/widgets/state/state_error_widget.dart';
import 'package:zanmelodic/src/widgets/state/state_loading_widget.dart';

class PlaylistWidget extends StatelessWidget {
  const PlaylistWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaylistBloc, PlaylistState>(
      builder: (context, state) {
        XHandle<List<PlaylistModel>> _handle = state.items;
        if (_handle.isCompleted) {
          final List<PlaylistModel> _items = _handle.data ?? [];
          state.isSortName
              ? state.sortListByName(reverse: true)
              : state.sortListByName();
          state.isShuffle ? _items.shuffle() : null;
          return _items.isNotEmpty
              ? _buildGirdView(context, playlists: _items)
              : _emptyListWidget(context);
        } else if (_handle.isLoading) {
          return const XStateLoadingWidget();
        } else {
          return const XStateErrorWidget();
        }
      },
    );
  }

  Widget _buildGirdView(BuildContext context,
      {required List<PlaylistModel> playlists}) {
    final _listLeft = [];
    final _listRight = [];
    for (var i = 0; i < playlists.length; i++) {
      i % 2 == 0 ? _listLeft.add(playlists[i]) : _listRight.add(playlists[i]);
    }
    return SliverToBoxAdapter(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                children: _listLeft
                    .map((e) => _itemCard(context,
                        playlist: e, width: 178, height: 162))
                    .toList(),
              ),
              playlists.length % 2 == 0
                  ? _itemCardAddNewPlaylist(context, width: 178, height: 162)
                  : const SizedBox.shrink()
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                children: _listRight
                    .map((e) => _itemCard(context,
                        playlist: e, width: 178, height: 162))
                    .toList(),
              ),
              playlists.length % 2 != 0
                  ? _itemCardAddNewPlaylist(context, width: 178, height: 162)
                  : const SizedBox.shrink()
            ],
          ),
        ),
      ],
    ));
  }

  Widget _itemCard(
    BuildContext context, {
    required PlaylistModel playlist,
    required double width,
    required double height,
  }) {
    return BlocBuilder<SongListBloc, SongListState>(
      builder: (context, state) {
        return GestureDetector(
            onTap: () => context
                .read<PlaylistDetailBloc>()
                .fetchListOfSongsFromPlaylist(context,
                    playlist: playlist, songs: state.songs.data ?? []),
            onLongPress: () => PlaylistCoordinator.showDialogRemovePlaylist(
                context,
                playlist: playlist),
            child: Padding(
                padding: const EdgeInsets.all(3.5),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomImageWidget(
                      id: playlist.id,
                      height: width,
                      width: height,
                      artworkType: ArtworkType.PLAYLIST,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(playlist.playlist,
                            style: Style.textTheme().titleMedium),
                        Text(XUtils.formatNumberSong(playlist.numOfSongs),
                            style: Style.textTheme().titleMedium),
                      ],
                    ),
                  ],
                )));
      },
    );
  }

  Widget _itemCardAddNewPlaylist(
    BuildContext context, {
    required double width,
    required double height,
  }) {
    return GestureDetector(
        onTap: () => PlaylistCoordinator.showDialogCreatePlaylist(context),
        child: Padding(
            padding: const EdgeInsets.all(3.5),
            child: Container(
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: MyColors.colorWhite,
                ),
                height: height,
                child: const Icon(
                  Icons.add,
                  color: MyColors.colorPrimary,
                  size: 60,
                ))));
  }

  Widget _emptyListWidget(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: TextButton(
            onPressed: () =>
                PlaylistCoordinator.showDialogCreatePlaylist(context),
            child: Text('Click here to create a new playlist',
                textAlign: TextAlign.center,
                style: Style.textTheme().titleMedium)),
      ),
    );
  }
}
