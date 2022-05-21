import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/config/routes/coordinator.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/modules/upper_control/logic/upper_control_bloc.dart';
import 'package:zanmelodic/src/repositories/domain.dart';
import 'package:zanmelodic/src/utils/utils.dart';
import 'package:zanmelodic/src/widgets/loading/bot_toast.dart';
import 'package:zanmelodic/src/widgets/loading/loading.dart';

part 'playlist_state.dart';

class PlaylistBloc extends UpperControlBloc<PlaylistState> {
  static final PlaylistState _initialValue = PlaylistState(
      playlistsToDialog: const [],
      items: XHandle.loading(),
      playlist: PlaylistModel({}));
  final Domain _domain = Domain();

  PlaylistBloc() : super(_initialValue) {
    fetchPlaylists();
  }

  Future<void> addNewPlaylist(BuildContext context,
      {required String name}) async {
    XLoading.show();
    if (state.isValidName == '' && state.pureName == true) {
      final _value = await _domain.playlist.addNewPlaylist(name);
      if (_value.isSuccess) {
        emit(state.copyWithItems(items: XHandle.completed(_value.data ?? [])));

        XSnackbar.show(msg: 'Add Success');
      } else {
        XSnackbar.show(msg: 'Add Error');
      }
      XCoordinator.pop(context);
    }
    XLoading.hide();
  }

  Future<void> addToPlaylist(BuildContext context,
      {required int idPlaylist, required int idSong}) async {
    XLoading.show();
    final _value = await _domain.playlist
        .addToPlaylist(idPlaylist: idPlaylist, idSong: idSong);
    if (_value.isSuccess) {
      emit(state.copyWithItems(items: XHandle.completed(_value.data ?? [])));

      XSnackbar.show(msg: 'Add Success');
    } else {
      XSnackbar.show(msg: 'Add Error');
    }
    XCoordinator.pop(context);
    XLoading.hide();
  }

  void changedName(String name) =>
      emit(state.copyWithItems(namePlaylist: name.trim(), pureName: true));

  void changePlaylistFromDialogAddToPlaylist(PlaylistModel playlist) =>
      emit(state.copyWithItems(playlist: playlist));

  Future<void> fetchPlaylists() async {
    final value = await _domain.playlist.getListOfPlaylist();
    if (value.isSuccess) {
      emit(state.copyWithItems(items: XHandle.completed(value.data ?? [])));
    } else {
      XSnackbar.show(msg: 'Load All List Error');
    }
  }

  Future<void> fetchPlaylistToDialog(BuildContext context,
      {required SongModel song}) async {
    final List<PlaylistModel> _playlists = state.items.data ?? [];

    for (int i = 0; i < _playlists.length; i++) {
      final _value =
          await _domain.playlist.getListOfSongFromPlaylist(_playlists[i].id);

      if (_value.isSuccess) {
        final List<SongModel> _songs = _value.data ?? [];

        for (int j = 0; j < _songs.length; j++) {
          if (_songs[j].title == song.title) {
            _playlists.removeAt(i);
          }
        }
      } else {
        XCoordinator.pop(context);
        XSnackbar.show(msg: 'Load All List Error');
        break;
      }
    }
    emit(state.copyWithItems(
        playlistsToDialog: _playlists, playlist: PlaylistModel({"_id": -1})));
  }

  void initialNamePlaylist() =>
      emit(state.copyWithItems(namePlaylist: '', pureName: false));

  Future<void> removePlaylist(BuildContext context,
      {required int idPlaylist}) async {
    XLoading.show();
    final _value = await _domain.playlist.removePlaylist(idPlaylist);
    if (_value.isSuccess) {
      emit(state.copyWithItems(items: XHandle.completed(_value.data ?? [])));

      XSnackbar.show(msg: 'Remove Success');
    } else {
      XSnackbar.show(msg: 'Remove Error');
    }
    XCoordinator.pop(context);

    XLoading.hide();
  }
}
