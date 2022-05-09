import 'dart:developer';

import 'package:audio_service/audio_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/constants/my_icons.dart';
import 'package:zanmelodic/src/modules/audio_service/audio_player_task.dart';
import 'package:zanmelodic/src/utils/enums/loop_mode.dart';
import 'package:zanmelodic/src/utils/utils.dart';
import 'package:zanmelodic/src/widgets/loading/bot_toast.dart';

part 'play_music_state.dart';

class PlayMusicBloc extends Cubit<PlayMusicState> {
  PlayMusicBloc()
      : super(PlayMusicState(
          song: SongModel({"_id": -1}),
          audioPlayer: AudioPlayer(),
        ));
  late AudioHandler audioHandler;

  Future<void> init() async {
    audioHandler = await AudioService.init(
      builder: () =>
          AudioPlayerHandler(audioPlayer: state.audioPlayer, song: state.song),
      config: const AudioServiceConfig(
        androidNotificationChannelId: 'com.goldenowl.zanmelodic',
        androidNotificationChannelName: 'Zan Melodic',
        androidNotificationOngoing: true,
        androidStopForegroundOnPause: true,
      ),
    );
  }

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
      init();
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
      init();
    } catch (e) {
      XSnackbar.show(msg: 'Play Song Error');
    }
  }

  void onPause() {
    emit(state.copyWith(isPlaying: false));
    state.audioPlayer.pause();
    init();
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
    init();
    log(state.song.title.toString());
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
    init();
  }

  Future<void> getPositon() async {
    state.audioPlayer.positionStream.listen((event) {
      emit(state.copyWith(
          currentPosition: event, endPosition: state.audioPlayer.duration));
    });
    init();
  }

  Future<void> onLoopMode() async {
    final value = state.loopMode.nextOption();
    await state.audioPlayer.setLoopMode(value);
    emit(state.copyWith(loopMode: value));
    init();
  }
}
