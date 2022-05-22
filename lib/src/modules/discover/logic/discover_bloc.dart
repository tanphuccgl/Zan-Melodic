import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/models/audio_model.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/repositories/domain.dart';
import 'package:zanmelodic/src/widgets/loading/bot_toast.dart';

part 'discover_state.dart';

class DiscoverBloc extends Cubit<DiscoverState> {
  final Domain _domain = Domain();

  DiscoverBloc() : super(_initialValue) {
    getAllTracks();
  }
  static final DiscoverState _initialValue =
      DiscoverState(items: XHandle.loading());

  Future<void> getAllTracks() async {
    final value = await _domain.audio.getAllAudios();
    if (value.isSuccess) {
      emit(state.copyWithItems(items: XHandle.completed(value.data ?? [])));
    } else {
      XSnackbar.show(msg: 'Load Error');
    }
  }
}
