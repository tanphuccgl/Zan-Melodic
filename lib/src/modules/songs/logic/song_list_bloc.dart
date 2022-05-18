import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/modules/upper_control/logic/upper_control_bloc.dart';
import 'package:zanmelodic/src/repositories/domain.dart';
import 'package:zanmelodic/src/widgets/loading/bot_toast.dart';

part 'song_list_state.dart';

class SongListBloc extends UpperControlBloc<SongListState> {
  SongListBloc() : super(SongListState(songs: XHandle.loading())) {
    fetchListOfSongs();
  }
  final Domain _domain = Domain();

  @override
  Future<void> fetchListOfSongs() async {
    await Future.delayed(const Duration(seconds: 2));

    final _value = await _domain.song.getListOfSongs();
    if (_value.isSuccess) {
      emit(state.copyWithItems(
        songs: XHandle.completed(_value.data ?? []),
      ));
    } else {
      XSnackbar.show(msg: 'Load All List Error');
    }
  }
}
