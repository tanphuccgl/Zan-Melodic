import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/modules/upper_control/logic/upper_control_bloc.dart';
import 'package:zanmelodic/src/repositories/domain.dart';
import 'package:zanmelodic/src/widgets/loading/bot_toast.dart';

part 'artist_state.dart';

class ArtistBloc extends UpperControlBloc<ArtistState> {
  ArtistBloc() : super(_initialValue) {
    fetchListOfArtist();
  }
  static final ArtistState _initialValue =
      ArtistState(items: XHandle.loading());

  final Domain _domain = Domain();
  Future<void> fetchListOfArtist() async {
    final value = await _domain.artist.getListOfArtist();
    if (value.isSuccess) {
      emit(state.copyWith(items: XHandle.completed(value.data ?? [])));
    } else {
      XSnackbar.show(msg: 'Load All List Error');
    }
  }
}
