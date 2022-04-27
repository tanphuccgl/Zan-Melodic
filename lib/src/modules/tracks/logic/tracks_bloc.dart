import 'dart:io' as io;

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/models/tracks_model.dart';
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

  Future<void> getTracksFromLocal(String directory) async {
    List<io.FileSystemEntity> files = io.Directory(directory).listSync();

    files.map((e) {
      print(e.uri);
    }).toList();
  }
}
