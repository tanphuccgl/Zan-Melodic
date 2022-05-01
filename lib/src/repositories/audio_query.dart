import 'dart:developer';

import 'package:on_audio_query/on_audio_query.dart';

class XAudioQuery {
  static late final OnAudioQuery audioQuery;
  static init() {
    audioQuery = OnAudioQuery();
    audioQuery.permissionsRequest();
  }

  static Future<List<SongModel>> getAudiofromLocal() async {
    List<SongModel> _listAudio = await audioQuery.querySongs();
    return _listAudio;
  }

  static Future<List<SongModel>> getSongFromLocal() async {
    final _list = await getAudiofromLocal();
    var value = _list
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
    var value = _list
        .where((e) =>
            e.isMusic == true &&
            e.data.contains('/storage/emulated/0/Call/') == false &&
            e.albumId == idAlbum)
        .toList();
    return value;
  }

  static Future<List<PlaylistModel>> getPlaylistFromLocal() async {
    List<PlaylistModel> _list = await audioQuery.queryPlaylists();
    log(_list.toString());
    return _list;
  }

  static Future<bool> createPlaylist(String name) async {
    var _value = await audioQuery.createPlaylist(name);
    return _value;
  }

  static Future<bool> removePlaylist(int idPlaylist) async {
    var _value = await audioQuery.removePlaylist(idPlaylist);
    return _value;
  }

//TODO
  static Future<List<SongModel>> getSongFromPlaylist(int idPlaylist) async {
    final _list = await getAudiofromLocal();
    var value = _list
        .where((e) =>
            e.isMusic == true &&
            e.data.contains('/storage/emulated/0/Call/') == false &&
            e.albumId == idPlaylist)
        .toList();
    return value;
  }
}
