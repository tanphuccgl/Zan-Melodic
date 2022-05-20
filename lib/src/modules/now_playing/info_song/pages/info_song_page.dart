import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/routes/coordinator.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/constants/my_padding.dart';
import 'package:zanmelodic/src/modules/audio_control/widgets/next_button.dart';
import 'package:zanmelodic/src/modules/audio_control/widgets/play_button.dart';
import 'package:zanmelodic/src/modules/audio_control/widgets/previous_button.dart';
import 'package:zanmelodic/src/modules/audio_control/widgets/repeat_button.dart';
import 'package:zanmelodic/src/modules/audio_control/widgets/shuffle_button.dart';
import 'package:zanmelodic/src/modules/now_playing/info_song/widgets/frames_info.dart';
import 'package:zanmelodic/src/modules/now_playing/info_song/widgets/playlist_for_song.dart';
import 'package:zanmelodic/src/modules/now_playing/widgets/custom_process_bar.dart';

class InfoSongPage extends StatelessWidget {
  const InfoSongPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          color: MyColors.colorPrimary,
          backgroundColor: MyColors.colorWhite,
          onRefresh: () async => {},
          child: GestureDetector(
            onDoubleTap: () => XCoordinator.pop(context),
            child: Stack(
              children: [
                const Padding(
                  padding: MyProperties.pPage,
                  child: CustomScrollView(
                    physics: BouncingScrollPhysics(),
                    slivers: [
                      FramesInfoWidget(),
                      PlaylistForSong(),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: ShaderMask(
                    shaderCallback: (Rect rect) {
                      return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          MyColors.colorBlack,
                          Colors.transparent,
                          Colors.transparent,
                          MyColors.colorBlack
                        ],
                        stops: [
                          0.0,
                          0.1,
                          1,
                          1.0
                        ], // 10% purple, 80% transparent, 10% purple
                      ).createShader(rect);
                    },
                    blendMode: BlendMode.dstOut,
                    child: Container(
                      color: MyColors.colorBlack,
                      height: 220,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.fromLTRB(40, 0, 40, 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
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
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
