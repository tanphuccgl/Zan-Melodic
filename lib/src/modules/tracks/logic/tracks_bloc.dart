import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/repositories/domain.dart';
import 'package:zanmelodic/src/widgets/loading/bot_toast.dart';

part 'tracks_state.dart';

class TracksBloc extends Cubit<TracksState> {
  TracksBloc() : super(TracksState(items: XHandle.loading())) {
    getAllTracks();
  }

  final Domain _domain = Domain();

  Future<void> getAllTracks() async {
    await Future.delayed(const Duration(seconds: 2));
    final value = await _domain.tracks.getAllTracks();
    if (value.isSuccess) {
      emit(state.copyWith(items: XHandle.completed(value.data ?? [])));
      XSnackbar.show(msg: 'Load All Tracks Success');
    } else {
      XSnackbar.show(msg: 'Load All Tracks Error');
    }
  }

  void onSortNameToList() {
    emit(state.copyWith(isSortName: !state.isSortName));
  }

  void onShuffleToList() {
    emit(state.copyWith(isShuffle: !state.isShuffle));
  }
}
