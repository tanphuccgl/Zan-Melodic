import 'package:zanmelodic/src/models/result.dart';
import 'package:zanmelodic/src/models/tracks_model.dart';

abstract class TracksRepository {
  Future<XResult<List<XTracks>>> getAllTracks();
}
