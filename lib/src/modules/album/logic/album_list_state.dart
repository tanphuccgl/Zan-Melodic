part of 'album_list_bloc.dart';

class AlbumListState extends Equatable {
  final XHandle<List<AlbumModel>> items;
  final bool isSortName;
  final bool isShuffle;
  IconData get shuffleIcon => isShuffle ? Icons.shuffle_on : Icons.shuffle;

  void get sortListByName => (items.data ?? []).sort((a, b) {
        String item1 = a.album;
        String item2 = b.album;
        return item1.compareTo(item2);
      });
  void get sortListByNameReverse => (items.data ?? []).sort((a, b) {
        String item1 = a.album;
        String item2 = b.album;
        return item2.compareTo(item1);
      });

  const AlbumListState(
      {required this.items, this.isSortName = false, this.isShuffle = false});

  @override
  List<Object?> get props => [items, isSortName, isShuffle];

  AlbumListState copyWith({
    XHandle<List<AlbumModel>>? items,
    bool? isSortName,
    bool? isShuffle,
  }) {
    return AlbumListState(
      items: items ?? this.items,
      isSortName: isSortName ?? this.isSortName,
      isShuffle: isShuffle ?? this.isShuffle,
    );
  }
}
