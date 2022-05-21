import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/config/routes/coordinator.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/modules/album/album_detail/logic/album_detail_bloc.dart';
import 'package:zanmelodic/src/modules/album/album_detail/widgets/appbar_album_detail.dart';
import 'package:zanmelodic/src/modules/album/album_detail/widgets/song_list_in_album.dart';
import 'package:zanmelodic/src/modules/audio_control/logic/audio_handle_bloc.dart';
import 'package:zanmelodic/src/modules/audio_control/pages/player_bottom_bar.dart';
import 'package:zanmelodic/src/widgets/base/base_screen.dart';

class AlbumDetailPage extends StatelessWidget {
  const AlbumDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioHandleBloc, AudioHandleState>(
        builder: (context, audioState) {
      return BlocBuilder<AlbumDetailBloc, AlbumDetailState>(
          builder: (context, state) {
        final XHandle<List<SongModel>> _handle = state.items;
        final List<SongModel> _items = _handle.data ?? [];
        return GestureDetector(
          onDoubleTap: () => XCoordinator.pop(context),
          child: BaseScaffold<SongModel>(
            onRefresh: () => context
                .read<AlbumDetailBloc>()
                .fetchListOfSongsFromAlbum(context, album: state.album),
            handle: _handle,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: const PlayerBottomBar(),
            child: Padding(
              padding: audioState.isShowBottomBar == true
                  ? const EdgeInsets.only(bottom: 90)
                  : EdgeInsets.zero,
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  AppBarAlbumDetail(
                      album: state.album,
                      numberSongs: state.album.numOfSongs,
                      songs: _items),
                  SongListInAlbum(songs: _items),
                ],
              ),
            ),
          ),
        );
      });
    });
  }
}
