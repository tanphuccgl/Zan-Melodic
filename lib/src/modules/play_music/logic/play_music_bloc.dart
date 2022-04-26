import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:zanmelodic/src/models/tracks_model.dart';
import 'package:zanmelodic/src/utils/utils.dart';
import 'package:zanmelodic/src/widgets/loading/bot_toast.dart';
import 'package:zanmelodic/src/utils/enums/loop_mode.dart';

part 'play_music_state.dart';

class PlayMusicBloc extends Cubit<PlayMusicState> {
  PlayMusicBloc()
      : super(PlayMusicState(
            tracks: XTracks.empty(), audioPlayer: AudioPlayer()));

  Future<void> onPlay(XTracks tracks) async {
    try {
      if (tracks.id != state.tracks.id || state.isEndSong) {
        await state.audioPlayer
            .setAudioSource(AudioSource.uri(Uri.parse(tracks.link)));
      }
      emit(state.copyWith(
        tracks: tracks,
        isPlaying: true,
      ));
      state.audioPlayer.play();
      getPositon();
    } catch (e) {
      XSnackbar.show(msg: 'Play Song Error');
    }
  }

  Future<void> onPlayFromTracks(
      {required List<XTracks> listTracks, XTracks? tracks}) async {
    try {
      await state.audioPlayer.setAudioSource(
        ConcatenatingAudioSource(
          children: listTracks.map((e) {
            return AudioSource.uri(Uri.parse(e.link));
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
        ));
      });
      await state.audioPlayer.setLoopMode(state.loopMode);

      state.audioPlayer.play();
      getPositon();
    } catch (e) {
      XSnackbar.show(msg: 'Play Song Error');
    }
  }

  void onPause() {
    emit(state.copyWith(isPlaying: false));
    state.audioPlayer.pause();
  }

  Future<void> onSkipToPrevious() async {
    if (state.loopMode == LoopMode.one) {
      await state.audioPlayer.setLoopMode(LoopMode.off);
      emit(state.copyWith(loopMode: LoopMode.off));
    }
    await state.audioPlayer.seekToPrevious();
    emit(state.copyWith(
      isPlaying: true,
    ));
  }

  Future<void> onSkipToNext() async {
    if (state.loopMode == LoopMode.one) {
      await state.audioPlayer.setLoopMode(LoopMode.off);
      emit(state.copyWith(loopMode: LoopMode.off));
    }
    emit(state.copyWith(
      isPlaying: true,
    ));
    await state.audioPlayer.seekToNext();
  }

  Future<void> getPositon() async =>
      state.audioPlayer.positionStream.listen((event) {
        emit(state.copyWith(
            currentPosition: event, endPosition: state.audioPlayer.duration));
      });
  Future<void> setShuffleModeEnabled(bool value) async {
    await state.audioPlayer.setShuffleModeEnabled(value);
    emit(state.copyWith(isEnableShuffle: value));
  }

  Future<void> setLoopMode() async {
    final value = state.loopMode.nextOption();
    await state.audioPlayer.setLoopMode(value);
    emit(state.copyWith(loopMode: value));
  }
}
