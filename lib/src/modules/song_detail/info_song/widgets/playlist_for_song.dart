import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/modules/audio_control/logic/audio_handle_bloc.dart';
import 'package:zanmelodic/src/widgets/card/detail_song/playlist_card.dart';
import 'package:zanmelodic/src/widgets/state/state_empty_widget.dart';

class PlaylistForSong extends StatelessWidget {
  const PlaylistForSong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioHandleBloc, AudioHandleState>(
      builder: (context, state) {
        List<MediaItem> _items = state.playlist;
        return _items.isNotEmpty
            ? SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return PlaylistCard(
                    media: _items[index],
                    onTap: () => context.read<AudioHandleBloc>().playItem(
                          medias: _items,
                          index: index,
                        ),
                  );
                }, childCount: _items.length),
              )
            : const XStateEmptyWidget();
      },
    );
  }
}
