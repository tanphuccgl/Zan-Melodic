import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/config/routes/coordinator.dart';
import 'package:zanmelodic/src/constants/my_properties.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/modules/artist/artist_detail/logic/artist_detail_bloc.dart';
import 'package:zanmelodic/src/modules/audio_control/logic/audio_handle_bloc.dart';
import 'package:zanmelodic/src/modules/audio_control/pages/player_bottom_bar.dart';
import 'package:zanmelodic/src/widgets/base/base_appbar_detail.dart';
import 'package:zanmelodic/src/widgets/base/base_screen.dart';
import 'package:zanmelodic/src/widgets/base/base_songs.dart';

class ArtistDetailPage extends StatelessWidget {
  const ArtistDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioHandleBloc, AudioHandleState>(
        builder: (context, audioState) {
      return BlocBuilder<ArtistDetailBloc, ArtistDetailState>(
          builder: (context, state) {
        final XHandle<List<SongModel>> _handle = state.items;
        final List<SongModel> _items = _handle.data ?? [];
        return GestureDetector(
          onDoubleTap: () => XCoordinator.pop(context),
          child: BaseScaffold<SongModel>(
            onRefresh: () => context
                .read<ArtistDetailBloc>()
                .fetchListOfSongsFromArtist(context, artist: state.artist),
            handle: _handle,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: const PlayerBottomBar(),
            child: Padding(
              padding: audioState.isShowBottomBar == true
                  ? MyProperties.pBottomBar
                  : EdgeInsets.zero,
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  BaseAppBarDetail(
                      artist: state.artist,
                      numberSongs: state.artist.numberOfTracks ?? -1,
                      songs: _items),
                  BaseSongs(
                      songs: _items, pHori: MyProperties.pHoriDetailScreen),
                ],
              ),
            ),
          ),
        );
      });
    });
  }
}
