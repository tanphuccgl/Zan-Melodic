import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/modules/audio_control/logic/audio_handle_bloc.dart';
import 'package:zanmelodic/src/modules/songs/logic/song_list_bloc.dart';
import 'package:zanmelodic/src/widgets/custom_card/song_card.dart';
import 'package:zanmelodic/src/widgets/state/state_empty_widget.dart';

class SongListWidget extends StatelessWidget {
  const SongListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongListBloc, SongListState>(
      builder: (context, state) {
        List<SongModel> _items = state.songs.data ?? [];
        return _items.isNotEmpty
            ? SliverPadding(
                padding: const EdgeInsets.only(bottom: 90),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return SongCard(
                      song: _items[index],
                      onTap: () =>
                          context.read<AudioHandleBloc>().skipToQueueItem(
                                _items,
                                index,
                              ),
                    );
                  }, childCount: _items.length),
                ),
              )
            : const XStateEmptyWidget();
      },
    );
  }
  //   return BlocBuilder<AudioHandleBloc, AudioHandleState>(
  //     builder: (context, state) {
  //       List<MediaItem> _items = state.playlist;
  //       return _items.isNotEmpty
  //           ? SliverPadding(
  //               padding: const EdgeInsets.only(bottom: 90),
  //               sliver: SliverList(
  //                 delegate: SliverChildBuilderDelegate((context, index) {
  //                   return SongCard(
  //                     media: _items[index],
  //                     onTap: () => context
  //                         .read<AudioHandleBloc>()
  //                         .skipToQueueItem(_items, index, _items[index]),
  //                   );
  //                 }, childCount: _items.length),
  //               ),
  //             )
  //           : const XStateEmptyWidget();
  //     },
  //   );
  // }
}
