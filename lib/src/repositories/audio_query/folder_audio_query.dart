import 'package:zanmelodic/src/models/folder_model.dart';
import 'package:zanmelodic/src/repositories/audio_query/base_audio_query.dart';

class FolderAudioQuery extends BaseAudioQuery {
  Future<List<XFolder>> getFolderFromLocal() async {
    final _listAudio = await getAudiofromLocal();
    final List<XFolder> _listFolder = [];
    final _listSong = _listAudio
        .where((e) =>
            e.isMusic == true &&
            e.data.contains('/storage/emulated/0/Call/') == false)
        .toList();
    for (int i = 0; i < _listSong.length; i++) {
      final _dir = _listSong[i].data.replaceAll(_listSong[i].displayName, '');

      final _cutLastCharacter = _dir.substring(0, _dir.length - 1);

      _listFolder.add(XFolder(name: _cutLastCharacter));
    }
    final ids = _listFolder.map((e) => e.name).toSet();
    _listFolder.retainWhere((x) => ids.remove(x.name));
    return _listFolder.toList();
  }
}
