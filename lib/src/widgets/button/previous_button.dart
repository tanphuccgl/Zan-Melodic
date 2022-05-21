import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/constants/my_icons.dart';
import 'package:zanmelodic/src/modules/audio_control/logic/audio_handle_bloc.dart';
import 'package:zanmelodic/src/widgets/button/image_button.dart';

class PreviousButton extends StatelessWidget {
  const PreviousButton({Key? key, this.size = 40}) : super(key: key);
  final double size;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioHandleBloc, AudioHandleState>(
        builder: (context, state) {
      return ImageButton(
        size: size,
        onPressed: () => state.isFirstSong
            ? null
            : context.read<AudioHandleBloc>().previous(),
        icon: MyIcons.skipIcon,
      );
    });
  }
}
