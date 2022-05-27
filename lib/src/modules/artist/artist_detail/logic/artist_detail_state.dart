part of 'artist_detail_bloc.dart';

class ArtistDetailState extends UpperControlState {
  final XHandle<List<SongModel>> items;
  final ArtistModel artist;
  void get shuffleList => isShuffle ? null : (items.data ?? []).shuffle();

  void get sortListByName => (items.data ?? []).sort((a, b) => isSortName
      ? (b.title).compareTo((a.title))
      : (a.title).compareTo((b.title)));

  const ArtistDetailState(
      {required this.items,
      bool isSortName = false,
      bool isShuffle = false,
      required this.artist})
      : super(
          isShuffle: isShuffle,
          isSortName: isSortName,
        );

  @override
  List<Object?> get props => [
        items,
        isSortName,
        isShuffle,
        artist,
      ];

  @override
  ArtistDetailState copyWithItems({
    XHandle<List<SongModel>>? items,
    bool? isSortName,
    bool? isShuffle,
    ArtistModel? artist,
  }) {
    sortListByName;
    shuffleList;
    return ArtistDetailState(
      items: items ?? this.items,
      isSortName: isSortName ?? this.isSortName,
      isShuffle: isShuffle ?? this.isShuffle,
      artist: artist ?? this.artist,
    );
  }
}
