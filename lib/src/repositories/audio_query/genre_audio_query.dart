import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/repositories/audio_query/base_audio_query.dart';

class GenreAudioQuery extends BaseAudioQuery {
  Future<List<GenreModel>> getGenreFromLocal() async {
    List<GenreModel> _listGenre = await audioQuery.queryGenres();
    return _listGenre;
  }

  Future<List<SongModel>> getSongFromGenre(int idGenre) async {
    List<SongModel> _list = await audioQuery.queryAudiosFrom(
      AudiosFromType.GENRE_ID,
      idGenre,
    );
    return _list;
  }
}
