import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:zanmelodic/src/models/tracks_model.dart';
import 'package:zanmelodic/src/utils/utils.dart';
import 'package:zanmelodic/src/widgets/loading/bot_toast.dart';

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

  void onPause() {
    emit(state.copyWith(isPlaying: false));
    state.audioPlayer.pause();
  }

  void onSkipToPrevious() {}
  void onSkipToNext() {}
  void getPositon() async => state.audioPlayer.positionStream.listen((event) {
        emit(state.copyWith(
            currentPosition: event, endPosition: state.audioPlayer.duration));
      });
}
