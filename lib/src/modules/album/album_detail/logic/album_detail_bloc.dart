import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/modules/album/router/album_router.dart';
import 'package:zanmelodic/src/repositories/domain.dart';
import 'package:zanmelodic/src/widgets/loading/bot_toast.dart';

part 'album_detail_state.dart';

class AlbumDetailBloc extends Cubit<AlbumDetailState> {
  AlbumDetailBloc()
      : super(
            AlbumDetailState(items: XHandle.loading(), album: AlbumModel({})));

  final Domain _domain = Domain();

  Future<void> fetchListOfSongs(BuildContext context,
      {required AlbumModel album}) async {
    await Future.delayed(const Duration(seconds: 2));
    final value = await _domain.album.getListOfSongFromAlbum(album.id);
    if (value.isSuccess) {
      emit(state.copyWith(
          items: XHandle.completed(value.data ?? []), album: album));
      AlbumCoordinator.showAlbumDetailScreen(context);
      XSnackbar.show(msg: 'Load All List Success');
    } else {
      XSnackbar.show(msg: 'Load All LIst Error');
    }
  }

  void onSortNameToList() {
    emit(state.copyWith(isSortName: !state.isSortName));
  }

  void onShuffleToList() {
    emit(state.copyWith(isShuffle: !state.isShuffle));
  }
}
