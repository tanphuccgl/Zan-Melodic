import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/models/audio_model.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/repositories/domain.dart';
import 'package:zanmelodic/src/widgets/loading/bot_toast.dart';

part 'discover_state.dart';

class DiscoverBloc extends Cubit<DiscoverState> {
  DiscoverBloc() : super(DiscoverState(items: XHandle.loading())) {
    getAllTracks();
  }

  final Domain _domain = Domain();

  Future<void> getAllTracks() async {
    final value = await _domain.audio.getAllAudios();
    if (value.isSuccess) {
      emit(state.copyWith(items: XHandle.completed(value.data ?? [])));
      XSnackbar.show(msg: 'Load Success');
    } else {
      XSnackbar.show(msg: 'Load Error');
    }
  }
}
