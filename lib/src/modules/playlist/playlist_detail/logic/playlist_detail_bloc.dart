import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/config/routes/coordinator.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/modules/playlist/playlist/logic/playlist_bloc.dart';
import 'package:zanmelodic/src/modules/playlist/router/playlist_router.dart';
import 'package:zanmelodic/src/modules/upper_control/logic/upper_control_bloc.dart';
import 'package:zanmelodic/src/repositories/domain.dart';
import 'package:zanmelodic/src/widgets/loading/bot_toast.dart';
import 'package:zanmelodic/src/widgets/loading/loading.dart';

part 'playlist_detail_state.dart';

class PlaylistDetailBloc extends UpperControlBloc<PlaylistDetailState> {
  final Domain _domain = Domain();

  PlaylistDetailBloc() : super(_initialValue);

  static final PlaylistDetailState _initialValue = PlaylistDetailState(
      items: XHandle.loading(), playlist: PlaylistModel({}));

  Future<void> fetchListOfSongsFromPlaylist(BuildContext context,
      {required PlaylistModel playlist}) async {
    final _value =
        await _domain.playlist.getListOfSongFromPlaylist(playlist.id);
    if (_value.isSuccess) {
      _convertToSongs(_value.data ?? []);
      emit(state.copyWithItems(
          playlist: playlist, numberSongs: playlist.numOfSongs));
      PlaylistCoordinator.showPlaylistDetailScreen(context);
    } else {
      XSnackbar.show(msg: 'Load All List Error');
    }
  }

  Future<void> _convertToSongs(List<SongModel> songs) async {
    final List<SongModel> _newSongs = [];
    final _value = await _domain.song.getListOfSongs();
    if (_value.isSuccess) {
      final _items = _value.data ?? [];
      for (var item in _items) {
        for (var item1 in songs) {
          if (item.title == item1.title) {
            _newSongs.add(item);
          }
        }
      }
      emit(state.copyWithItems(
        items: XHandle.completed(_newSongs),
      ));
    } else {
      XSnackbar.show(msg: 'Load List Error');
    }
  }

  Future<void> removeFromPlaylist(BuildContext context,
      {required PlaylistModel playlist, required SongModel song}) async {
    XLoading.show();
    late int idSongFromPlaylist;

    for (SongModel item in state.items.data ?? []) {
      if (song.title == item.title) {
        idSongFromPlaylist = item.id;
      }
    }

    final _value = await _domain.playlist.removeFromPlaylist(
        idPlaylist: playlist.id, idSong: idSongFromPlaylist);
    if (_value.isSuccess) {
      context.read<PlaylistBloc>().fetchPlaylists();
      _convertToSongs(_value.data ?? []);
      emit(state.copyWithItems(
        numberSongs: state.numberSongs - 1,
      ));
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
    final _value = await _domain.playlist
        .newNamePlaylist(idPlaylist: playlist.id, newName: newName);
    if (_value.isSuccess) {
      XSnackbar.show(msg: 'Rename Success');
    } else {
      XSnackbar.show(msg: 'Rename Error');
    }
    XCoordinator.pop(context);

    XLoading.hide();
  }
}
