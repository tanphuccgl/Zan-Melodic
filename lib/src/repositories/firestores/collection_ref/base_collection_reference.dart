import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zanmelodic/src/models/firebase_model.dart';
import 'package:zanmelodic/src/models/result.dart';

class BaseCollectionReference<T extends BaseModel> {
  BaseCollectionReference(this.ref);
  void log(dynamic value) => debugPrint('$value');
  final CollectionReference<T> ref;

  Future<XResult<T>> get(String id) async {
    try {
      final DocumentSnapshot<T> doc = await ref.doc(id).get();
      if (doc.exists) {
        return XResult.success(doc.data());
      } else {
        return XResult.error('Document does not exist');
      }
    } catch (e) {
      return XResult.exception(e);
    }
  }

  Stream<DocumentSnapshot<T>> snapshots(String id) {
    return ref.doc(id).snapshots();
  }

  Future<XResult<T>> add(T item) async {
    try {
      final DocumentReference<T> doc =
          await ref.add(item).timeout(const Duration(seconds: 5));
      item.id = doc.id;
      return XResult.success(item);
    } catch (e) {
      return XResult.exception(e);
    }
  }

  Future<XResult<T>> set(T item, {bool merge = true}) async {
    try {
      await ref
          .doc(item.id)
          .set(item, SetOptions(merge: merge))
          .timeout(const Duration(seconds: 5));
      return XResult.success(item);
    } catch (e) {
      return XResult.exception(e);
    }
  }

  Future<XResult<String>> remove(String id) async {
    try {
      await ref.doc(id).delete().timeout(const Duration(seconds: 5));

      return XResult.success(id);
    } catch (e) {
      return XResult.exception(e);
    }
  }

  Future<XResult<List<T>>> query() async {
    try {
      final QuerySnapshot<T> query =
          await ref.get().timeout(const Duration(seconds: 5));
      final docs = query.docs.map((e) => e.data()).toList();

      return XResult.success(docs);
    } catch (e) {
      return XResult.exception(e);
    }
  }

  Future<XResult<List<T>>> commit(List<T> items, {bool merge = true}) async {
    try {
      var batch = ref.firestore.batch();
      for (int i = 0; i < items.length; i++) {
        {
          batch.set(ref.doc(items[i].id), items[i], SetOptions(merge: merge));
        }
      }

      batch.commit().timeout(const Duration(seconds: 5));

      return XResult.success(items);
    } catch (e) {
      return XResult.exception(e);
    }
  }
}
