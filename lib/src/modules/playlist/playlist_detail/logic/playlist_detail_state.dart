part of 'playlist_detail_bloc.dart';

class PlaylistDetailState extends UpperControlState {
  final XHandle<List<SongModel>> items;
  final PlaylistModel playlist;
  final int numberSongs;

  const PlaylistDetailState({
    required this.items,
    bool isSortName = false,
    bool isShuffle = false,
    required this.playlist,
    this.numberSongs = 0,
  }) : super(isShuffle: isShuffle, isSortName: isSortName);

  @override
  List<Object?> get props => [
        items,
        isSortName,
        isShuffle,
        playlist,
        numberSongs,
      ];

  @override
  PlaylistDetailState copyWithItems({
    XHandle<List<SongModel>>? items,
    bool? isSortName,
    bool? isShuffle,
    PlaylistModel? playlist,
    int? numberSongs,
  }) {
    sortListByName;
    shuffleList;
    return PlaylistDetailState(
      items: items ?? this.items,
      isSortName: isSortName ?? this.isSortName,
      isShuffle: isShuffle ?? this.isShuffle,
      playlist: playlist ?? this.playlist,
      numberSongs: numberSongs ?? this.numberSongs,
    );
  }

  void get shuffleList => isShuffle ? null : (items.data ?? []).shuffle();

  void get sortListByName => (items.data ?? []).sort((a, b) => isSortName
      ? (b.title).compareTo((a.title))
      : (a.title).compareTo((b.title)));
}
