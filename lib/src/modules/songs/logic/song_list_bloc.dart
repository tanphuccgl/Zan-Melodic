import 'package:audio_service/audio_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/modules/audio_control/logic/audio_handle_bloc.dart';
import 'package:zanmelodic/src/modules/dashboard/pages/dashboard_page.dart';
import 'package:zanmelodic/src/modules/upper_control/logic/upper_control_bloc.dart';
import 'package:zanmelodic/src/repositories/domain.dart';
import 'package:zanmelodic/src/widgets/loading/bot_toast.dart';

part 'song_list_state.dart';

class SongListBloc extends UpperControlBloc<SongListState> {
  SongListBloc()
      : super(SongListState(songs: XHandle.loading(), mediaItems: const [])) {
    fetchListOfSongs();
  }
  final Domain _domain = Domain();

  @override
  Future<void> fetchListOfSongs() async {
    await Future.delayed(const Duration(seconds: 2));

    final _value = await _domain.song.getListOfSongs();
    if (_value.isSuccess) {
      var a = (_value.data ?? []).map((e) => converSongToModel(e)).toList();

      emit(state.copyWithItems(
          songs: XHandle.completed(_value.data ?? []), mediaItems: a));
    } else {
      XSnackbar.show(msg: 'Load All List Error');
    }
  }

  Future<void> fetchMediaItems(BuildContext context) async {
    final items =
        (state.songs.data ?? []).map((e) => converSongToModel(e)).toList();
    context.read<AudioHandleBloc>().loadPlaylist(items);

    emit(state.copyWithItems(mediaItems: items, isLoadPlaylist: true));
  }
}
