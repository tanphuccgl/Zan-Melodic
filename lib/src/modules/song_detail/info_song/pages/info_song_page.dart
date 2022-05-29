import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/routes/coordinator.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/constants/my_properties.dart';
import 'package:zanmelodic/src/modules/song_detail/info_song/widgets/frames_info.dart';
import 'package:zanmelodic/src/modules/song_detail/info_song/widgets/playlist_for_song.dart';
import 'package:zanmelodic/src/modules/song_detail/widgets/bottom_control.dart';
import 'package:zanmelodic/src/widgets/shader_mask/shader_mask.dart';

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
                  child: XShaderMask(
                    child: Container(
                      color: MyColors.colorBlack,
                      height: 220,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.fromLTRB(40, 0, 40, 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [BottomControl()],
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
