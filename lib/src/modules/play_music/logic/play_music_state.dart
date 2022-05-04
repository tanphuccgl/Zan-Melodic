part of 'play_music_bloc.dart';

class PlayMusicState extends Equatable {
  final SongModel song;
  final AudioPlayer audioPlayer;
  final Duration currentPosition;
  final Duration endPosition;
  final bool isPlaying;
  final LoopMode loopMode;
  bool get isEndSong =>
      audioPlayer.processingState == ProcessingState.completed;

  String get playIconCircled {
    String _icon;
    _icon = isPlaying ? MyIcons.pauseCircledIcon : MyIcons.playCircledIcon;
    if (isEndSong) {
      _icon = MyIcons.playCircledIcon;
    }
    return _icon;
  }

  double get sizePlayIconCircled {
    double _size;
    _size = isPlaying ? 30 : 40;
    if (isEndSong) {
      _size = 40;
    }
    return _size;
  }

  double get sizePlayIconCircledMini {
    double _size;
    _size = isPlaying ? 30 : 35;
    if (isEndSong) {
      _size = 35;
    }
    return _size;
  }

  bool get isShowPlayBottomBar => song.id == -1 ? false : true;
  String get currentTime => XUtil.formatDuration(currentPosition);
  String get totalTime => XUtil.formatDuration(endPosition);

  const PlayMusicState({
    this.currentPosition = Duration.zero,
    this.endPosition = Duration.zero,
    required this.song,
    this.isPlaying = false,
    required this.audioPlayer,
    this.loopMode = LoopMode.off,
  });

  @override
  List<Object?> get props => [
        song,
        isPlaying,
        audioPlayer,
        currentPosition,
        endPosition,
        loopMode,
      ];

  PlayMusicState copyWith({
    SongModel? song,
    bool? isPlaying,
    AudioPlayer? audioPlayer,
    Duration? currentPosition,
    Duration? endPosition,
    bool? isEnableShuffle,
    LoopMode? loopMode,
  }) {
    return PlayMusicState(
      song: song ?? this.song,
      isPlaying: isPlaying ?? this.isPlaying,
      audioPlayer: audioPlayer ?? this.audioPlayer,
      currentPosition: currentPosition ?? this.currentPosition,
      endPosition: endPosition ?? this.endPosition,
      loopMode: loopMode ?? this.loopMode,
    );
  }
}
