import 'package:zanmelodic/src/models/result.dart';
import 'package:zanmelodic/src/models/tracks_model.dart';
import 'package:zanmelodic/src/repositories/features/tracks/repo.dart';
import 'package:zanmelodic/src/repositories/firestores/collection_ref/tracks_collection_reference.dart';

class TracksRepositoryImpl implements TracksRepository {
  @override
  Future<XResult<List<XTracks>>> getAllTracks() async {
    try {
      var data = await TracksCollectionReference().getAllTracks();
      return data;
    } catch (e) {
      return XResult.error(e.toString());
    }
  }
}
