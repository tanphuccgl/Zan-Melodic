import 'package:flutter/material.dart';
import 'package:flutter_audio_waveforms/flutter_audio_waveforms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/modules/audio_control/logic/audio_handle_bloc.dart';

class WaveformWidget extends StatelessWidget {
  const WaveformWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioHandleBloc, AudioHandleState>(
      builder: (context, state) {
        return state.waveform.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : SquigglyWaveform(
                inactiveColor: MyColors.colorWhite,
                activeColor: MyColors.colorPrimary,
                strokeWidth: 1,
                maxDuration: state.progress.total,
                elapsedDuration: state.progress.current,
                samples: state.waveform,
                height: 60,
                width: 280,
              );
      },
    );
  }
}
