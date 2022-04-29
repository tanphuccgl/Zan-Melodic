import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/utils/utils.dart';
import 'package:zanmelodic/src/widgets/loading/bot_toast.dart';
import 'package:zanmelodic/src/utils/enums/loop_mode.dart';

part 'play_music_state.dart';

class PlayMusicBloc<T extends PlayMusicState> extends Cubit<T> {
  PlayMusicBloc(T initialState) : super(initialState);

  Future<void> onPlay(SongModel tracks) async {
    try {
      if (tracks.id != state.tracks.id || state.isEndSong) {
        await state.audioPlayer
            .setAudioSource(AudioSource.uri(Uri.file(tracks.data)));
      }
      emit(state.copyWith(
        tracks: tracks,
        isPlaying: true,
      ) as T);
      state.audioPlayer.play();
      getPositon();
    } catch (e) {
      XSnackbar.show(msg: 'Play Song Error');
    }
  }

  Future<void> onPlayFromTracks(
      {required List<SongModel> listTracks, SongModel? tracks}) async {
    try {
      await state.audioPlayer.setAudioSource(
        ConcatenatingAudioSource(
          children: listTracks.map((e) {
            return AudioSource.uri(Uri.file(e.data));
          }).toList(),
        ),
      );

      if (tracks != null) {
        var index = listTracks.indexWhere((e) => e.id == tracks.id);

        await state.audioPlayer
            .seek(const Duration(milliseconds: 0), index: index);
      }
      state.audioPlayer.currentIndexStream.listen((event) {
        emit(state.copyWith(
          tracks: listTracks[event ?? -1],
          isPlaying: true,
        ) as T);
      });
      await state.audioPlayer.setLoopMode(state.loopMode);

      state.audioPlayer.play();
      getPositon();
    } catch (e) {
      XSnackbar.show(msg: 'Play Song Error');
    }
  }

  void onPause() {
    emit(state.copyWith(isPlaying: false) as T);
    state.audioPlayer.pause();
  }

  Future<void> onSkipToPrevious() async {
    if (state.loopMode == LoopMode.one) {
      await state.audioPlayer.setLoopMode(LoopMode.off);
      emit(state.copyWith(loopMode: LoopMode.off) as T);
    }
    await state.audioPlayer.seekToPrevious();
    emit(state.copyWith(
      isPlaying: true,
    ) as T);
  }

  Future<void> onSkipToNext() async {
    if (state.loopMode == LoopMode.one) {
      await state.audioPlayer.setLoopMode(LoopMode.off);
      emit(state.copyWith(loopMode: LoopMode.off) as T);
    }
    emit(state.copyWith(
      isPlaying: true,
    ) as T);
    await state.audioPlayer.seekToNext();
  }

  Future<void> getPositon() async =>
      state.audioPlayer.positionStream.listen((event) {
        emit(state.copyWith(
            currentPosition: event,
            endPosition: state.audioPlayer.duration) as T);
      });

  Future<void> setLoopMode() async {
    final value = state.loopMode.nextOption();
    await state.audioPlayer.setLoopMode(value);
    emit(state.copyWith(loopMode: value) as T);
  }
}
