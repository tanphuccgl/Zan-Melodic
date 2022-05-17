import 'package:zanmelodic/src/models/audio_model.dart';
import 'package:zanmelodic/src/models/result.dart';

abstract class AudioRepository {
  Future<XResult<List<XAudio>>> getAllAudios();
}
