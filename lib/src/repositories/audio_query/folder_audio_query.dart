import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/models/folder_model.dart';
import 'package:zanmelodic/src/repositories/audio_query/base_audio_query.dart';
import 'package:zanmelodic/src/repositories/audio_query/song_audio_query.dart';
import 'package:zanmelodic/src/utils/utils.dart';

class FolderAudioQuery extends BaseAudioQuery {
  Future<List<XFolder>> getFolderFromLocal() async {
    final _songs = await SongAudioQuery().getSongFromLocal();
    List<XFolder> _folders = [];

    for (int i = 0; i < _songs.length; i++) {
      final _cutLastCharacter = XUtils.getPathFolder(_songs[i]);

      _folders.add(XFolder(name: _cutLastCharacter, songs: [], date: ''));
    }
    // remove duplicate folder
    final ids = _folders.map((e) => e.name).toSet();
    _folders.retainWhere((x) => ids.remove(x.name));

    // add songs to folder
    _addSongToFolder(folders: _folders, songs: _songs);

    List<XFolder> _result = [];

    _folders.map((e) {
      e.songs.sort(
          (a, b) => (b.dateModified ?? -1).compareTo((a.dateModified ?? -1)));
      _result.add(XFolder(
          name: e.name,
          songs: e.songs,
          date: XUtils.dateTimeFolder(e.songs.first.dateModified ?? -1)));
    }).toList();

    return _result.toList();
  }

  void _addSongToFolder(
      {required List<XFolder> folders, required List<SongModel> songs}) {
    for (var item in folders) {
      for (SongModel item1 in songs) {
        final _pathFolder = XUtils.getPathFolder(item1);
        if (item.name.contains(_pathFolder)) {
          item.songs.add(item1);
        }
      }
    }
  }
}
