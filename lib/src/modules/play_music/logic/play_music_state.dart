part of 'play_music_bloc.dart';

class PlayMusicState extends Equatable {
  final SongModel tracks;
  final AudioPlayer audioPlayer;
  final Duration currentPosition;
  final Duration endPosition;
  final bool isPlaying;
  final bool isEnableShuffle;
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

  IconData get shuffleIcon =>
      isEnableShuffle ? Icons.shuffle_on : Icons.shuffle;

  // ignore: unnecessary_null_comparison
  bool get isShowPlayBottomBar => tracks.id == null ? false : true;
  String get currentTime => XUtil.formatDuration(currentPosition);
  String get totalTime => XUtil.formatDuration(endPosition);

  const PlayMusicState({
    this.currentPosition = Duration.zero,
    this.endPosition = Duration.zero,
    required this.tracks,
    this.isPlaying = false,
    required this.audioPlayer,
    this.isEnableShuffle = false,
    this.loopMode = LoopMode.off,
  });

  @override
  List<Object?> get props => [
        tracks,
        isPlaying,
        audioPlayer,
        currentPosition,
        endPosition,
        isEnableShuffle,
        loopMode,
      ];

  PlayMusicState copyWith({
    SongModel? tracks,
    bool? isPlaying,
    AudioPlayer? audioPlayer,
    Duration? currentPosition,
    Duration? endPosition,
    bool? isEnableShuffle,
    LoopMode? loopMode,
  }) {
    return PlayMusicState(
      tracks: tracks ?? this.tracks,
      isPlaying: isPlaying ?? this.isPlaying,
      audioPlayer: audioPlayer ?? this.audioPlayer,
      currentPosition: currentPosition ?? this.currentPosition,
      endPosition: endPosition ?? this.endPosition,
      isEnableShuffle: isEnableShuffle ?? this.isEnableShuffle,
      loopMode: loopMode ?? this.loopMode,
    );
  }
}
