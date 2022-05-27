part of 'genre_bloc.dart';

class GenreState extends UpperControlState {
  final XHandle<List<GenreModel>> items;

  void get sortListByName => (items.data ?? []).sort((a, b) => isSortName
      ? (b.genre).compareTo((a.genre))
      : (a.genre).compareTo((b.genre)));
  void get shuffleList => isShuffle ? null : (items.data ?? []).shuffle();

  const GenreState({
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
  GenreState copyWithItems({
    XHandle<List<GenreModel>>? items,
    bool? isSortName,
    bool? isShuffle,
  }) {
    sortListByName;
    shuffleList;
    return GenreState(
      items: items ?? this.items,
      isSortName: isSortName ?? this.isSortName,
      isShuffle: isShuffle ?? this.isShuffle,
    );
  }
}
