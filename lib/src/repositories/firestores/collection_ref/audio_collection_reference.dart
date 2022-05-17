import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zanmelodic/src/models/audio_model.dart';
import 'package:zanmelodic/src/models/result.dart';
import 'package:zanmelodic/src/repositories/firestores/collection_ref/base_collection_reference.dart';

class AudioCollectionReference extends BaseCollectionReference<XAudio> {
  AudioCollectionReference()
      : super(FirebaseFirestore.instance
            .collection('Tracks')
            .withConverter<XAudio>(
              fromFirestore: (snapshot, _) => XAudio.formDocument(snapshot),
              toFirestore: (tracksModel, _) => tracksModel.toJson(),
            ));

  Future<XResult<List<XAudio>>> getAllAudios() async {
    try {
      return query();
    } catch (e) {
      return XResult.exception(e);
    }
  }
}
