import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/modules/audio_control/logic/audio_handle_bloc.dart';
import 'package:zanmelodic/src/widgets/custom_card/song_card.dart';
import 'package:zanmelodic/src/widgets/state/state_empty_widget.dart';

class SongListInPlaylist extends StatelessWidget {
  const SongListInPlaylist(
      {Key? key, required this.songs, required this.playlist})
      : super(key: key);
  final List<SongModel> songs;
  final PlaylistModel playlist;

  @override
  Widget build(BuildContext context) {
    return songs.isNotEmpty
        ? SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SongCard(
                        song: songs[index],
                        playlistModel: playlist,
                        onTap: () =>
                            context.read<AudioHandleBloc>().skipToQueueItem(
                                  items: songs,
                                  index: index,
                                ),
                      ),
                    ),
                childCount: songs.length),
          )
        : const XStateEmptyWidget();
  }
}
