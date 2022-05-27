part of 'genre_detail_bloc.dart';

class GenreDetailState extends UpperControlState {
  final XHandle<List<SongModel>> items;
  final GenreModel genre;
  void get shuffleList => isShuffle ? null : (items.data ?? []).shuffle();

  void get sortListByName => (items.data ?? []).sort((a, b) => isSortName
      ? (b.title).compareTo((a.title))
      : (a.title).compareTo((b.title)));

  const GenreDetailState(
      {required this.items,
      bool isSortName = false,
      bool isShuffle = false,
      required this.genre})
      : super(
          isShuffle: isShuffle,
          isSortName: isSortName,
        );

  @override
  List<Object?> get props => [
        items,
        isSortName,
        isShuffle,
        genre,
      ];

  @override
  GenreDetailState copyWithItems({
    XHandle<List<SongModel>>? items,
    bool? isSortName,
    bool? isShuffle,
    GenreModel? genre,
  }) {
    sortListByName;
    shuffleList;
    return GenreDetailState(
      items: items ?? this.items,
      isSortName: isSortName ?? this.isSortName,
      isShuffle: isShuffle ?? this.isShuffle,
      genre: genre ?? this.genre,
    );
  }
}
