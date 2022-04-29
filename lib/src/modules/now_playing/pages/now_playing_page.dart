import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/config/routes/coordinator.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/modules/now_playing/widgets/custom_process_bar.dart';
import 'package:zanmelodic/src/modules/play_music/logic/play_music_bloc.dart';
import 'package:zanmelodic/src/utils/enums/loop_mode.dart';

class NowPlayingPage extends StatelessWidget {
  const NowPlayingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pTop = MediaQuery.of(context).padding.top;
    const _pHori = 40.0;
    return BlocBuilder<PlayMusicBloc, PlayMusicState>(
        builder: (context, state) {
      final _tracks = state.tracks;

      return Scaffold(
        backgroundColor: MyColors.colorBackground,
        body: GestureDetector(
          onVerticalDragEnd: (details) => XCoordinator.pop(context),
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
                    child: Container(
                      height: 220,
                      width: 220,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(10, 20),
                              color: MyColors.colorShadowImageNowPlaying
                                  .withOpacity(0.25),
                            )
                          ]),
                      child: QueryArtworkWidget(
                        artworkBorder: BorderRadius.circular(20.0),
                        id: _tracks.id,
                        type: ArtworkType.AUDIO,
                        keepOldArtwork: true,
                        nullArtworkWidget: const Icon(
                          Icons.image_not_supported,
                          size: 240,
                          color: MyColors.colorWhite,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${_tracks.title}\n',
                        style: Style.textTheme().displayLarge,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(_tracks.artist ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Style.textTheme().titleMedium!.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: MyColors.colorGray))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: IconButton(
                            onPressed: () => context
                                .read<PlayMusicBloc>()
                                .setShuffleModeEnabled(
                                    state.isEnableShuffle ? false : true),
                            icon: Icon(
                              state.shuffleIcon,
                              size: 20,
                              color: MyColors.colorWhite,
                            )),
                      ),
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: IconButton(
                            onPressed: () =>
                                context.read<PlayMusicBloc>().setLoopMode(),
                            icon: Icon(
                              state.loopMode.iconOf(),
                              size: 20,
                              color: MyColors.colorWhite,
                            )),
                      )
                    ],
                  ),
                  const CutomProcessBar(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: IconButton(
                            onPressed: () => context
                                .read<PlayMusicBloc>()
                                .onSkipToPrevious(),
                            icon: const Icon(
                              Icons.skip_previous,
                              color: MyColors.colorWhite,
                              size: 40,
                            )),
                      ),
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: IconButton(
                            onPressed: () {
                              if (state.isEndSong) {
                                context.read<PlayMusicBloc>().onPlay(_tracks);
                              }
                              state.isPlaying
                                  ? context.read<PlayMusicBloc>().onPause()
                                  : context
                                      .read<PlayMusicBloc>()
                                      .onPlay(_tracks);
                            },
                            icon: Icon(
                              state.playIcon,
                              color: MyColors.colorWhite,
                              size: 40,
                            )),
                      ),
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: IconButton(
                            onPressed: () =>
                                context.read<PlayMusicBloc>().onSkipToNext(),
                            icon: const Icon(
                              Icons.skip_next,
                              color: MyColors.colorWhite,
                              size: 40,
                            )),
                      )
                    ],
                  )
                ],
              )),
        ),
      );
    });
  }
}
