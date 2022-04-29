import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/modules/play_music/logic/play_music_bloc.dart';

class ControllBar extends StatelessWidget {
  const ControllBar({Key? key, required this.listTracks}) : super(key: key);
  final List<SongModel> listTracks;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayMusicBloc, PlayMusicState>(
      builder: (context, state) {
        return SliverToBoxAdapter(
          child: SizedBox(
            width: double.infinity,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      iconSize: 30,
                      icon: const Icon(
                        Icons.sort,
                        color: MyColors.colorWhite,
                      )),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () => context
                              .read<PlayMusicBloc>()
                              .setShuffleModeEnabled(
                                  state.isEnableShuffle ? false : true),
                          iconSize: 30,
                          icon: Icon(state.shuffleIcon,
                              color: MyColors.colorWhite)),
                      IconButton(
                          onPressed: () => context
                              .read<PlayMusicBloc>()
                              .onPlayFromTracks(listTracks: listTracks),
                          iconSize: 30,
                          icon: const Icon(Icons.play_arrow,
                              color: MyColors.colorWhite))
                    ],
                  )
                ]),
          ),
        );
      },
    );
  }
}
