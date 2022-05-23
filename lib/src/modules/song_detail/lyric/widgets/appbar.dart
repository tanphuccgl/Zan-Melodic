import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/modules/audio_control/logic/audio_handle_bloc.dart';
import 'package:zanmelodic/src/widgets/text/custom_text.dart';

class AppBarLyric extends StatelessWidget {
  const AppBarLyric({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioHandleBloc, AudioHandleState>(
      builder: (context, state) {
        final media = state.currentSong;
        return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              XText(
                title: '${media.title}\n',
                style: Style.textTheme().displayLarge,
              ),
              XText(
                  title: media.artist ?? '',
                  style: Style.textTheme().titleMedium!.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: MyColors.colorGray))
            ]);
      },
    );
  }
}
