import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/modules/audio_control/logic/audio_handle_bloc.dart';
import 'package:zanmelodic/src/modules/playlist/playlist_detail/logic/playlist_detail_bloc.dart';
import 'package:zanmelodic/src/modules/songs/logic/song_list_bloc.dart';
import 'package:zanmelodic/src/widgets/custom_card/song_card.dart';
import 'package:zanmelodic/src/widgets/state/state_empty_widget.dart';

class SongListInPlaylist extends StatelessWidget {
  const SongListInPlaylist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaylistDetailBloc, PlaylistDetailState>(
        builder: (context, playlistState) {
      return BlocBuilder<SongListBloc, SongListState>(
          builder: (context, songState) {
        return BlocBuilder<AudioHandleBloc, AudioHandleState>(
          builder: (context, state) {
            List<SongModel> _items = playlistState.items.data ?? [];

            List<SongModel> songs = songState.items.data ?? [];
            List<SongModel> a = [];
            for (var item in _items) {
              for (var item1 in songs) {
                if (item.title == item1.title) {
                  a.add(item1);
                }
              }
            }
            playlistState.isSortName
                ? playlistState.sortListByName1(reverse: true, songs: a)
                : playlistState.sortListByName1(songs: a);
            return _items.isNotEmpty
                ? SliverPadding(
                    padding: state.isShowBottomBar == true
                        ? const EdgeInsets.only(bottom: 90)
                        : EdgeInsets.zero,
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (context, index) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: SongCard(
                                  song: a[index],
                                  playlistModel: playlistState.playlist,
                                  onTap: () => context
                                      .read<AudioHandleBloc>()
                                      .skipToQueueItem(
                                        items: a,
                                        index: index,
                                      ),
                                ),
                              ),
                          childCount: a.length),
                    ),
                  )
                : const XStateEmptyWidget();
          },
        );
      });
    });
  }
}
