import 'package:on_audio_query/on_audio_query.dart';

class XAudioQuery {
  static late final OnAudioQuery audioQuery;
  static init() {
    audioQuery = OnAudioQuery();
    audioQuery.permissionsRequest();
  }

  static Future<List<SongModel>> getAudiofromLocal() async {
    List<SongModel> _listAudio = await audioQuery.querySongs();

    return _listAudio;
  }

  static Future<List<SongModel>> getSongFromLocal() async {
    final _list = await getAudiofromLocal();
    var value = _list
        .where((e) =>
            e.isMusic == true &&
            e.data.contains('/storage/emulated/0/Call/') == false)
        .toList();
    return value;
  }
}
