enum TabIndex {
  discover,
  typeSong,
  favorites,
  song,
  playlist,
  album,
  artist,
  folder,
}

extension TabIndexExt on TabIndex {
  String lableOf() {
    switch (this) {
      case TabIndex.discover:
        return "Discover";
      case TabIndex.typeSong:
        return "Type song";
      case TabIndex.favorites:
        return "Favorites";
      case TabIndex.song:
        return "Tracks";
      case TabIndex.playlist:
        return "Playlist";
      case TabIndex.album:
        return "Album";
      case TabIndex.artist:
        return "Artist";
      case TabIndex.folder:
        return "Folder";

      default:
        return "N/A";
    }
  }
}
