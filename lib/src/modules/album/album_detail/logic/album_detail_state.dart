part of 'album_detail_bloc.dart';

class AlbumDetailState extends UpperControlState {
  final XHandle<List<SongModel>> items;
  final AlbumModel album;
  void get shuffleList => isShuffle ? null : (items.data ?? []).shuffle();

  void get sortListByName => (items.data ?? []).sort((a, b) => isSortName
      ? (b.title).compareTo((a.title))
      : (a.title).compareTo((b.title)));

  const AlbumDetailState(
      {required this.items,
      bool isSortName = false,
      bool isShuffle = false,
      required this.album})
      : super(
          isShuffle: isShuffle,
          isSortName: isSortName,
        );

  @override
  List<Object?> get props => [
        items,
        isSortName,
        isShuffle,
        album,
      ];

  @override
  AlbumDetailState copyWithItems({
    XHandle<List<SongModel>>? items,
    bool? isSortName,
    bool? isShuffle,
    AlbumModel? album,
  }) {
    sortListByName;
    shuffleList;
    return AlbumDetailState(
      items: items ?? this.items,
      isSortName: isSortName ?? this.isSortName,
      isShuffle: isShuffle ?? this.isShuffle,
      album: album ?? this.album,
    );
  }
}
