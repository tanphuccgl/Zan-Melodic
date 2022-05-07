import 'package:zanmelodic/src/repositories/audio_query/base_audio_query.dart';

class FolderAudioQuery extends BaseAudioQuery {
  Future<List<String>> getFolderFromLocal() async {
    final _listAudio = await getAudiofromLocal();
    final _listFolder = <String>{};
    final _listSong = _listAudio
        .where((e) =>
            e.isMusic == true &&
            e.data.contains('/storage/emulated/0/Call/') == false)
        .toList();
    for (int i = 0; i < _listSong.length; i++) {
      final _dir = _listSong[i].data.replaceAll(_listSong[i].displayName, '');

      final _cutLastCharacter = _dir.substring(0, _dir.length - 1);

      _listFolder.add(_cutLastCharacter);
    }
    return _listFolder.toList();
  }
}
