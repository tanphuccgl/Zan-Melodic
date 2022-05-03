import 'package:on_audio_query_platform_interface/details/on_audio_query_helper.dart';
import 'package:zanmelodic/src/models/result.dart';
import 'package:zanmelodic/src/repositories/audio_query/playlist_audio_query.dart';
import 'package:zanmelodic/src/repositories/features/playlist/repo.dart';

class PlaylistRepositoryImpl extends PlaylistRepository {
  @override
  Future<XResult<List<PlaylistModel>>> getListOfPlaylist() async {
    try {
      var data = await PlaylistAudioQuery().getPlaylistFromLocal();
      return XResult.success(data);
    } catch (e) {
      return XResult.error(e.toString());
    }
  }

  @override
  Future<XResult<List<SongModel>>> getListOfSongFromPlaylist(
      int idPlaylist) async {
    try {
      var data = await PlaylistAudioQuery().getSongFromPlaylist(idPlaylist);
      return XResult.success(data);
    } catch (e) {
      return XResult.error(e.toString());
    }
  }

  @override
  Future<XResult<List<PlaylistModel>>> addNewPlaylist(String name) async {
    try {
      await PlaylistAudioQuery().createPlaylist(name);

      return await getListOfPlaylist();
    } catch (e) {
      return XResult.error(e.toString());
    }
  }

  @override
  Future<XResult<List<PlaylistModel>>> removePlaylist(int idPlaylist) async {
    try {
      await PlaylistAudioQuery().removePlaylist(idPlaylist);

      return await getListOfPlaylist();
    } catch (e) {
      return XResult.error(e.toString());
    }
  }

  @override
  Future<XResult<List<PlaylistModel>>> addToPlaylist(
      {required int idPlaylist, required int idSong}) async {
    try {
      await PlaylistAudioQuery()
          .addToPlaylist(idPlaylist: idPlaylist, idSongs: idSong);

      return await getListOfPlaylist();
    } catch (e) {
      return XResult.error(e.toString());
    }
  }

  @override
  Future<XResult<List<SongModel>>> removeFromPlaylist(
      {required int idPlaylist, required int idSong}) async {
    try {
      await PlaylistAudioQuery()
          .removeFromPlaylist(idPlaylist: idPlaylist, idSongs: idSong);

      return await getListOfSongFromPlaylist(idPlaylist);
    } catch (e) {
      return XResult.error(e.toString());
    }
  }

  @override
  Future<XResult<bool>> newNamePlaylist(
      {required int idPlaylist, required String newName}) async {
    try {
      final _value = await PlaylistAudioQuery()
          .renameToPlaylist(idPlaylist: idPlaylist, name: newName);

      return XResult.success(_value);
    } catch (e) {
      return XResult.error(e.toString());
    }
  }
}
