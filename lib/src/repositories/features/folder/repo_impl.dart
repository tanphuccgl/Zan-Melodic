import 'package:zanmelodic/src/models/result.dart';
import 'package:zanmelodic/src/repositories/audio_query/folder_audio_query.dart';
import 'package:zanmelodic/src/repositories/features/folder/repo.dart';

class FolderRepositoryImpl implements FolderRepository {
  @override
  Future<XResult<List<String>>> getListFolder() async {
    try {
      var data = await FolderAudioQuery().getFolderFromLocal();
      return XResult.success(data);
    } catch (e) {
      return XResult.error(e.toString());
    }
  }
}
