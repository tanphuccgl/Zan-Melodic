import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/modules/audio_control/logic/audio_handle_bloc.dart';
import 'package:zanmelodic/src/widgets/custom_card/song_card.dart';
import 'package:zanmelodic/src/widgets/state/state_empty_widget.dart';

class SongListWidget extends StatelessWidget {
  const SongListWidget({Key? key, required this.songs}) : super(key: key);
  final List<SongModel> songs;

  @override
  Widget build(BuildContext context) {
    return songs.isNotEmpty
        ? SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return SongCard(
                song: songs[index],
                onTap: () => context.read<AudioHandleBloc>().skipToQueueItem(
                      items: songs,
                      index: index,
                    ),
              );
            }, childCount: songs.length),
          )
        : const XStateEmptyWidget();
  }
}
