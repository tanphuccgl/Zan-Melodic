import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/models/result.dart';

abstract class TracksRepository {
  Future<XResult<List<SongModel>>> getAllTracks();
}
