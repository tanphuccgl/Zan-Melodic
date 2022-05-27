import 'package:on_audio_query_platform_interface/details/on_audio_query_helper.dart';
import 'package:zanmelodic/src/models/result.dart';
import 'package:zanmelodic/src/repositories/audio_query/artist_audio_query.dart';
import 'package:zanmelodic/src/repositories/features/artist/repo.dart';

class ArtistRepositoryImpl extends ArtistRepository {
  @override
  Future<XResult<List<ArtistModel>>> getListOfArtist() async {
    try {
      var data = await ArtistAudioQuery().getArtistFromLocal();
      return XResult.success(data);
    } catch (e) {
      return XResult.error(e.toString());
    }
  }

  @override
  Future<XResult<List<SongModel>>> getListOfSongFromArtist(int idArtist) async {
    try {
      var data = await ArtistAudioQuery().getSongFromArtist(idArtist);
      return XResult.success(data);
    } catch (e) {
      return XResult.error(e.toString());
    }
  }
}
