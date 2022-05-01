import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/models/result.dart';

abstract class PlaylistRepository {
  Future<XResult<List<PlaylistModel>>> getListOfPlaylist();
  Future<XResult> addNewPlaylist(String name);

  Future<XResult<List<SongModel>>> getListOfSongFromPlaylist(int idPlaylist);
}
