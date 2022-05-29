import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/repositories/domain.dart';
import 'package:zanmelodic/src/widgets/loading/bot_toast.dart';

part 'recently_state.dart';

class RecentlyBloc extends Cubit<RecentlyState> {
  RecentlyBloc() : super(_initialValue) {
    getNewSongs();
    getMostListenSongs();
  }
  static final RecentlyState _initialValue =
      RecentlyState(newSongs: XHandle.loading(), mostListen: XHandle.loading());

  final Domain _domain = Domain();

  Future<void> getNewSongs() async {
    final _value = await _domain.song.getListOfSongs();
    if (_value.isSuccess) {
      final _items = _value.data ?? [];

      final _result = _items.where((e) {
        var dateAdd = DateTime.fromMillisecondsSinceEpoch(e.dateAdded! * 1000);
        var now = DateTime.now();
        var newDate = DateTime(now.year, now.month, now.day - 1);

        return dateAdd.compareTo(newDate) >= 0;
      }).toList();
      emit(state.copyWith(newSongs: XHandle.completed(_result)));
    } else {
      XSnackbar.show(msg: 'Load All List Error');
    }
  }

  Future<void> getMostListenSongs() async {
    final _valueName = await _domain.mostListen.getListOfSongs();
    final _valueSongs = await _domain.song.getListOfSongs();
    final List<SongModel> _result = [];

    if (_valueName.isSuccess) {
      for (SongModel item1 in (_valueSongs.data ?? [])) {
        for (String item in (_valueName.data ?? [])) {
          if (item == item1.title) {
            _result.add(item1);
          }
        }
      }
      Map<SongModel, int> numberOf = {
        for (var x in (_result).toSet())
          x: (_result).where((item) => item == x).length
      };
      var listSort = (_result)
        ..sort((a, b) => numberOf[b]!.compareTo(numberOf[a]!));
      var listSet = <SongModel>{};
      List<SongModel> uniquelist =
          listSort.where((country) => listSet.add(country)).toList();
      uniquelist =
          uniquelist.length < 3 ? uniquelist : uniquelist.take(3).toList();

      emit(state.copyWith(mostListen: XHandle.completed(uniquelist)));
    } else {
      XSnackbar.show(msg: 'Load All List Error');
    }
  }
}
