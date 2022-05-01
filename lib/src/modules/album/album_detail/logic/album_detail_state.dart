part of 'album_detail_bloc.dart';

class AlbumDetailState extends Equatable {
  final XHandle<List<SongModel>> items;
  final AlbumModel album;
  final bool isSortName;
  final bool isShuffle;
  IconData get shuffleIcon => isShuffle ? Icons.shuffle_on : Icons.shuffle;
  IconData get sortIcon =>
      isSortName ? Icons.sort : Icons.sort_by_alpha_outlined;

  void get sortListByName => (items.data ?? []).sort((a, b) {
        String item1 = a.title;
        String item2 = b.title;
        return item1.compareTo(item2);
      });
  void get sortListByNameReverse => (items.data ?? []).sort((a, b) {
        String item1 = a.title;
        String item2 = b.title;
        return item2.compareTo(item1);
      });

  const AlbumDetailState(
      {required this.items,
      this.isSortName = false,
      this.isShuffle = false,
      required this.album});

  @override
  List<Object?> get props => [items, isSortName, isShuffle];

  AlbumDetailState copyWith({
    XHandle<List<SongModel>>? items,
    bool? isSortName,
    bool? isShuffle,
    AlbumModel? album,
  }) {
    return AlbumDetailState(
      items: items ?? this.items,
      isSortName: isSortName ?? this.isSortName,
      isShuffle: isShuffle ?? this.isShuffle,
      album: album ?? this.album,
    );
  }
}