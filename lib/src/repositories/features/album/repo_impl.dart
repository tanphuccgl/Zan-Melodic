import 'package:zanmelodic/src/models/result.dart';
import 'package:on_audio_query_platform_interface/details/on_audio_query_helper.dart';
import 'package:zanmelodic/src/repositories/audio_query.dart';
import 'package:zanmelodic/src/repositories/features/album/repo.dart';

class AlbumRepositoryImpl extends AlbumRepository {
  @override
  Future<XResult<List<AlbumModel>>> getListOfAlbums() async {
    try {
      var data = await XAudioQuery.getAlbumfromLocal();
      return XResult.success(data);
    } catch (e) {
      return XResult.error(e.toString());
    }
  }
}
