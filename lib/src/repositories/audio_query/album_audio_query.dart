import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/repositories/audio_query/base_audio_query.dart';

class AlbumAudioQuery extends BaseAudioQuery {
  Future<List<AlbumModel>> getAlbumFromLocal() async {
    List<AlbumModel> _listAlbum = await audioQuery.queryAlbums();
    return _listAlbum;
  }

  Future<List<SongModel>> getSongFromAlbum(int idAlbum) async {
    List<SongModel> _list = await audioQuery.queryAudiosFrom(
      AudiosFromType.ALBUM,
      idAlbum,
    );
    return _list;
  }
}
