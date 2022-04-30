import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/utils/utils.dart';
import 'package:zanmelodic/src/widgets/loading/bot_toast.dart';
import 'package:zanmelodic/src/utils/enums/loop_mode.dart';

part 'play_music_state.dart';

class PlayMusicBloc extends Cubit<PlayMusicState> {
  PlayMusicBloc()
      : super(PlayMusicState(song: SongModel({}), audioPlayer: AudioPlayer()));

  Future<void> onButtonPlayer(SongModel song) async {
    try {
      if (song.id != state.song.id || state.isEndSong) {
        await state.audioPlayer
            .setAudioSource(AudioSource.uri(Uri.file(song.data)));
      }
      emit(state.copyWith(
        song: song,
        isPlaying: true,
      ));
      state.audioPlayer.play();
      getPositon();
    } catch (e) {
      XSnackbar.show(msg: 'Play Song Error');
    }
  }

  Future<void> onPlayerItem(
      {required List<SongModel> songList, SongModel? song}) async {
    try {
      await state.audioPlayer.setAudioSource(
        ConcatenatingAudioSource(
          children: songList.map((e) {
            return AudioSource.uri(Uri.file(e.data));
          }).toList(),
        ),
      );

      if (song != null) {
        var index = songList.indexWhere((e) => e.id == song.id);

        await state.audioPlayer
            .seek(const Duration(milliseconds: 0), index: index);
      }
      state.audioPlayer.currentIndexStream.listen((event) {
        emit(state.copyWith(
          song: songList[event ?? -1],
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

  Future<void> onLoopMode() async {
    final value = state.loopMode.nextOption();
    await state.audioPlayer.setLoopMode(value);
    emit(state.copyWith(loopMode: value));
  }
}
