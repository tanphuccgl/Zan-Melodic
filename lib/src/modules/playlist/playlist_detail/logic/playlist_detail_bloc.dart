import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/config/routes/coordinator.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/modules/playlist/playlist/logic/playlist_bloc.dart';
import 'package:zanmelodic/src/modules/playlist/router/playlist_router.dart';
import 'package:zanmelodic/src/repositories/domain.dart';
import 'package:zanmelodic/src/widgets/loading/bot_toast.dart';
import 'package:zanmelodic/src/widgets/loading/loading.dart';

part 'playlist_detail_state.dart';

class PlaylistDetailBloc extends Cubit<PlaylistDetailState> {
  final Domain _domain = Domain();

  PlaylistDetailBloc()
      : super(PlaylistDetailState(
            uriImageList: const [],
            items: XHandle.loading(),
            playlist: PlaylistModel({})));

  Future<void> fetchListOfSongsFromPlaylist(BuildContext context,
      {required PlaylistModel playlist}) async {
    await Future.delayed(const Duration(seconds: 2));
    final value = await _domain.playlist.getListOfSongFromPlaylist(playlist.id);
    if (value.isSuccess) {
      await fetchUriImageList(playlist.id);
      emit(state.copyWith(
          items: XHandle.completed(value.data ?? []),
          playlist: playlist,
          numberSongs: playlist.numOfSongs));
      PlaylistCoordinator.showPlaylistDetailScreen(context);
    } else {
      XSnackbar.show(msg: 'Load All List Error');
    }
  }

  void onShuffleToList() {
    emit(state.copyWith(isShuffle: !state.isShuffle));
  }

  void onSortNameToList() {
    emit(state.copyWith(isSortName: !state.isSortName));
  }

  Future<void> removeFromPlaylist(BuildContext context,
      {required PlaylistModel playlist, required int idSong}) async {
    XLoading.show();
    await Future.delayed(const Duration(seconds: 2));
    final _value = await _domain.playlist
        .removeFromPlaylist(idPlaylist: playlist.id, idSong: idSong);
    if (_value.isSuccess) {
      state.uriImageList.clear();
      await fetchUriImageList(playlist.id);

      context.read<PlaylistBloc>().fetchPlaylists();

      emit(state.copyWith(
          items: XHandle.completed(_value.data ?? []),
          numberSongs: state.numberSongs - 1,
          uriImageList: state.uriImageList));
      XSnackbar.show(msg: 'Remove Success');
    } else {
      XSnackbar.show(msg: 'Remove Error');
    }
    XCoordinator.pop(context);

    XLoading.hide();
  }

  Future<void> saveNewNamePlaylist(BuildContext context,
      {required PlaylistModel playlist, required String newName}) async {
    XLoading.show();
    await Future.delayed(const Duration(seconds: 2));
    final value = await _domain.playlist
        .newNamePlaylist(idPlaylist: playlist.id, newName: newName);
    if (value.isSuccess) {
      XSnackbar.show(msg: 'Rename Success');
    } else {
      XSnackbar.show(msg: 'Rename Error');
    }
    XCoordinator.pop(context);

    XLoading.hide();
  }

  Future<void> fetchUriImageList(int idPlaylist) async {
    List<int> uriImageList = [];
    final _valueSongs = await _domain.song.getListOfSongs();
    final _valueSongsFromPlaylist =
        await _domain.playlist.getListOfSongFromPlaylist(idPlaylist);

    if (_valueSongs.isSuccess && _valueSongsFromPlaylist.isSuccess) {
      final _song = _valueSongs.data ?? [];
      final _songsPlaylist = _valueSongsFromPlaylist.data ?? [];

      for (int i = 0; i < _song.length; i++) {
        for (int j = 0; j < _songsPlaylist.length; j++) {
          if (_songsPlaylist[j].title == _song[i].title &&
              _songsPlaylist[j].size == _song[i].size) {
            uriImageList.add(_song[i].id);
          }
        }
      }
      emit(state.copyWith(uriImageList: uriImageList));
    } else {
      XSnackbar.show(msg: 'Load All List Error');
    }
  }
}
