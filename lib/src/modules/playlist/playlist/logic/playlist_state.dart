part of 'playlist_bloc.dart';

class PlaylistState extends UpperControlState {
  final XHandle<List<PlaylistModel>> items;

  final String namePlaylist;
  final bool pureName;
  final PlaylistModel playlist;
  final List<PlaylistModel> playlistsDialog;
  String get isValidName {
    return pureName ? XUtils.isValidNameCreatePlaylist(namePlaylist) : "";
  }

  @override
  void sortListByName({bool reverse = false}) =>
      (items.data ?? []).sort((a, b) => reverse
          ? (b.playlist).compareTo((a.playlist))
          : (a.playlist).compareTo((b.playlist)));

  const PlaylistState({
    required this.items,
    bool isSortName = false,
    bool isShuffle = false,
    this.namePlaylist = '',
    this.pureName = false,
    required this.playlist,
    required this.playlistsDialog,
  }) : super(
          isShuffle: isShuffle,
          isSortName: isSortName,
        );

  @override
  List<Object?> get props => [
        items,
        isSortName,
        isShuffle,
        namePlaylist,
        pureName,
        playlist,
        playlistsDialog,
      ];

  @override
  PlaylistState copyWithItems({
    XHandle<List<PlaylistModel>>? items,
    bool? isSortName,
    bool? isShuffle,
    String? namePlaylist,
    bool? pureName,
    PlaylistModel? playlist,
    List<PlaylistModel>? playlistsDialog,
  }) {
    return PlaylistState(
      items: items ?? this.items,
      isSortName: isSortName ?? this.isSortName,
      isShuffle: isShuffle ?? this.isShuffle,
      namePlaylist: namePlaylist ?? this.namePlaylist,
      pureName: pureName ?? this.pureName,
      playlist: playlist ?? this.playlist,
      playlistsDialog: playlistsDialog ?? this.playlistsDialog,
    );
  }
}
