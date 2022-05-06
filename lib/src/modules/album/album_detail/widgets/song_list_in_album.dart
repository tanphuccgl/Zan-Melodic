import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/modules/album/album_detail/logic/album_detail_bloc.dart';
import 'package:zanmelodic/src/widgets/custom_card/song_card.dart';
import 'package:zanmelodic/src/widgets/state/state_empty_widget.dart';
import 'package:zanmelodic/src/widgets/state/state_error_widget.dart';
import 'package:zanmelodic/src/widgets/state/state_loading_widget.dart';

class SongListInAlbum extends StatelessWidget {
  const SongListInAlbum({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlbumDetailBloc, AlbumDetailState>(
      builder: (context, state) {
        XHandle<List<SongModel>> _handle = state.items;
        if (_handle.isCompleted) {
          final List<SongModel> _items = _handle.data ?? [];
          state.isSortName
              ? state.sortListByName(reverse: true)
              : state.sortListByName();
          state.isShuffle ? _items.shuffle() : null;
          return _items.isNotEmpty
              ? SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child:
                                SongCard(songList: _items, song: _items[index]),
                          ),
                      childCount: _items.length),
                )
              : const XStateEmptyWidget();
        } else if (_handle.isLoading) {
          return const XStateLoadingWidget();
        } else {
          return const XStateErrorWidget();
        }
      },
    );
  }
}
