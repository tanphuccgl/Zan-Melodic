import 'package:flutter/material.dart';
import 'package:zanmelodic/src/models/audio_model.dart';
import 'package:zanmelodic/src/widgets/card/discover/singer_card.dart';
import 'package:zanmelodic/src/widgets/state/state_empty_widget.dart';

class SingerDiscoverWidget extends StatelessWidget {
  const SingerDiscoverWidget({Key? key, required this.audios})
      : super(key: key);
  final List<XAudio> audios;

  @override
  Widget build(BuildContext context) {
    return audios.isNotEmpty
        ? SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return SingerCard(audio: audios[index]);
              }, childCount: audios.length),
            ),
          )
        : const XStateEmptyWidget();
  }
}
