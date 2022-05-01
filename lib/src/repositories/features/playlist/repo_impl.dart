import 'package:zanmelodic/src/models/result.dart';
import 'package:on_audio_query_platform_interface/details/on_audio_query_helper.dart';
import 'package:zanmelodic/src/repositories/audio_query.dart';
import 'package:zanmelodic/src/repositories/features/playlist/repo.dart';

class PlaylistRepositoryImpl extends PlaylistRepository {
  @override
  Future<XResult<List<PlaylistModel>>> getListOfPlaylist() async {
    try {
      var data = await XAudioQuery.getPlaylistFromLocal();
      return XResult.success(data);
    } catch (e) {
      return XResult.error(e.toString());
    }
  }

//TODO
  @override
  Future<XResult<List<SongModel>>> getListOfSongFromPlaylist(
      int idPlaylist) async {
    try {
      var data = await XAudioQuery.getSongFromPlaylist(idPlaylist);
      return XResult.success(data);
    } catch (e) {
      return XResult.error(e.toString());
    }
  }

  @override
  Future<XResult> addNewPlaylist(String name) async {
    try {
      var data = await XAudioQuery.createPlaylist(name);
      return XResult.success(data);
    } catch (e) {
      return XResult.error(e.toString());
    }
  }
}
