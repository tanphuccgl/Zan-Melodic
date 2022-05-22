part of 'album_bloc.dart';

class AlbumState extends UpperControlState {
  final XHandle<List<AlbumModel>> items;

  void get sortListByName => (items.data ?? []).sort((a, b) => isSortName
      ? (b.album).compareTo((a.album))
      : (a.album).compareTo((b.album)));
  void get shuffleList => isShuffle ? null : (items.data ?? []).shuffle();

  const AlbumState({
    required this.items,
    bool isSortName = false,
    bool isShuffle = false,
  }) : super(
          isShuffle: isShuffle,
          isSortName: isSortName,
        );

  @override
  List<Object?> get props => [
        items,
        isSortName,
        isShuffle,
      ];

  @override
  AlbumState copyWithItems({
    XHandle<List<AlbumModel>>? items,
    bool? isSortName,
    bool? isShuffle,
  }) {
    sortListByName;
    shuffleList;
    return AlbumState(
      items: items ?? this.items,
      isSortName: isSortName ?? this.isSortName,
      isShuffle: isShuffle ?? this.isShuffle,
    );
  }
}
