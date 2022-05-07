import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/modules/upper_control/logic/upper_control_bloc.dart';
import 'package:zanmelodic/src/repositories/domain.dart';
import 'package:zanmelodic/src/widgets/loading/bot_toast.dart';

part 'album_state.dart';

class AlbumBloc extends UpperControlBloc<AlbumState> {
  AlbumBloc() : super(AlbumState(items: XHandle.loading())) {
    fetchListOfAlbums();
  }

  final Domain _domain = Domain();

  Future<void> fetchListOfAlbums() async {
    await Future.delayed(const Duration(seconds: 2));
    final value = await _domain.album.getListOfAlbums();
    if (value.isSuccess) {
      emit(state.copyWith(items: XHandle.completed(value.data ?? [])));
    } else {
      XSnackbar.show(msg: 'Load All List Error');
    }
  }
}
