import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/modules/audio_control/logic/audio_handle_bloc.dart';
import 'package:zanmelodic/src/widgets/card/song_card.dart';
import 'package:zanmelodic/src/widgets/state/state_empty_widget.dart';

class BaseSongs extends StatelessWidget {
  final List<SongModel> songs;
  final PlaylistModel? playlist;
  final int? childCount;
  final double pHori;
  const BaseSongs(
      {Key? key,
      this.playlist,
      required this.songs,
      this.childCount,
      this.pHori = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return songs.isNotEmpty
        ? SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: pHori),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return SongCard(
                  song: songs[index],
                  playlistModel: playlist,
                  onTap: () => context.read<AudioHandleBloc>().playItem(
                        items: songs,
                        index: index,
                      ),
                );
              }, childCount: childCount ?? songs.length),
            ),
          )
        : const XStateEmptyWidget();
  }
}
