import 'package:zanmelodic/src/models/result.dart';

abstract class FolderRepository {
  Future<XResult<Set<String>>> getListFolder();
}
