import 'package:on_audio_query/on_audio_query.dart';
import 'package:on_audio_room/details/rooms/favorites/favorites_entity.dart';
import 'package:zanmelodic/src/models/result.dart';

abstract class FavoriteRepository {
  Future<XResult<List<FavoritesEntity>>> getSongsFromFavorites();
  Future<XResult<List<FavoritesEntity>>> removeFromFavorites(int key);

  Future<XResult<List<FavoritesEntity>>> addToFavorite(
      {required SongModel song});
}
