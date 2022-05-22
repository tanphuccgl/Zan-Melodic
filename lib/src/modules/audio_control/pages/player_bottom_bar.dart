import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/constants/my_properties.dart';
import 'package:zanmelodic/src/modules/audio_control/logic/audio_handle_bloc.dart';
import 'package:zanmelodic/src/modules/dashboard/router/dashboard_router.dart';
import 'package:zanmelodic/src/widgets/button/next_button.dart';
import 'package:zanmelodic/src/widgets/button/play_button.dart';
import 'package:zanmelodic/src/widgets/button/previous_button.dart';
import 'package:zanmelodic/src/widgets/image_widget/custom_image_widget.dart';
import 'package:zanmelodic/src/widgets/text/custom_text.dart';

class PlayerBottomBar extends StatelessWidget {
  const PlayerBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioHandleBloc, AudioHandleState>(
        builder: (context, state) {
      final media = state.currentSong;
      const pVertical = 15.0;
      const _sizeButton = 35.0;
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
                  borderRadius: MyProperties.borderRadius,
                  border: Border.all(width: 1.0, color: MyColors.colorPrimary),
                  color: MyColors.colorBlack,
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      media.extras!['isFirebase'] == false
                          ? CustomImageWidget(
                              id: int.parse(media.id),
                              height: 51.0,
                              width: 51.0,
                            )
                          : ClipRRect(
                              borderRadius: MyProperties.borderRadius,
                              clipBehavior: Clip.antiAlias,
                              child: Image.network(
                                media.extras!['image'],
                                gaplessPlayback: false,
                                repeat: ImageRepeat.noRepeat,
                                scale: 1.0,
                                height: 51.0,
                                width: 51.0,
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.low,
                              ),
                            ),
                      const SizedBox(
                        width: 11,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            XText(
                              title: '${media.title}\n',
                              style: Style.textTheme()
                                  .titleMedium!
                                  .copyWith(fontSize: 15, height: 1.25),
                            ),
                            XText(
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
                          PreviousButton(size: _sizeButton),
                          PlayButton(size: _sizeButton),
                          NextButton(
                            size: _sizeButton,
                          )
                        ],
                      )
                    ]),
              ),
            );
    });
  }
}
