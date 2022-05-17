import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/constants/my_icons.dart';
import 'package:zanmelodic/src/modules/audio_control/logic/audio_handle_bloc.dart';
import 'package:zanmelodic/src/widgets/button/image_button.dart';

class SortButton extends StatelessWidget {
  const SortButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioHandleBloc, AudioHandleState>(
        builder: (context, state) {
      return ImageButton(
        size: 30,
        onPressed: () => context.read<AudioHandleBloc>().sort(),
        icon: MyIcons.sortIcon,
        color: state.isSortModeEnabled
            ? MyColors.colorPrimary
            : MyColors.colorWhite,
      );
    });
  }
}
