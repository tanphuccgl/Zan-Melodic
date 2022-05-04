part of 'playlist_detail_bloc.dart';

class PlaylistDetailState extends Equatable {
  final XHandle<List<SongModel>> items;
  final PlaylistModel playlist;
  final int numberSongs;
  final bool isSortName;
  final bool isShuffle;
  Color get shuffleColorIcon =>
      isShuffle ? MyColors.colorPrimary : MyColors.colorWhite;

  Color get sortColorIcon =>
      isSortName ? MyColors.colorPrimary : MyColors.colorWhite;
  void get sortListByName => (items.data ?? []).sort((a, b) {
        String item1 = a.title;
        String item2 = b.title;
        return item1.compareTo(item2);
      });
  void get sortListByNameReverse => (items.data ?? []).sort((a, b) {
        String item1 = a.title;
        String item2 = b.title;
        return item2.compareTo(item1);
      });

  const PlaylistDetailState({
    required this.items,
    this.isSortName = false,
    this.isShuffle = false,
    required this.playlist,
    this.numberSongs = 0,
  });

  @override
  List<Object?> get props => [
        items,
        isSortName,
        isShuffle,
        playlist,
        numberSongs,
      ];

  PlaylistDetailState copyWith({
    XHandle<List<SongModel>>? items,
    bool? isSortName,
    bool? isShuffle,
    PlaylistModel? playlist,
    int? numberSongs,
  }) {
    return PlaylistDetailState(
      items: items ?? this.items,
      isSortName: isSortName ?? this.isSortName,
      isShuffle: isShuffle ?? this.isShuffle,
      playlist: playlist ?? this.playlist,
      numberSongs: numberSongs ?? this.numberSongs,
    );
  }
}
