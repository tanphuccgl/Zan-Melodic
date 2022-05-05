import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/models/result.dart';
import 'package:zanmelodic/src/modules/songs/logic/song_list_bloc.dart';
import 'package:zanmelodic/src/widgets/custom_card/song_card.dart';
import 'package:zanmelodic/src/widgets/state/state_empty_widget.dart';
import 'package:zanmelodic/src/widgets/state/state_error_widget.dart';
import 'package:zanmelodic/src/widgets/state/state_loading_widget.dart';

class SongListWidget extends StatelessWidget {
  const SongListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongListBloc, SongListState>(
      builder: (context, state) {
        XHandle<List<SongModel>> _handle = state.items;

        if (_handle.isCompleted) {
          _handle = XHandle.result(XResult.success(state.items.data ?? []));
          final List<SongModel> _items = _handle.data ?? [];
          state.isSortName ? state.sortListByNameReverse : state.sortListByName;
          state.isShuffle ? _items.shuffle() : null;
          return _items.isNotEmpty
              ? SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return SongCard(
                      songList: _items,
                      song: _items[index],
                    );
                  }, childCount: _items.length),
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
