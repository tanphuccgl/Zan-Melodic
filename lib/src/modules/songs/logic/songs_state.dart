part of 'songs_bloc.dart';

class SongsState extends UpperControlState {
  final XHandle<List<SongModel>> items;
  final bool isLoadPlaylist;

  const SongsState({
    required this.items,
    bool isSortName = false,
    bool isShuffle = false,
    this.isLoadPlaylist = false,
  }) : super(
          isShuffle: isShuffle,
          isSortName: isSortName,
        );

  @override
  List<Object?> get props => [
        items,
        isSortName,
        isShuffle,
        isLoadPlaylist,
      ];

  void get sortListByName => (items.data ?? []).sort((a, b) => isSortName
      ? (b.title).compareTo((a.title))
      : (a.title).compareTo((b.title)));
  void get shuffleList => isShuffle ? null : (items.data ?? []).shuffle();

  @override
  SongsState copyWithItems({
    XHandle<List<SongModel>>? items,
    bool? isSortName,
    bool? isShuffle,
    bool? isLoadPlaylist,
  }) {
    sortListByName;
    shuffleList;
    return SongsState(
      items: items ?? this.items,
      isSortName: isSortName ?? this.isSortName,
      isShuffle: isShuffle ?? this.isShuffle,
      isLoadPlaylist: isLoadPlaylist ?? this.isLoadPlaylist,
    );
  }
}
