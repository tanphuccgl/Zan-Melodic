part of 'tracks_bloc.dart';

class TracksState extends Equatable {
  final XHandle<List<SongModel>> items;
  final bool isSortName;
  final bool isShuffle;
  IconData get shuffleIcon => isShuffle ? Icons.shuffle_on : Icons.shuffle;
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

  const TracksState(
      {required this.items, this.isSortName = false, this.isShuffle = false});

  @override
  List<Object?> get props => [items, isSortName, isShuffle];

  TracksState copyWith({
    XHandle<List<SongModel>>? items,
    bool? isSortName,
    bool? isShuffle,
  }) {
    return TracksState(
      items: items ?? this.items,
      isSortName: isSortName ?? this.isSortName,
      isShuffle: isShuffle ?? this.isShuffle,
    );
  }
}
