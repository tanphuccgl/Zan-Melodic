import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/modules/playlist/router/playlist_router.dart';
import 'package:zanmelodic/src/repositories/domain.dart';
import 'package:zanmelodic/src/widgets/loading/bot_toast.dart';

part 'playlist_detail_state.dart';

class PlaylistDetailBloc extends Cubit<PlaylistDetailState> {
  PlaylistDetailBloc()
      : super(PlaylistDetailState(
            items: XHandle.loading(), playlist: PlaylistModel({})));

  final Domain _domain = Domain();

  Future<void> fetchListOfSongsFromPlaylist(BuildContext context,
      {required PlaylistModel playlist}) async {
    await Future.delayed(const Duration(seconds: 2));
    final value = await _domain.playlist.getListOfSongFromPlaylist(playlist.id);
    if (value.isSuccess) {
      emit(state.copyWith(
          items: XHandle.completed(value.data ?? []), playlist: playlist));
      PlaylistCoordinator.showPlaylistDetailScreen(context);
    } else {
      XSnackbar.show(msg: 'Load All List Error');
    }
  }

  void onSortNameToList() {
    emit(state.copyWith(isSortName: !state.isSortName));
  }

  void onShuffleToList() {
    emit(state.copyWith(isShuffle: !state.isShuffle));
  }
}
