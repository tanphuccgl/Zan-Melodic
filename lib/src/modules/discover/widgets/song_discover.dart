import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/models/audio_model.dart';
import 'package:zanmelodic/src/modules/audio_control/logic/audio_handle_bloc.dart';
import 'package:zanmelodic/src/widgets/card/discover/song_online_card.dart';
import 'package:zanmelodic/src/widgets/state/state_empty_widget.dart';

class SongDiscoverWidget extends StatelessWidget {
  final List<XAudio> audios;
  const SongDiscoverWidget({Key? key, required this.audios}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return audios.isNotEmpty
        ? SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return SongOnlineCard(
                  onTap: () => context
                      .read<AudioHandleBloc>()
                      .playItem(index: index, audios: audios),
                  audio: audios[index],
                );
              }, childCount: audios.length),
            ),
          )
        : const XStateEmptyWidget();
  }
}
