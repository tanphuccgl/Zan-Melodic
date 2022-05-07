part of 'folder_bloc.dart';

class FolderState extends UpperControlState {
  final XHandle<List<String>> items;

  @override
  void sortListByName({bool reverse = false}) => (items.data ?? [])
      .sort((a, b) => reverse ? (b).compareTo((a)) : (a).compareTo((b)));

  const FolderState({
    required this.items,
    bool isSortName = false,
    bool isShuffle = false,
  }) : super(
          isShuffle: isShuffle,
          isSortName: isSortName,
        );

  @override
  List<Object?> get props => [
        items,
        isSortName,
        isShuffle,
      ];

  @override
  FolderState copyWithItems({
    XHandle<List<String>>? items,
    bool? isSortName,
    bool? isShuffle,
  }) {
    return FolderState(
      items: items ?? this.items,
      isSortName: isSortName ?? this.isSortName,
      isShuffle: isShuffle ?? this.isShuffle,
    );
  }
}
