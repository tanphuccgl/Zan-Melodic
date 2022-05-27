import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/modules/upper_control/logic/upper_control_bloc.dart';
import 'package:zanmelodic/src/repositories/domain.dart';
import 'package:zanmelodic/src/widgets/loading/bot_toast.dart';

part 'genre_state.dart';

class GenreBloc extends UpperControlBloc<GenreState> {
  final Domain _domain = Domain();

  GenreBloc() : super(_initialValue) {
    fetchListOfGenre();
  }

  static final GenreState _initialValue = GenreState(items: XHandle.loading());

  Future<void> fetchListOfGenre() async {
    final value = await _domain.genre.getListOfGenre();
    if (value.isSuccess) {
      emit(state.copyWithItems(items: XHandle.completed(value.data ?? [])));
    } else {
      XSnackbar.show(msg: 'Load All List Error');
    }
  }
}
