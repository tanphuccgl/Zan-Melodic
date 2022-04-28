part of 'folder_bloc.dart';

class FolderState extends Equatable {
  final XHandle<List<XFolder>> items;

  const FolderState({required this.items});

  @override
  List<Object?> get props => [items];

  FolderState copyWith({
    XHandle<List<XFolder>>? items,
  }) {
    return FolderState(
      items: items ?? this.items,
    );
  }
}
