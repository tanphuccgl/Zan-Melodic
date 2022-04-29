import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/models/result.dart';

abstract class SongRepository {
  Future<XResult<List<SongModel>>> getListOfSongs();
}
