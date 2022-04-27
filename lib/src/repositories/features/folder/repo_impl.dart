import 'package:zanmelodic/src/models/result.dart';
import 'package:zanmelodic/src/models/folder_model.dart';
import 'package:zanmelodic/src/repositories/features/folder/repo.dart';
import 'package:zanmelodic/src/repositories/prefs.dart';

class FolderRepositoryImpl implements FolderRepository {
  @override
  Future<XResult<List<XFolder>>> fetchListFolder() async {
    try {
      final data = Prefs.getListFolderToLocal();
      return  XResult.success(data);
    } catch (e) {
      return XResult.error(e.toString());
    }
  }

  @override
  Future<void> saveFolder(List<XFolder> listFolder) async {
    Prefs.saveListFolderToLocal(listFolder);
  }
}
