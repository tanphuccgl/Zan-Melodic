import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/modules/album/router/album_router.dart';
import 'package:zanmelodic/src/modules/upper_control/logic/upper_control_bloc.dart';
import 'package:zanmelodic/src/repositories/domain.dart';
import 'package:zanmelodic/src/widgets/loading/bot_toast.dart';

part 'album_detail_state.dart';

class AlbumDetailBloc extends UpperControlBloc<AlbumDetailState> {
  final Domain _domain = Domain();

  AlbumDetailBloc() : super(_initialState);
  static final AlbumDetailState _initialState = AlbumDetailState(
    items: XHandle.loading(),
    album: AlbumModel({}),
  );
  Future<void> fetchListOfSongsFromAlbum(
    BuildContext context, {
    required AlbumModel album,
  }) async {
    final value = await _domain.album.getListOfSongFromAlbum(album.id);
    if (value.isSuccess) {
      emit(state.copyWithItems(
        items: XHandle.completed(value.data ?? []),
        album: album,
      ));
      AlbumCoordinator.showAlbumDetailScreen(context);
    } else {
      XSnackbar.show(msg: 'Load All List Error');
    }
  }
}
