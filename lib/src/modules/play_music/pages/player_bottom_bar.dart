import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/modules/dashboard/router/dashboard_router.dart';
import 'package:zanmelodic/src/modules/play_music/logic/play_music_bloc.dart';
import 'package:zanmelodic/src/widgets/image_widget/image_song.dart';

class PlayerBottomBar extends StatelessWidget {
  const PlayerBottomBar({Key? key, required this.song}) : super(key: key);
  final SongModel song;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => DashboardCoordinator.showNowPlayingScreen(context),
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 10, 16),
        padding: const EdgeInsets.fromLTRB(7, 15, 12, 15),
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
            ImageSongWidget(
              id: song.id,
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
                  Text(
                    '${song.title}\n',
                    style: Style.textTheme()
                        .titleMedium!
                        .copyWith(fontSize: 15, height: 1.25),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(song.artist ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Style.textTheme().titleMedium!.copyWith(
                          fontSize: 12, height: 1.2, color: MyColors.colorGray))
                ],
              ),
            ),
            _controlPlayer()
          ],
        ),
      ),
    );
  }

  Widget _controlPlayer() {
    return BlocBuilder<PlayMusicBloc, PlayMusicState>(
      builder: (context, state) {
        return Row(
          children: [
            SizedBox(
              width: 30,
              child: IconButton(
                  onPressed: () =>
                      context.read<PlayMusicBloc>().onSkipToPrevious(),
                  icon: const Icon(
                    Icons.skip_previous,
                    color: MyColors.colorWhite,
                  )),
            ),
            SizedBox(
              width: 30,
              child: IconButton(
                  onPressed: () => state.isPlaying
                      ? context.read<PlayMusicBloc>().onPause()
                      : context.read<PlayMusicBloc>().onButtonPlayer(song),
                  icon: Icon(
                    state.playIcon,
                    color: MyColors.colorWhite,
                  )),
            ),
            SizedBox(
              width: 30,
              child: IconButton(
                  onPressed: () => context.read<PlayMusicBloc>().onSkipToNext(),
                  icon: const Icon(
                    Icons.skip_next,
                    color: MyColors.colorWhite,
                  )),
            )
          ],
        );
      },
    );
  }
}
