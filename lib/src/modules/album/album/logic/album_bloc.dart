import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/modules/upper_control/logic/upper_control_bloc.dart';
import 'package:zanmelodic/src/repositories/domain.dart';
import 'package:zanmelodic/src/widgets/loading/bot_toast.dart';

part 'album_state.dart';

class AlbumBloc extends UpperControlBloc<AlbumState> {
  final Domain _domain = Domain();

  AlbumBloc() : super(AlbumState(items: XHandle.loading())) {
    fetchListOfAlbums();
  }

  Future<void> fetchListOfAlbums() async {
    final value = await _domain.album.getListOfAlbums();
    if (value.isSuccess) {
      emit(state.copyWithItems(items: XHandle.completed(value.data ?? [])));
    } else {
      XSnackbar.show(msg: 'Load All List Error');
    }
  }
}
