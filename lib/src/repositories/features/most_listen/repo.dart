import 'package:zanmelodic/src/models/result.dart';

abstract class MostListenRepository {
  Future<XResult<List<String>>> getListOfSongs();
}
