import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/repositories/domain.dart';
import 'package:zanmelodic/src/widgets/loading/bot_toast.dart';

part 'song_list_state.dart';

class SongListBloc extends Cubit<SongListState> {
  SongListBloc() : super(SongListState(items: XHandle.loading())) {
    fetchListOfSongs();
  }

  final Domain _domain = Domain();

  Future<void> fetchListOfSongs() async {
    await Future.delayed(const Duration(seconds: 2));
    final value = await _domain.song.getListOfSongs();
    if (value.isSuccess) {
      emit(state.copyWith(items: XHandle.completed(value.data ?? [])));
    } else {
      XSnackbar.show(msg: 'Load All List Error');
    }
  }

  void onSortNameToList() {
    emit(state.copyWith(isSortName: !state.isSortName));
  }

  void onShuffleToList() {
    emit(state.copyWith(isShuffle: !state.isShuffle));
  }
}
