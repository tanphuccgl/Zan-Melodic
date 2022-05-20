part of 'album_bloc.dart';

class AlbumState extends UpperControlState {
  final XHandle<List<AlbumModel>> items;

  void sortListByName({bool reverse = false}) =>
      (items.data ?? []).sort((a, b) => reverse
          ? (b.album).compareTo((a.album))
          : (a.album).compareTo((b.album)));

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
    return AlbumState(
      items: items ?? this.items,
      isSortName: isSortName ?? this.isSortName,
      isShuffle: isShuffle ?? this.isShuffle,
    );
  }
}
