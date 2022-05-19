part of 'song_list_bloc.dart';

class SongListState extends UpperControlState {
  final XHandle<List<SongModel>> songs;
  final bool isLoadPlaylist;

  @override
  void sortListByName({
    bool reverse = false,
  }) =>
      (songs.data ?? []).sort((a, b) => reverse
          ? (b.title).compareTo((a.title))
          : (a.title).compareTo((b.title)));

  const SongListState({
    required this.songs,
    bool isSortName = false,
    bool isShuffle = false,
    this.isLoadPlaylist = false,
  }) : super(
          isShuffle: isShuffle,
          isSortName: isSortName,
        );

  @override
  List<Object?> get props => [
        songs,
        isSortName,
        isShuffle,
        isLoadPlaylist,
      ];

  @override
  SongListState copyWithItems({
    XHandle<List<SongModel>>? songs,
    bool? isSortName,
    bool? isShuffle,
    bool? isLoadPlaylist,
  }) {
    return SongListState(
      songs: songs ?? this.songs,
      isSortName: isSortName ?? this.isSortName,
      isShuffle: isShuffle ?? this.isShuffle,
      isLoadPlaylist: isLoadPlaylist ?? this.isLoadPlaylist,
    );
  }
}
