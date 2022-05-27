import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/modules/genre/router/genre_router.dart';
import 'package:zanmelodic/src/modules/upper_control/logic/upper_control_bloc.dart';
import 'package:zanmelodic/src/repositories/domain.dart';
import 'package:zanmelodic/src/widgets/loading/bot_toast.dart';

part 'genre_detail_state.dart';

class GenreDetailBloc extends UpperControlBloc<GenreDetailState> {
  final Domain _domain = Domain();

  GenreDetailBloc() : super(_initialValue);
  static final GenreDetailState _initialValue = GenreDetailState(
    items: XHandle.loading(),
    genre: GenreModel({}),
  );
  Future<void> fetchListOfSongsFromGenre(
    BuildContext context, {
    required GenreModel genre,
  }) async {
    final value = await _domain.genre.getListOfSongFromGenre(genre.id);
    if (value.isSuccess) {
      emit(state.copyWithItems(
        items: XHandle.completed(value.data ?? []),
        genre: genre,
      ));
      GenreCoordinator.showGenreDetailScreen(context);
    } else {
      XSnackbar.show(msg: 'Load All List Error');
    }
  }
}
