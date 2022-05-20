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
  FavoritesBloc() : super(FavoritesState(items: XHandle.loading())) {
    fetchSongsFromFavorites();
  }
  final Domain _domain = Domain();

  Future<void> fetchSongsFromFavorites() async {
    final _value = await _domain.favorites.getSongsFromFavorites();
    if (_value.isSuccess) {
      emit(state.copyWithItems(items: XHandle.completed(_value.data ?? [])));
    } else {
      XSnackbar.show(msg: 'Load All List Error');
    }
  }

  Future<void> addToFavorites(SongModel song) async {
    XLoading.show();
    final _value = await _domain.favorites.addToFavorite(song: song);
    if (_value.isSuccess) {
      emit(state.copyWithItems(items: XHandle.completed(_value.data ?? [])));
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
      emit(state.copyWithItems(items: XHandle.completed(_value.data ?? [])));
    } else {
      XSnackbar.show(msg: 'Remove Error');
    }
    XLoading.hide();
  }
}
