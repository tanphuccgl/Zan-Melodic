import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/modules/audio_control/logic/audio_handle_bloc.dart';
import 'package:zanmelodic/src/modules/audio_control/widgets/next_button.dart';
import 'package:zanmelodic/src/modules/audio_control/widgets/play_button.dart';
import 'package:zanmelodic/src/modules/audio_control/widgets/previous_button.dart';
import 'package:zanmelodic/src/modules/dashboard/router/dashboard_router.dart';
import 'package:zanmelodic/src/widgets/custom_text/custom_text.dart';
import 'package:zanmelodic/src/widgets/image_widget/custom_image_widget.dart';

class PlayerBottomBar extends StatelessWidget {
  const PlayerBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioHandleBloc, AudioHandleState>(
        builder: (context, state) {
      final media = state.currentSong;
      const pVertical = 15.0;
      return state.isShowBottomBar == false
          ? const SizedBox.shrink()
          : GestureDetector(
              onTap: () => DashboardCoordinator.showNowPlayingScreen(context),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.fromLTRB(7, pVertical, 12, pVertical),
                height: 81,
                width: 378,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(width: 1.0, color: MyColors.colorPrimary),
                  color: MyColors.colorBlack,
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomImageWidget(
                        id: int.parse(media.id),
                        height: 51.0,
                        width: 51.0,
                      ),
                      const SizedBox(
                        width: 11,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CusText(
                              title: '${media.title}\n',
                              style: Style.textTheme()
                                  .titleMedium!
                                  .copyWith(fontSize: 15, height: 1.25),
                            ),
                            CusText(
                                title: media.artist ?? '',
                                style: Style.textTheme().titleMedium!.copyWith(
                                    fontSize: 12,
                                    height: 1.2,
                                    color: MyColors.colorGray))
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          PreviousButton(size: 35),
                          PlayButton(size: 35),
                          NextButton(
                            size: 35,
                          )
                        ],
                      )
                    ]),
              ),
            );
    });
  }
}
