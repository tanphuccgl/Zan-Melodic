part of 'artist_bloc.dart';

class ArtistState extends Equatable {
  final XHandle<List<ArtistModel>> items;

  const ArtistState({required this.items});
  @override
  List<Object?> get props => [
        items,
      ];

  ArtistState copyWith({
    XHandle<List<ArtistModel>>? items,
  }) {
    return ArtistState(
      items: items ?? this.items,
    );
  }
}
