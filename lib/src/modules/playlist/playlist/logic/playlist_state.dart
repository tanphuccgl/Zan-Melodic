part of 'playlist_bloc.dart';

class PlaylistState extends Equatable {
  final XHandle<List<PlaylistModel>> items;
  final bool isSortName;
  final bool isShuffle;
  final String namePlaylist;
  final bool pureName;
  final PlaylistModel playlist;
  final List<PlaylistModel> playlistsDialog;

  String get isValidName {
    return pureName ? XUtil.isValidNameCreatePlaylist(namePlaylist) : "";
  }

  IconData get shuffleIcon => isShuffle ? Icons.shuffle_on : Icons.shuffle;
  IconData get sortIcon =>
      isSortName ? Icons.sort : Icons.sort_by_alpha_outlined;

  void get sortListByName => (items.data ?? []).sort((a, b) {
        String item1 = a.playlist;
        String item2 = b.playlist;
        return item1.compareTo(item2);
      });
  void get sortListByNameReverse => (items.data ?? []).sort((a, b) {
        String item1 = a.playlist;
        String item2 = b.playlist;
        return item2.compareTo(item1);
      });

  const PlaylistState({
    required this.items,
    this.isSortName = false,
    this.isShuffle = false,
    this.namePlaylist = '',
    this.pureName = false,
    required this.playlist,
    required this.playlistsDialog,
  });

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

  PlaylistState copyWith({
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
