import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/models/result.dart';

abstract class GenreRepository {
  Future<XResult<List<GenreModel>>> getListOfGenre();
  Future<XResult<List<SongModel>>> getListOfSongFromGenre(int idGenre);
}
