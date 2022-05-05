import 'package:zanmelodic/src/models/result.dart';
import 'package:on_audio_room/details/rooms/favorites/favorites_entity.dart';
import 'package:on_audio_query_platform_interface/details/on_audio_query_helper.dart';
import 'package:zanmelodic/src/repositories/audio_query/favorite_audio_room.dart';
import 'package:zanmelodic/src/repositories/features/favorites/repo.dart';

class FavoriteRepositoryImpl extends FavoriteRepository {
  @override
  Future<XResult<List<FavoritesEntity>>> getSongsFromFavorites() async {
    try {
      var data = await FavoriteAudioRoom().fetchSongsFromFavorite();
      return XResult.success(data);
    } catch (e) {
      return XResult.error(e.toString());
    }
  }

  @override
  Future<XResult<List<FavoritesEntity>>> addToFavorite(
      {required SongModel song}) async {
    try {
      final _value = await FavoriteAudioRoom().addToFavorites(song);

      return _value != null
          ? await getSongsFromFavorites()
          : XResult.error('Add to Favorites Error');
    } catch (e) {
      return XResult.error(e.toString());
    }
  }

  @override
  Future<XResult<List<FavoritesEntity>>> removeFromFavorites(int key) async {
    try {
      final _value = await FavoriteAudioRoom().removeFromFavorites(key);

      return _value
          ? await getSongsFromFavorites()
          : XResult.error('Remove from Favorites Error');
    } catch (e) {
      return XResult.error(e.toString());
    }
  }

  @override
  Future<XResult<bool>> checkSongisFavorire(SongModel song) async {
    try {
      var data = await FavoriteAudioRoom().isFavorites(song);
      return XResult.success(data);
    } catch (e) {
      return XResult.error(e.toString());
    }
  }
}
