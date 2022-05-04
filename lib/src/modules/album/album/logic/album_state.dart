part of 'album_bloc.dart';

class AlbumState extends Equatable {
  final XHandle<List<AlbumModel>> items;
  final bool isSortName;
  final bool isShuffle;

  Color get shuffleColorIcon =>
      isShuffle ? MyColors.colorPrimary : MyColors.colorWhite;

  Color get sortColorIcon =>
      isSortName ? MyColors.colorPrimary : MyColors.colorWhite;

  void get sortListByName => (items.data ?? []).sort((a, b) {
        String item1 = a.album;
        String item2 = b.album;
        return item1.compareTo(item2);
      });
  void get sortListByNameReverse => (items.data ?? []).sort((a, b) {
        String item1 = a.album;
        String item2 = b.album;
        return item2.compareTo(item1);
      });

  const AlbumState(
      {required this.items, this.isSortName = false, this.isShuffle = false});

  @override
  List<Object?> get props => [items, isSortName, isShuffle];

  AlbumState copyWith({
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
