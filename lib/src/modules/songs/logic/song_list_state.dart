part of 'song_list_bloc.dart';

class SongListState extends UpperControlState {
  final XHandle<List<SongModel>> items;
  final bool isLoadPlaylist;

  const SongListState({
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

  @override
  SongListState copyWithItems({
    XHandle<List<SongModel>>? items,
    bool? isSortName,
    bool? isShuffle,
    bool? isLoadPlaylist,
  }) {
    sortListByName();
    return SongListState(
      items: items ?? this.items,
      isSortName: isSortName ?? this.isSortName,
      isShuffle: isShuffle ?? this.isShuffle,
      isLoadPlaylist: isLoadPlaylist ?? this.isLoadPlaylist,
    );
  }

  void sortListByName() => (items.data ?? []).sort((a, b) => isSortName
      ? (b.title).compareTo((a.title))
      : (a.title).compareTo((b.title)));
}
