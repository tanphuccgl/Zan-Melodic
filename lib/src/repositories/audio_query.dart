import 'package:on_audio_query/on_audio_query.dart';

class XAudioQuery {
  static late final OnAudioQuery audioQuery;

  static init() {
    audioQuery = OnAudioQuery();
  }

  static permissionsRequest() {
    audioQuery.permissionsRequest();
  }

  static Future<List<SongModel>> getAudiofromLocal() async {
    List<SongModel> _listAudio = await audioQuery.querySongs();
    return _listAudio;
  }

  static Future<List<SongModel>> getSongFromLocal() async {
    final _list = await getAudiofromLocal();
    final value = _list
        .where((e) =>
            e.isMusic == true &&
            e.data.contains('/storage/emulated/0/Call/') == false)
        .toList();
    return value;
  }

  static Future<List<AlbumModel>> getAlbumFromLocal() async {
    List<AlbumModel> _listAlbum = await audioQuery.queryAlbums();
    return _listAlbum;
  }

  static Future<List<SongModel>> getSongFromAlbum(int idAlbum) async {
    final _list = await getAudiofromLocal();
    final value = _list
        .where((e) =>
            e.isMusic == true &&
            e.data.contains('/storage/emulated/0/Call/') == false &&
            e.albumId == idAlbum)
        .toList();
    return value;
  }

  static Future<List<PlaylistModel>> getPlaylistFromLocal() async {
    List<PlaylistModel> _list = await audioQuery.queryPlaylists();
    return _list;
  }

  static Future<bool> createPlaylist(String name) async {
    final _value = await audioQuery.createPlaylist(name);
    return _value;
  }

  static Future<bool> removePlaylist(int idPlaylist) async {
    final _value = await audioQuery.removePlaylist(idPlaylist);
    return _value;
  }

  static Future<bool> addToPlaylist(
      {required int idPlaylist, required int idSongs}) async {
    final _value = await audioQuery.addToPlaylist(idPlaylist, idSongs);
    return _value;
  }

  static Future<bool> removeFromPlaylist(
      {required int idPlaylist, required int idSongs}) async {
    final _value = await audioQuery.removeFromPlaylist(idPlaylist, idSongs);
    return _value;
  }

  // : catch error Stack Overflow
  static Future<bool> renameToPlaylist(
      {required int idPlaylist, required String name}) async {
    var _value = await audioQuery.renamePlaylist(idPlaylist, name);

    return _value;
  }

  static Future<List<SongModel>> getSongFromPlaylist(int idPlaylist) async {
    List<SongModel> _list = await audioQuery.queryAudiosFrom(
      AudiosFromType.PLAYLIST,
      idPlaylist,
    );
    return _list;
  }
}
