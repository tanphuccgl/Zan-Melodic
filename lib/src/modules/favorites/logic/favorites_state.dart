part of 'favorites_bloc.dart';

class FavoritesState extends UpperControlState {
  final XHandle<List<FavoritesEntity>> items;
  bool isFavorites(int idSong) {
    var _list = (items.data ?? []).where(
      (e) => e.id == idSong,
    );
    return _list.isEmpty ? false : true;
  }

  @override
  void sortListByName({bool reverse = false}) =>
      (items.data ?? []).sort((a, b) => reverse
          ? (b.title).compareTo((a.title))
          : (a.title).compareTo((b.title)));

  List<SongModel> castFavoritesEntityToSong(
      {required List<SongModel> listOfSongs,
      required List<FavoritesEntity> listOfFavoritesEntity}) {
    List<SongModel> _listResult = [];
    for (int i = 0; i < listOfSongs.length; i++) {
      for (int j = 0; j < listOfFavoritesEntity.length; j++) {
        if (listOfSongs[i].id == listOfFavoritesEntity[j].id) {
          _listResult.add(listOfSongs[i]);
        }
      }
    }

    return _listResult;
  }

  const FavoritesState({
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
        isShuffle,
        isSortName,
      ];
  @override
  FavoritesState copyWithItems({
    XHandle<List<FavoritesEntity>>? items,
    bool? isSortName,
    bool? isShuffle,
  }) {
    return FavoritesState(
      items: items ?? this.items,
      isSortName: isSortName ?? this.isSortName,
      isShuffle: isShuffle ?? this.isShuffle,
    );
  }
}
