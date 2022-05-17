import 'package:audio_service/audio_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:on_audio_room/details/rooms/favorites/favorites_entity.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/modules/audio_control/logic/progress_bar_bloc.dart';
import 'package:zanmelodic/src/utils/enums/button_state.dart';
import 'package:zanmelodic/src/utils/enums/repeat_state.dart';

part 'audio_handle_state.dart';

class AudioHandleBloc extends Cubit<AudioHandleState> {
  static final AudioHandleState _initialValue = AudioHandleState(
      currentSong: const MediaItem(title: 'N/A', id: 'N/A'),
      progress: const ProgressBarState(
        current: Duration.zero,
        buffered: Duration.zero,
        total: Duration.zero,
      ),
      playlist: const [],
      audioHandler: GetIt.I<AudioHandler>());

  AudioHandleBloc() : super(_initialValue) {
    init();
  }

  List<SongModel> castFavoritesEntityToSong(
      {required List<SongModel> listOfSongs,
      required List<FavoritesEntity> listOfFavoritesEntity}) {
    List<SongModel> _listResult = [];
    for (int i = 0; i < listOfSongs.length; i++) {
      for (int j = 0; j < listOfFavoritesEntity.length; j++) {
        if (listOfSongs[i].id == listOfFavoritesEntity[j].id) {
          _listResult.add(listOfSongs[i]);
        }
      }
    }

    return _listResult;
  }

  void dispose() {
    state.audioHandler.customAction('dispose');
  }

  void init() {
    _listenToChangesInPlaylist();
    _listenToPlaybackState();
    _listenToCurrentPosition();
    _listenToBufferedPosition();
    _listenToTotalDuration();
    _listenToChangesInSong();
  }

  void next() => state.audioHandler.skipToNext();

  void pause() => state.audioHandler.pause();

  void play() => state.audioHandler.play();

  /// khi chưa play nhạc:
  ///  - click vào trang nào thì load queue của trang đó
  /// khi đang play nhạc:
  ///  - queue hiện tại:
  ///     + click play thì lấy queue của trang đó
  ///  - queue mới:
  ///     + click nhạc của trang khác thì update queue lại

  Future<void> skipToQueueItem(
      List<MediaItem> items, int index, MediaItem media) async {
    bool isEqual = listEquals(items, state.audioHandler.queue.value);
    if (isEqual == false) {
      await updatePlaylist(items);
    }
    state.audioHandler.skipToQueueItem(index);

    emit(state.copyWith(isShowBottomBar: true));
  }

  void previous() => state.audioHandler.skipToPrevious();

  void remove() {
    final lastIndex = state.audioHandler.queue.value.length - 1;
    if (lastIndex < 0) return;
    state.audioHandler.removeQueueItemAt(lastIndex);
  }

  void repeat() {
    final next = (state.repeatButton.index + 1) % RepeatState.values.length;

    emit(state.copyWith(repeatButton: RepeatState.values[next]));
    final repeatMode = state.repeatButton;
    switch (repeatMode) {
      case RepeatState.off:
        state.audioHandler.setRepeatMode(AudioServiceRepeatMode.none);
        break;
      case RepeatState.repeatSong:
        state.audioHandler.setRepeatMode(AudioServiceRepeatMode.one);
        break;
      case RepeatState.repeatPlaylist:
        state.audioHandler.setRepeatMode(AudioServiceRepeatMode.all);
        break;
    }
  }

  void seek(Duration position) => state.audioHandler.seek(position);

  void shuffle() {
    final enable = !state.isShuffleModeEnabled;
    emit(state.copyWith(isShuffleModeEnabled: enable));
    if (enable) {
      state.audioHandler.setShuffleMode(AudioServiceShuffleMode.all);
    } else {
      state.audioHandler.setShuffleMode(AudioServiceShuffleMode.none);
    }
  }

  void sort() {
    final enable = !state.isSortModeEnabled;
    emit(state.copyWith(isSortModeEnabled: enable));
    if (enable) {
      (state.audioHandler.queue.value)
          .sort((a, b) => (a.title).compareTo((b.title)));
    } else {
      (state.audioHandler.queue.value)
          .sort((a, b) => (b.title).compareTo((a.title)));
    }
  }

  void stop() => state.audioHandler.stop();

  void _listenToBufferedPosition() {
    state.audioHandler.playbackState.listen((playbackState) {
      emit(state.copyWith(
          progress: ProgressBarState(
        current: state.progress.current,
        buffered: playbackState.bufferedPosition,
        total: state.progress.total,
      )));
    });
  }

  void _listenToChangesInPlaylist() {
    state.audioHandler.queue.listen((playlist) {
      if (playlist.isEmpty) {
        emit(state.copyWith(
            playlist: [],
            currentSong: const MediaItem(title: 'N/A', id: 'N/A')));
      } else {
        final newList = playlist.map((item) => item).toList();
        emit(state.copyWith(playlist: newList));
      }
      _updateSkipButtons();
    });
  }

  void _listenToChangesInSong() {
    state.audioHandler.mediaItem.listen((mediaItem) {
      emit(state.copyWith(currentSong: mediaItem));
      _updateSkipButtons();
    });
  }

  void _listenToCurrentPosition() {
    AudioService.position.listen((position) {
      emit(state.copyWith(
          progress: ProgressBarState(
        current: position,
        buffered: state.progress.buffered,
        total: state.progress.total,
      )));
    });
  }

  void _listenToPlaybackState() {
    state.audioHandler.playbackState.listen((playbackState) {
      final isPlaying = playbackState.playing;
      final processingState = playbackState.processingState;
      if (processingState == AudioProcessingState.loading ||
          processingState == AudioProcessingState.buffering) {
        emit(state.copyWith(playButton: ButtonState.loading));
      } else if (!isPlaying) {
        emit(state.copyWith(playButton: ButtonState.paused));
      } else if (processingState != AudioProcessingState.completed) {
        emit(state.copyWith(playButton: ButtonState.playing));
      } else {
        state.audioHandler.seek(Duration.zero);
        state.audioHandler.pause();
      }
    });
  }

  void _listenToTotalDuration() {
    state.audioHandler.mediaItem.listen((mediaItem) {
      emit(state.copyWith(
          progress: ProgressBarState(
        current: state.progress.current,
        buffered: state.progress.buffered,
        total: mediaItem?.duration ?? Duration.zero,
      )));
    });
  }

  Future<void> loadPlaylist(List<MediaItem> items) async {
    final mediaItems = (items).map((song) => song).toList();

    await state.audioHandler.addQueueItems(mediaItems);
    emit(state.copyWith(playlist: mediaItems));
  }

  Future<void> updatePlaylist(List<MediaItem> items) async {
    final mediaItems = (items).map((song) => song).toList();

    await state.audioHandler.updateQueue(mediaItems);
    emit(state.copyWith(playlist: mediaItems));
  }

  void _updateSkipButtons() {
    final mediaItem = state.audioHandler.mediaItem.value;
    final playlist = state.audioHandler.queue.value;
    if (playlist.length < 2 || mediaItem == null) {
      emit(state.copyWith(isFirstSong: true, isLastSong: true));
    } else {
      emit(state.copyWith(
          isFirstSong: playlist.first == mediaItem,
          isLastSong: playlist.last == mediaItem));
    }
  }
}
