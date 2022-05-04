part of 'folder_bloc.dart';

class FolderState extends Equatable {
  final XHandle<Set<String>> items;

  const FolderState({required this.items});

  @override
  List<Object?> get props => [items];

  FolderState copyWith({
    XHandle<Set<String>>? items,
  }) {
    return FolderState(
      items: items ?? this.items,
    );
  }
}
