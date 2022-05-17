import 'package:flutter_bloc/flutter_bloc.dart';

part 'progress_bar_state.dart';

class ProgressBarBloc extends Cubit<ProgressBarState> {
  ProgressBarBloc() : super(_initialValue);
  static const _initialValue = ProgressBarState(
    current: Duration.zero,
    buffered: Duration.zero,
    total: Duration.zero,
  );
}
