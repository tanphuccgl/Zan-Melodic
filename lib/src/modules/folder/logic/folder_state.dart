part of 'folder_bloc.dart';

class FolderState extends UpperControlState {
  final XHandle<List<String>> items;

  void get sortListByName => (items.data ?? [])
      .sort((a, b) => isSortName ? (b).compareTo((a)) : (a).compareTo((b)));

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
    sortListByName;
    return FolderState(
      items: items ?? this.items,
      isSortName: isSortName ?? this.isSortName,
      isShuffle: isShuffle ?? this.isShuffle,
    );
  }
}
