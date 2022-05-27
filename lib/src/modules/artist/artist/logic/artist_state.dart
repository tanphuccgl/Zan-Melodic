part of 'artist_bloc.dart';

class ArtistState extends UpperControlState {
  final XHandle<List<ArtistModel>> items;
  void get sortListByName => (items.data ?? []).sort((a, b) => isSortName
      ? (b.artist).compareTo((a.artist))
      : (a.artist).compareTo((b.artist)));
  void get shuffleList => isShuffle ? null : (items.data ?? []).shuffle();

  const ArtistState({
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

  ArtistState copyWith({
    XHandle<List<ArtistModel>>? items,
    bool? isSortName,
    bool? isShuffle,
  }) {
    sortListByName;
    shuffleList;
    return ArtistState(
      items: items ?? this.items,
      isSortName: isSortName ?? this.isSortName,
      isShuffle: isShuffle ?? this.isShuffle,
    );
  }
}
