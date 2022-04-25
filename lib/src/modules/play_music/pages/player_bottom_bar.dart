import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/models/tracks_model.dart';
import 'package:zanmelodic/src/modules/play_music/logic/play_music_bloc.dart';

class PlayerBottomBar extends StatelessWidget {
  const PlayerBottomBar({Key? key, required this.tracks}) : super(key: key);
  final XTracks tracks;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.network(
              tracks.image,
              height: 51.0,
              width: 51.0,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            width: 11,
          ),
          Expanded(
            child: RichText(
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                  text: '${tracks.name}\n',
                  style: Style.textTheme()
                      .titleMedium!
                      .copyWith(fontSize: 15, height: 1.25),
                  children: <TextSpan>[
                    TextSpan(
                        text: tracks.author,
                        style: Style.textTheme()
                            .titleMedium!
                            .copyWith(fontSize: 12, height: 1.2))
                  ]),
            ),
          ),
          _controlPlayer()
        ],
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
                  onPressed: () {},
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
                      : context.read<PlayMusicBloc>().onPlay(tracks),
                  icon: Icon(
                    state.playIcon,
                    color: MyColors.colorWhite,
                  )),
            ),
            SizedBox(
              width: 30,
              child: IconButton(
                  onPressed: () {},
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
