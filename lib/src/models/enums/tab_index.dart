enum TabIndex {
  discover,
  recently,
  favorites,
  song,
  playlist,
  album,
  artist,
  genre,
  folder,
}

extension TabIndexExt on TabIndex {
  String lableOf() {
    switch (this) {
      case TabIndex.discover:
        return "Discover";
      case TabIndex.recently:
        return "Recently";
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
      case TabIndex.genre:
        return "Genre";
      case TabIndex.folder:
        return "Folder";

      default:
        return "N/A";
    }
  }
}
