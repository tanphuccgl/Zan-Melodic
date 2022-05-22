part of 'favorites_bloc.dart';

class FavoritesState extends UpperControlState {
  final XHandle<List<SongModel>> items;
  final List<FavoritesEntity> favoriteList;
  bool isFavorites(int idSong) {
    var _list = favoriteList.where(
      (e) => e.id == idSong,
    );
    return _list.isEmpty ? false : true;
  }

  void get shuffleList => isShuffle ? null : (items.data ?? []).shuffle();

  void get sortListByName => (items.data ?? []).sort((a, b) => isSortName
      ? (b.title).compareTo((a.title))
      : (a.title).compareTo((b.title)));

  const FavoritesState({
    required this.items,
    bool isSortName = false,
    bool isShuffle = false,
    required this.favoriteList,
  }) : super(
          isShuffle: isShuffle,
          isSortName: isSortName,
        );

  @override
  List<Object?> get props => [
        items,
        isShuffle,
        isSortName,
        favoriteList,
      ];
  @override
  FavoritesState copyWithItems({
    XHandle<List<SongModel>>? items,
    bool? isSortName,
    bool? isShuffle,
    List<FavoritesEntity>? favoriteList,
  }) {
    sortListByName;
    shuffleList;
    return FavoritesState(
      items: items ?? this.items,
      isSortName: isSortName ?? this.isSortName,
      isShuffle: isShuffle ?? this.isShuffle,
      favoriteList: favoriteList ?? this.favoriteList,
    );
  }
}
