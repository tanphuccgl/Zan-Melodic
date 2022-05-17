import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/constants/my_icons.dart';
import 'package:zanmelodic/src/models/enums/button_state.dart';
import 'package:zanmelodic/src/modules/audio_control/logic/audio_handle_bloc.dart';
import 'package:zanmelodic/src/widgets/button/image_button.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({Key? key, this.size = 40}) : super(key: key);
  final double size;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioHandleBloc, AudioHandleState>(
        builder: (context, state) {
      switch (state.playButton) {
        case ButtonState.loading:
          return Container(
            margin: const EdgeInsets.all(8.0),
            width: size,
            height: size,
            child: const CircularProgressIndicator(),
          );
        case ButtonState.paused:
          return ImageButton(
              size: size,
              onPressed: () => context.read<AudioHandleBloc>().play(),
              icon: MyIcons.playCircledIcon);
        case ButtonState.playing:
          return ImageButton(
              size: size,
              onPressed: () => context.read<AudioHandleBloc>().pause(),
              icon: MyIcons.pauseCircledIcon);
        default:
          return const CircularProgressIndicator();
      }
    });
  }
}
