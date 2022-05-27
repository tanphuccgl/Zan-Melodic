import 'package:on_audio_query_platform_interface/details/on_audio_query_helper.dart';
import 'package:zanmelodic/src/models/result.dart';
import 'package:zanmelodic/src/repositories/audio_query/genre_audio_query.dart';
import 'package:zanmelodic/src/repositories/features/genre/repo.dart';

class GenreRepositoryImpl extends GenreRepository {
  @override
  Future<XResult<List<GenreModel>>> getListOfGenre() async {
    try {
      var data = await GenreAudioQuery().getGenreFromLocal();
      return XResult.success(data);
    } catch (e) {
      return XResult.error(e.toString());
    }
  }

  @override
  Future<XResult<List<SongModel>>> getListOfSongFromGenre(int idGenre) async {
    try {
      var data = await GenreAudioQuery().getSongFromGenre(idGenre);
      return XResult.success(data);
    } catch (e) {
      return XResult.error(e.toString());
    }
  }
}
