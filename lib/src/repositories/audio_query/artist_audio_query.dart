import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/repositories/audio_query/base_audio_query.dart';

class ArtistAudioQuery extends BaseAudioQuery {
  Future<List<ArtistModel>> getArtistFromLocal() async {
    List<ArtistModel> _listArtist = await audioQuery.queryArtists();
    return _listArtist;
  }

  Future<List<SongModel>> getSongFromArtist(int idArtist) async {
    final _list = await getAudiofromLocal();
    final value = _list
        .where((e) =>
            e.isMusic == true &&
            e.data.contains('/storage/emulated/0/Call/') == false &&
            e.artistId == idArtist)
        .toList();
    return value;
  }
}
