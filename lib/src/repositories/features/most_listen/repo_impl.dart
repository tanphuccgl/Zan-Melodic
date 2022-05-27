import 'package:zanmelodic/src/models/presf.dart';
import 'package:zanmelodic/src/models/result.dart';
import 'package:zanmelodic/src/repositories/features/most_listen/repo.dart';

class MostListenRepositoryImpl implements MostListenRepository {
  @override
  Future<XResult<List<String>>> getListOfSongs() async {
    try {
      var data = Prefs.loadMedia();
      return XResult.success(data);
    } catch (e) {
      return XResult.error(e.toString());
    }
  }
}
