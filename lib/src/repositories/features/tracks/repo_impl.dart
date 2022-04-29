import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/models/result.dart';
import 'package:zanmelodic/src/repositories/audio_query.dart';
import 'package:zanmelodic/src/repositories/features/tracks/repo.dart';

class TracksRepositoryImpl implements TracksRepository {
  @override
  Future<XResult<List<SongModel>>> getAllTracks() async {
    try {
      var data = await XAudioQuery.fetchTracksFromLocal();
      return XResult.success(data);
    } catch (e) {
      return XResult.error(e.toString());
    }
  }
}
