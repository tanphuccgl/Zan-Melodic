part of 'tracks_bloc.dart';

class TracksState extends Equatable {
  final XHandle<List<XTracks>> items;

  const TracksState({required this.items});

  @override
  List<Object?> get props => [items];

  TracksState copyWith({
    XHandle<List<XTracks>>? items,
  }) {
    return TracksState(
      items: items ?? this.items,
    );
  }
}
