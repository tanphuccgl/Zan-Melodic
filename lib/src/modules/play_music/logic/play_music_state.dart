part of 'play_music_bloc.dart';

class PlayMusicState extends Equatable {
  final XTracks tracks;
  final AudioPlayer audioPlayer;
  final Duration currentPosition;
  final Duration endPosition;
  final bool isPlaying;
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

  bool get isShowPlayBottomBar => tracks.id.isEmpty ? false : true;
  String get currentTime => XUtil.formatDuration(currentPosition);
  String get totalTime => XUtil.formatDuration(endPosition);

  const PlayMusicState({
    this.currentPosition = Duration.zero,
    this.endPosition = Duration.zero,
    required this.tracks,
    this.isPlaying = false,
    required this.audioPlayer,
  });

  @override
  List<Object?> get props => [
        tracks,
        isPlaying,
        audioPlayer,
        currentPosition,
        endPosition,
      ];

  PlayMusicState copyWith({
    XTracks? tracks,
    bool? isPlaying,
    AudioPlayer? audioPlayer,
    Duration? currentPosition,
    Duration? endPosition,
  }) {
    return PlayMusicState(
      tracks: tracks ?? this.tracks,
      isPlaying: isPlaying ?? this.isPlaying,
      audioPlayer: audioPlayer ?? this.audioPlayer,
      currentPosition: currentPosition ?? this.currentPosition,
      endPosition: endPosition ?? this.endPosition,
    );
  }
}
