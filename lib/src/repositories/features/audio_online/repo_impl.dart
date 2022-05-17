import 'package:zanmelodic/src/models/audio_model.dart';
import 'package:zanmelodic/src/models/result.dart';
import 'package:zanmelodic/src/repositories/features/audio_online/repo.dart';
import 'package:zanmelodic/src/repositories/firestores/collection_ref/audio_collection_reference.dart';

class AudioRepositoryImpl implements AudioRepository {
  @override
  Future<XResult<List<XAudio>>> getAllAudios() async {
    try {
      var data = await AudioCollectionReference().getAllAudios();
      return data;
    } catch (e) {
      return XResult.error(e.toString());
    }
  }
}
