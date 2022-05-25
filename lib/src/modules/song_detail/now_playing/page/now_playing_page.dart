import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/config/routes/coordinator.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/modules/audio_control/logic/audio_handle_bloc.dart';
import 'package:zanmelodic/src/modules/song_detail/widgets/bottom_control.dart';
import 'package:zanmelodic/src/widgets/image_widget/custom_image.dart';
import 'package:zanmelodic/src/widgets/text/custom_text.dart';

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
                  children: [
                    Text(
                      'Now Playing',
                      style: Style.textTheme().displaySmall,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: CustomImage(
                          urlImage: media.extras!['image'],
                          id: id,
                          height: 220.0,
                          width: 220.0,
                          isShadow: true,
                        )),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
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
                        ]),
                    const BottomControl()
                  ],
                )),
          ),
        );
      },
    );
  }
}
