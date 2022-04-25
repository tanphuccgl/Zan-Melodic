part of 'play_music_bloc.dart';

class PlayMusicState extends Equatable {
  final XTracks tracks;
  final bool isPlaying;
  IconData get playIcon => isPlaying ? Icons.pause : Icons.play_arrow;
  bool get isShowPlayBottomBar => tracks.id.isEmpty ? false : true;

  const PlayMusicState({required this.tracks, this.isPlaying = false});

  @override
  List<Object?> get props => [tracks, isPlaying];

  PlayMusicState copyWith({XTracks? tracks, bool? isPlaying}) {
    return PlayMusicState(
        tracks: tracks ?? this.tracks, isPlaying: isPlaying ?? this.isPlaying);
  }
}
