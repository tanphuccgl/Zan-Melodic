import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/repositories/domain.dart';
import 'package:zanmelodic/src/widgets/loading/bot_toast.dart';

part 'type_song_state.dart';

class TypeSongBloc extends Cubit<TypeSongState> {
  TypeSongBloc() : super(_initialValue) {
    getNewSongs();
  }
  static final TypeSongState _initialValue = TypeSongState(
      newList: XHandle.loading(), mostListenList: XHandle.loading());

  final Domain _domain = Domain();

  Future<void> getNewSongs() async {
    final _value = await _domain.song.getListOfSongs();
    if (_value.isSuccess) {
      final _items = _value.data ?? [];

      final _result = _items.where((e) {
        var date = DateTime.fromMillisecondsSinceEpoch(e.dateAdded! * 1000);
        var now = DateTime.now();
        var newDate = DateTime(now.year, now.month, date.day - 1);

        return date.compareTo(newDate) > 0;
      }).toList();
      emit(state.copyWith(newList: XHandle.completed(_result)));
    } else {
      XSnackbar.show(msg: 'Load All List Error');
    }
  }
}
