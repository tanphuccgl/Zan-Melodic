part of 'favorites_bloc.dart';

class FavoritesState extends Equatable {
  final XHandle<List<FavoritesEntity>> songs;
  bool isFavorite(int id) {
    var _list = (songs.data ?? []).where(
      (e) => e.id == id,
    );
    return _list.isEmpty ? false : true;
  }

  List<SongModel> convertFavoritesEntityToSong(
      {required List<SongModel> list,
      required List<FavoritesEntity> favoritesEntity}) {
    List<SongModel> result = [];
    for (int i = 0; i < list.length; i++) {
      for (int j = 0; j < favoritesEntity.length; j++) {
        if (list[i].id == favoritesEntity[j].id) {
          result.add(list[i]);
        }
      }
    }

    return result;
  }

  const FavoritesState({required this.songs});

  @override
  List<Object?> get props => [
        songs,
      ];

  FavoritesState copyWith({
    XHandle<List<FavoritesEntity>>? songs,
  }) {
    return FavoritesState(
      songs: songs ?? this.songs,
    );
  }
}
