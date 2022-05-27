part of 'audio_handle_bloc.dart';

class AudioHandleState extends Equatable {
  final MediaItem currentSong;
  final List<MediaItem> playlist;
  final ProgressBarState progress;
  final RepeatState repeatButton;
  final bool isFirstSong;
  final ButtonState playButton;
  final bool isLastSong;
  final bool isShuffleModeEnabled;
  final AudioHandler audioHandler;
  final bool isSortModeEnabled;
  final bool isShowBottomBar;
  final List<double> waveform;
  final Color mainColor;

  const AudioHandleState({
    required this.currentSong,
    required this.playlist,
    this.isFirstSong = true,
    this.isLastSong = true,
    this.isShuffleModeEnabled = false,
    required this.audioHandler,
    this.playButton = ButtonState.paused,
    required this.progress,
    this.repeatButton = RepeatState.off,
    this.isSortModeEnabled = false,
    this.isShowBottomBar = false,
    required this.waveform,
    this.mainColor = MyColors.colorBackground,
  });

  @override
  List<Object?> get props => [
        currentSong,
        playlist,
        isFirstSong,
        isLastSong,
        isShuffleModeEnabled,
        audioHandler,
        playButton,
        progress,
        repeatButton,
        isSortModeEnabled,
        isShowBottomBar,
        waveform,
        mainColor,
      ];

  Color get shuffleColorIcon =>
      isShuffleModeEnabled ? MyColors.colorPrimary : MyColors.colorWhite;

  Color get sortColorIcon =>
      isSortModeEnabled ? MyColors.colorPrimary : MyColors.colorWhite;

  SongModel convertMediaToSong(MediaItem media, List<SongModel> songs) {
    int idMedia = int.parse(media.id);
    final SongModel song =
        songs.singleWhere((e) => e.id == idMedia || e.title == media.title);

    return song;
  }

  AudioHandleState copyWith({
    MediaItem? currentSong,
    List<MediaItem>? playlist,
    bool? isFirstSong,
    bool? isLastSong,
    bool? isShuffleModeEnabled,
    AudioHandler? audioHandler,
    ButtonState? playButton,
    ProgressBarState? progress,
    RepeatState? repeatButton,
    bool? isSortModeEnabled,
    bool? isShowBottomBar,
    List<double>? waveform,
    Color? mainColor,
  }) {
    return AudioHandleState(
      currentSong: currentSong ?? this.currentSong,
      playlist: playlist ?? this.playlist,
      isFirstSong: isFirstSong ?? this.isFirstSong,
      isLastSong: isLastSong ?? this.isLastSong,
      isShuffleModeEnabled: isShuffleModeEnabled ?? this.isShuffleModeEnabled,
      audioHandler: audioHandler ?? this.audioHandler,
      playButton: playButton ?? this.playButton,
      progress: progress ?? this.progress,
      repeatButton: repeatButton ?? this.repeatButton,
      isSortModeEnabled: isSortModeEnabled ?? this.isSortModeEnabled,
      isShowBottomBar: isShowBottomBar ?? this.isShowBottomBar,
      waveform: waveform ?? this.waveform,
      mainColor: mainColor ?? this.mainColor,
    );
  }
}
