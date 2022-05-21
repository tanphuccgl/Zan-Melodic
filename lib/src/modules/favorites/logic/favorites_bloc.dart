import 'package:flutter/cupertino.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:on_audio_room/on_audio_room.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/modules/upper_control/logic/upper_control_bloc.dart';
import 'package:zanmelodic/src/repositories/domain.dart';
import 'package:zanmelodic/src/widgets/loading/bot_toast.dart';
import 'package:zanmelodic/src/widgets/loading/loading.dart';

part 'favorites_state.dart';

class FavoritesBloc extends UpperControlBloc<FavoritesState> {
  FavoritesBloc()
      : super(
            FavoritesState(items: XHandle.loading(), favoriteList: const [])) {
    fetchSongsFromFavorites();
  }
  final Domain _domain = Domain();

  Future<void> fetchSongsFromFavorites() async {
    final _value = await _domain.favorites.getSongsFromFavorites();
    if (_value.isSuccess) {
      _convertToSongs(_value.data ?? []);
    } else {
      XSnackbar.show(msg: 'Load All List Error');
    }
  }

  Future<void> addToFavorites(SongModel song) async {
    XLoading.show();
    final _value = await _domain.favorites.addToFavorite(song: song);
    if (_value.isSuccess) {
      _convertToSongs(_value.data ?? []);
    } else {
      XSnackbar.show(msg: 'Add Error');
    }
    XLoading.hide();
  }

  Future<void> removeFromFavorites(BuildContext context,
      {required int idSong}) async {
    XLoading.show();
    final _value = await _domain.favorites.removeFromFavorites(idSong);
    if (_value.isSuccess) {
      _convertToSongs(_value.data ?? []);
    } else {
      XSnackbar.show(msg: 'Remove Error');
    }
    XLoading.hide();
  }

  Future<void> _convertToSongs(List<FavoritesEntity> favoriteList) async {
    final List<SongModel> _newSongs = [];
    final _value = await _domain.song.getListOfSongs();
    if (_value.isSuccess) {
      final _songs = _value.data ?? [];
      for (var item in _songs) {
        for (var itemFavorite in favoriteList) {
          if (item.id == itemFavorite.id) {
            _newSongs.add(item);
          }
        }
      }
      emit(state.copyWithItems(
          items: XHandle.completed(_newSongs), favoriteList: favoriteList));
    } else {
      XSnackbar.show(msg: 'List Load Error');
    }
  }
}
