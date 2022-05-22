part of 'folder_bloc.dart';

class FolderState extends UpperControlState {
  final XHandle<List<XFolder>> items;

  void get sortListByName => (items.data ?? []).sort((a, b) =>
      isSortName ? (b.name).compareTo((a.name)) : (a.name).compareTo((b.name)));
  void get shuffleList => isShuffle ? null : (items.data ?? []).shuffle();

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
    XHandle<List<XFolder>>? items,
    bool? isSortName,
    bool? isShuffle,
  }) {
    sortListByName;
    isShuffle;
    return FolderState(
      items: items ?? this.items,
      isSortName: isSortName ?? this.isSortName,
      isShuffle: isShuffle ?? this.isShuffle,
    );
  }
}
