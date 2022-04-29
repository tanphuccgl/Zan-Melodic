part of 'tracks_bloc.dart';

class TracksState extends Equatable {
  final XHandle<List<SongModel>> items;

  const TracksState({required this.items});

  @override
  List<Object?> get props => [items];

  TracksState copyWith({
    XHandle<List<SongModel>>? items,
  }) {
    return TracksState(
      items: items ?? this.items,
    );
  }
}
