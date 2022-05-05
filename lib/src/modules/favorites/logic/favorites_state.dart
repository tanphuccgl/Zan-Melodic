part of 'favorites_bloc.dart';

class FavoritesState extends Equatable {
  final XHandle<List<FavoritesEntity>> songs;
  bool isFavorite(int id) {
    var _list = (songs.data ?? []).where(
      (e) => e.id == id,
    );
    return _list.isEmpty ? false : true;
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
