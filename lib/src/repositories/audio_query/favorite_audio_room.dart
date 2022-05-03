import 'package:on_audio_query/on_audio_query.dart';
import 'package:on_audio_room/on_audio_room.dart';

class FavoriteAudioRoom {
  Future<void> init() async {
    await OnAudioRoom().initRoom(RoomType.FAVORITES); //Add the RoomType.
  }

  Map<dynamic, dynamic> songGetMap(
    SongModel song,
  ) {
    Map<dynamic, dynamic> _favoritesEntity = {
      "_data": song.data,
      "_display_name": song.displayName,
      "_id": song.id,
      "album": song.album,
      "album_id": song.albumId,
      "artist": song.artist,
      "artist_id": song.artistId,
      "date_added": song.dateAdded,
      "duration": song.duration,
      "title": song.title,
      "artwork": null,
    };
    return _favoritesEntity;
  }

  Future<int?> addToFavorites(SongModel song) async {
    final int? _value = await OnAudioRoom().addTo(
      RoomType.FAVORITES,
      songGetMap(song).toFavoritesEntity(),
    );
    return _value;
  }

  Future<List<FavoritesEntity>> fetchSongsFromFavorite() async {
    List<FavoritesEntity> _queryResult =
        await OnAudioRoom().queryFavorites(limit: 1000);
    return _queryResult;
  }

  Future<bool> isFavorites(SongModel song) async {
    final bool _value = await OnAudioRoom().checkIn(
      RoomType.FAVORITES,
      song.id,
    );
    return _value;
  }

  Future<bool> removeFromFavorites(int key) async {
    final bool _value = await OnAudioRoom().deleteFrom(
      RoomType.FAVORITES,
      key,
    );
    return _value;
  }
}
