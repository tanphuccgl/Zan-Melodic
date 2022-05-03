import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/repositories/audio_query/base_audio_query.dart';

class SongAudioQuery extends BaseAudioQuery {
  Future<List<SongModel>> getSongFromLocal() async {
    final _list = await getAudiofromLocal();
    final value = _list
        .where((e) =>
            e.isMusic == true &&
            e.data.contains('/storage/emulated/0/Call/') == false)
        .toList();
    return value;
  }
}
