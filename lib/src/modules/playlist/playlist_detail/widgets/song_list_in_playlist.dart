import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/modules/audio_control/logic/audio_handle_bloc.dart';
import 'package:zanmelodic/src/modules/playlist/playlist_detail/logic/playlist_detail_bloc.dart';
import 'package:zanmelodic/src/widgets/custom_card/song_card.dart';
import 'package:zanmelodic/src/widgets/state/state_empty_widget.dart';

class SongListInPlaylist extends StatelessWidget {
  const SongListInPlaylist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaylistDetailBloc, PlaylistDetailState>(
        builder: (context, playlistState) {
      return BlocBuilder<AudioHandleBloc, AudioHandleState>(
        builder: (context, state) {
          List<MediaItem> _items = state.playlist;

          return _items.isNotEmpty
              ? SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SongCard(
                            media: _items[index],
                            playlist: playlistState.playlist,
                            onTap: () => context
                                .read<AudioHandleBloc>()
                                .skipToQueueItem(_items, index, _items[index]),
                          )),
                      childCount: _items.length),
                )
              : const XStateEmptyWidget();
        },
      );
    });
  }
}
