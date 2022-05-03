import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:on_audio_room/on_audio_room.dart';
import 'package:zanmelodic/src/config/routes/coordinator.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/repositories/domain.dart';
import 'package:zanmelodic/src/widgets/loading/bot_toast.dart';
import 'package:zanmelodic/src/widgets/loading/loading.dart';

part 'favorites_state.dart';

class FavoritesBloc extends Cubit<FavoritesState> {
  FavoritesBloc() : super(FavoritesState(songs: XHandle.loading())) {
    fetchSongsFromFavorites();
  }
  final Domain _domain = Domain();

  Future<void> fetchSongsFromFavorites() async {
    await Future.delayed(const Duration(seconds: 2));
    final value = await _domain.favorites.getSongsFromFavorites();
    if (value.isSuccess) {
      emit(state.copyWith(songs: XHandle.completed(value.data ?? [])));
    } else {
      XSnackbar.show(msg: 'Load All List Error');
    }
  }

  Future<void> addToFavorites(SongModel song) async {
    final value = await _domain.favorites.addToFavorite(song: song);
    if (value.isSuccess) {
      emit(state.copyWith(songs: XHandle.completed(value.data ?? [])));
    } else {
      XSnackbar.show(msg: 'Add Error');
    }
  }

  Future<void> removeFromFavorites(BuildContext context,
      {required FavoritesEntity favoritesEntity}) async {
    XLoading.show();
    await Future.delayed(const Duration(seconds: 2));
    final value =
        await _domain.favorites.removeFromFavorites(favoritesEntity.id);
    if (value.isSuccess) {
      emit(state.copyWith(songs: XHandle.completed(value.data ?? [])));
      XSnackbar.show(msg: 'Remove Success');
    } else {
      XSnackbar.show(msg: 'Remove Error');
    }
    XCoordinator.pop(context);
    XLoading.hide();
  }
}
