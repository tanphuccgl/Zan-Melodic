import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/models/result.dart';

abstract class ArtistRepository {
  Future<XResult<List<ArtistModel>>> getListOfArtist();
  Future<XResult<List<SongModel>>> getListOfSongFromArtist(int idArtist);
}
