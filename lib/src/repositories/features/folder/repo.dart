import 'package:zanmelodic/src/models/result.dart';

abstract class FolderRepository {
  Future<XResult<List<String>>> getListFolder();
}
