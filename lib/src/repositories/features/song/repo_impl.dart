import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/models/result.dart';
import 'package:zanmelodic/src/repositories/audio_query/song_audio_query.dart';
import 'package:zanmelodic/src/repositories/features/song/repo.dart';

class SongRepositoryImpl implements SongRepository {
  @override
  Future<XResult<List<SongModel>>> getListOfSongs() async {
    try {
      var data = await SongAudioQuery().getSongFromLocal();
      return XResult.success(data);
    } catch (e) {
      return XResult.error(e.toString());
    }
  }
}
