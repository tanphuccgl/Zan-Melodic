import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/models/result.dart';

abstract class AlbumRepository {
  Future<XResult<List<AlbumModel>>> getListOfAlbums();
  Future<XResult<List<SongModel>>> getListOfSongFromAlbum(int idAlbum);
}
