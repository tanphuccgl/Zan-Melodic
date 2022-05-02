import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/config/routes/coordinator.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/repositories/domain.dart';
import 'package:zanmelodic/src/utils/utils.dart';
import 'package:zanmelodic/src/widgets/loading/bot_toast.dart';
import 'package:zanmelodic/src/widgets/loading/loading.dart';

part 'playlist_state.dart';

class PlaylistBloc extends Cubit<PlaylistState> {
  PlaylistBloc()
      : super(PlaylistState(
            items: XHandle.loading(), playlist: PlaylistModel({}))) {
    fetchPlaylists();
  }

  final Domain _domain = Domain();

  Future<void> fetchPlaylists() async {
    await Future.delayed(const Duration(seconds: 2));
    final value = await _domain.playlist.getListOfPlaylist();
    if (value.isSuccess) {
      emit(state.copyWith(items: XHandle.completed(value.data ?? [])));
    } else {
      XSnackbar.show(msg: 'Load All List Error');
    }
  }

  Future<void> addNewPlaylist(BuildContext context,
      {required String name}) async {
    XLoading.show();
    await Future.delayed(const Duration(seconds: 2));
    if (state.isValidName == '' && state.pureName == true) {
      final _value = await _domain.playlist.addNewPlaylist(name);
      if (_value.isSuccess) {
        emit(state.copyWith(items: XHandle.completed(_value.data ?? [])));

        XCoordinator.pop(context);
        XSnackbar.show(msg: 'Add Success');
      } else {
        XSnackbar.show(msg: 'Add Error');
      }
    }
    XLoading.hide();
  }

  Future<void> removePlaylist(BuildContext context,
      {required int idPlaylist}) async {
    XLoading.show();
    await Future.delayed(const Duration(seconds: 2));
    final _value = await _domain.playlist.removePlaylist(idPlaylist);
    if (_value.isSuccess) {
      emit(state.copyWith(items: XHandle.completed(_value.data ?? [])));

      XCoordinator.pop(context);
      XSnackbar.show(msg: 'Remove Success');
    } else {
      XSnackbar.show(msg: 'Remove Error');
    }
    XLoading.hide();
  }

  Future<void> addToPlaylist(BuildContext context,
      {required int idPlaylist, required int idSong}) async {
    XLoading.show();
    await Future.delayed(const Duration(seconds: 2));
    final _value = await _domain.playlist
        .addToPlaylist(idPlaylist: idPlaylist, idSong: idSong);
    if (_value.isSuccess) {
      emit(state.copyWith(items: XHandle.completed(_value.data ?? [])));

      XCoordinator.pop(context);
      XSnackbar.show(msg: 'Add Success');
    } else {
      XSnackbar.show(msg: 'Add Error');
    }
    XLoading.hide();
  }

//TODO
  Future<bool> fetchPlaylistToDialog(BuildContext context,
      {required PlaylistModel playlist, required int idSong}) async {
    await Future.delayed(const Duration(seconds: 2));
    final value = await _domain.playlist.getListOfSongFromPlaylist(playlist.id);
    late final bool _result;
    if (value.isSuccess) {
      final _items = value.data ?? [];
      for (int i = 0; i < _items.length; i++) {
        _result = _items[i].id == idSong ? true : false;
      }
    } else {
      XSnackbar.show(msg: 'Load All List Error');
    }
    return _result;
  }

  void onSortNameToList() =>
      emit(state.copyWith(isSortName: !state.isSortName));

  void onShuffleToList() => emit(state.copyWith(isShuffle: !state.isShuffle));

  void changedName(String name) =>
      emit(state.copyWith(namePlaylist: name.trim(), pureName: true));

  void initialNamePlaylist() =>
      emit(state.copyWith(namePlaylist: '', pureName: false));

  void changePlaylist(PlaylistModel playlist) =>
      emit(state.copyWith(playlist: playlist));
}
