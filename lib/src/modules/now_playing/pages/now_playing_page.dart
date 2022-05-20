import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/config/routes/coordinator.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/constants/my_properties.dart';
import 'package:zanmelodic/src/modules/now_playing/widgets/custom_process_bar.dart';
import 'package:zanmelodic/src/modules/audio_control/logic/audio_handle_bloc.dart';
import 'package:zanmelodic/src/modules/audio_control/widgets/next_button.dart';
import 'package:zanmelodic/src/modules/audio_control/widgets/play_button.dart';
import 'package:zanmelodic/src/modules/audio_control/widgets/previous_button.dart';
import 'package:zanmelodic/src/modules/audio_control/widgets/repeat_button.dart';
import 'package:zanmelodic/src/modules/audio_control/widgets/shuffle_button.dart';
import 'package:zanmelodic/src/widgets/custom_text/custom_text.dart';
import 'package:zanmelodic/src/widgets/image_widget/custom_image_widget.dart';

class NowPlayingPage extends StatelessWidget {
  const NowPlayingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pTop = MediaQuery.of(context).padding.top;
    const _pHori = 40.0;

    return BlocBuilder<AudioHandleBloc, AudioHandleState>(
      builder: (context, state) {
        final media = state.currentSong;
        final int id = int.parse(media.id);
        return Scaffold(
          backgroundColor: MyColors.colorBackground,
          body: GestureDetector(
            onDoubleTap: () => XCoordinator.pop(context),
            child: Padding(
                padding: EdgeInsets.fromLTRB(_pHori, _pTop, _pHori, _pHori / 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Now Playing',
                      style: Style.textTheme().displaySmall,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: media.extras!['isFirebase'] == false
                          ? CustomImageWidget(
                              id: id,
                              height: 220,
                              width: 220,
                              isShadow: true,
                            )
                          : Container(
                              height: 220.0,
                              width: 220.0,
                              decoration: BoxDecoration(
                                  borderRadius: MyProperties.borderRadius,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(10, 20),
                                      color: MyColors.colorShadowImageNowPlaying
                                          .withOpacity(0.25),
                                    )
                                  ]),
                              child: ClipRRect(
                                borderRadius: MyProperties.borderRadius,
                                clipBehavior: Clip.antiAlias,
                                child: Image.network(
                                  media.extras!['image'],
                                  gaplessPlayback: false,
                                  repeat: ImageRepeat.noRepeat,
                                  scale: 1.0,
                                  height: 220.0,
                                  width: 220.0,
                                  fit: BoxFit.cover,
                                  filterQuality: FilterQuality.low,
                                ),
                              ),
                            ),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CusText(
                            title: '${media.title}\n',
                            style: Style.textTheme().displayLarge,
                          ),
                          CusText(
                              title: media.artist ?? '',
                              style: Style.textTheme().titleMedium!.copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: MyColors.colorGray))
                        ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [ShuffleButton(), RepeatButton()],
                    ),
                    const CutomProcessBar(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        PreviousButton(),
                        PlayButton(),
                        NextButton()
                      ],
                    )
                  ],
                )),
          ),
        );
      },
    );
  }
}
