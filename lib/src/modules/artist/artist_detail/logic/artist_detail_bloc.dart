import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/modules/artist/router/artist_router.dart';
import 'package:zanmelodic/src/modules/upper_control/logic/upper_control_bloc.dart';
import 'package:zanmelodic/src/repositories/domain.dart';
import 'package:zanmelodic/src/widgets/loading/bot_toast.dart';

part 'artist_detail_state.dart';

class ArtistDetailBloc extends UpperControlBloc<ArtistDetailState> {
  final Domain _domain = Domain();

  ArtistDetailBloc() : super(_initialValue);
  static final ArtistDetailState _initialValue = ArtistDetailState(
    items: XHandle.loading(),
    artist: ArtistModel({}),
  );
  Future<void> fetchListOfSongsFromArtist(
    BuildContext context, {
    required ArtistModel artist,
  }) async {
    final value = await _domain.artist.getListOfSongFromArtist(artist.id);
    if (value.isSuccess) {
      emit(state.copyWithItems(
        items: XHandle.completed(value.data ?? []),
        artist: artist,
      ));
      ArtistCoordinator.showArtistDetailScreen(context);
    } else {
      XSnackbar.show(msg: 'Load All List Error');
    }
  }
}
