import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/repositories/audio_query/base_audio_query.dart';

class PlaylistAudioQuery extends BaseAudioQuery {
  Future<List<PlaylistModel>> getPlaylistFromLocal() async {
    List<PlaylistModel> _list = await audioQuery.queryPlaylists();
    return _list;
  }

  Future<List<SongModel>> getSongFromPlaylist(int idPlaylist) async {
    List<SongModel> _list = await audioQuery.queryAudiosFrom(
      AudiosFromType.PLAYLIST,
      idPlaylist,
    );
    return _list;
  }

  Future<bool> createPlaylist(String name) async {
    final _value = await audioQuery.createPlaylist(name);
    return _value;
  }

  Future<bool> removePlaylist(int idPlaylist) async {
    final _value = await audioQuery.removePlaylist(idPlaylist);
    return _value;
  }

  Future<bool> addToPlaylist(
      {required int idPlaylist, required int idSongs}) async {
    final _value = await audioQuery.addToPlaylist(idPlaylist, idSongs);
    return _value;
  }

  Future<bool> removeFromPlaylist(
      {required int idPlaylist, required int idSongs}) async {
    final _value = await audioQuery.removeFromPlaylist(idPlaylist, idSongs);
    return _value;
  }

  // : catch error Stack Overflow
  Future<bool> renameToPlaylist(
      {required int idPlaylist, required String name}) async {
    var _value = await audioQuery.renamePlaylist(idPlaylist, name);

    return _value;
  }
}
