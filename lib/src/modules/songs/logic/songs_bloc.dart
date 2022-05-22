import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/modules/upper_control/logic/upper_control_bloc.dart';
import 'package:zanmelodic/src/repositories/domain.dart';
import 'package:zanmelodic/src/widgets/loading/bot_toast.dart';

part 'songs_state.dart';

class SongsBloc extends UpperControlBloc<SongsState> {
  static final SongsState _initialValue = SongsState(items: XHandle.loading());
  final Domain _domain = Domain();
  SongsBloc() : super(_initialValue) {
    fetchListOfSongs();
  }

  Future<void> fetchListOfSongs() async {
    final _value = await _domain.song.getListOfSongs();
    if (_value.isSuccess) {
      emit(state.copyWithItems(
        items: XHandle.completed(_value.data ?? []),
      ));
    } else {
      XSnackbar.show(msg: 'Load All List Error');
    }
  }
}
