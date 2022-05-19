enum TabIndex {
  discover,
  favorites,
  song,
  playlist,
  album,
  folder,
}
enum TabDetailSongIndex {
  info,
  now,
  lyric,
}

extension TabIndexExt on TabIndex {
  String lableOf() {
    switch (this) {
      case TabIndex.discover:
        return "Discover";
      case TabIndex.favorites:
        return "Favorites";
      case TabIndex.song:
        return "Tracks";
      case TabIndex.playlist:
        return "Playlist";
      case TabIndex.album:
        return "Album";
      case TabIndex.folder:
        return "Folder";

      default:
        return "N/A";
    }
  }
}
