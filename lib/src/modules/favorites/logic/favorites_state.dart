part of 'favorites_bloc.dart';

class FavoritesState extends Equatable {
  final XHandle<List<FavoritesEntity>> items;
  bool isFavorites(int idSong) {
    var _list = (items.data ?? []).where(
      (e) => e.id == idSong,
    );
    return _list.isEmpty ? false : true;
  }

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

  const FavoritesState({required this.items});

  @override
  List<Object?> get props => [
        items,
      ];

  FavoritesState copyWithItems({
    XHandle<List<FavoritesEntity>>? items,
  }) {
    return FavoritesState(
      items: items ?? this.items,
    );
  }
}
