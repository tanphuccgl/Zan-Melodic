import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/modules/album/router/album_router.dart';
import 'package:zanmelodic/src/modules/dashboard/pages/dashboard_page.dart';
import 'package:zanmelodic/src/modules/upper_control/logic/upper_control_bloc.dart';
import 'package:zanmelodic/src/repositories/domain.dart';
import 'package:zanmelodic/src/widgets/loading/bot_toast.dart';

part 'album_detail_state.dart';

class AlbumDetailBloc extends UpperControlBloc<AlbumDetailState> {
  AlbumDetailBloc()
      : super(AlbumDetailState(
            items: XHandle.loading(),
            album: AlbumModel({}),
            mediaItems: const []));

  final Domain _domain = Domain();

  Future<void> fetchListOfSongsFromAlbum(BuildContext context,
      {required AlbumModel album, required List<SongModel> songs}) async {
    await Future.delayed(const Duration(seconds: 2));
    final value = await _domain.album.getListOfSongFromAlbum(album.id);
    if (value.isSuccess) {
      List<SongModel> newList = [];
      for (SongModel item in (songs)) {
        for (SongModel item1 in (value.data ?? [])) {
          if (item.title == item1.title) {
            newList.add(item);
          }
        }
      }
      var a = (newList).map((e) => converSongToModel(e)).toList();
      emit(state.copyWith(
          items: XHandle.completed(value.data ?? []),
          album: album,
          mediaItems: a));
      AlbumCoordinator.showAlbumDetailScreen(context);
    } else {
      XSnackbar.show(msg: 'Load All List Error');
    }
  }
}
