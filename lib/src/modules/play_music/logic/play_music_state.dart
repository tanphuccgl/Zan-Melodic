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
  IconData get playIcon {
    IconData _icon;
    _icon = isPlaying ? Icons.pause : Icons.play_arrow;
    if (isEndSong) {
      _icon = Icons.play_arrow;
    }
    return _icon;
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
