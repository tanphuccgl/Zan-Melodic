import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/repositories/audio_query/base_audio_query.dart';

class ArtistAudioQuery extends BaseAudioQuery {
  Future<List<ArtistModel>> getArtistFromLocal() async {
    List<ArtistModel> _listArtist = await audioQuery.queryArtists();
    return _listArtist;
  }

  Future<List<SongModel>> getSongFromArtist(int idArtist) async {
    List<SongModel> _list = await audioQuery.queryAudiosFrom(
      AudiosFromType.ARTIST_ID,
      idArtist,
    );
    return _list;
  }
}
