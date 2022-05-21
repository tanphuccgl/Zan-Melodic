part of 'discover_bloc.dart';

class DiscoverState extends Equatable {
  final XHandle<List<XAudio>> items;

  const DiscoverState({required this.items});

  @override
  List<Object?> get props => [items];

  DiscoverState copyWithItems({
    XHandle<List<XAudio>>? items,
  }) {
    return DiscoverState(
      items: items ?? this.items,
    );
  }
}
