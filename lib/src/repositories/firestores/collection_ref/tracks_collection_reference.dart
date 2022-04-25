import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zanmelodic/src/models/result.dart';
import 'package:zanmelodic/src/models/tracks_model.dart';
import 'package:zanmelodic/src/repositories/firestores/collection_ref/base_collection_reference.dart';

class TracksCollectionReference extends BaseCollectionReference<XTracks> {
  TracksCollectionReference()
      : super(FirebaseFirestore.instance
            .collection('Tracks')
            .withConverter<XTracks>(
              fromFirestore: (snapshot, _) => XTracks.formDocument(snapshot),
              toFirestore: (tracksModel, _) => tracksModel.toJson(),
            ));

  Future<XResult<List<XTracks>>> getAllTracks() async {
    try {
      return query();
    } catch (e) {
      return XResult.exception(e);
    }
  }
}
