import 'package:flutter/material.dart';
import 'package:zanmelodic/src/models/audio_model.dart';
import 'package:zanmelodic/src/widgets/card/discover/playlist_card.dart';
import 'package:zanmelodic/src/widgets/state/state_empty_widget.dart';

class PlaylistDiscoverWidget extends StatelessWidget {
  const PlaylistDiscoverWidget({Key? key, required this.audios})
      : super(key: key);
  final List<XAudio> audios;

  @override
  Widget build(BuildContext context) {
    return audios.isNotEmpty
        ? SliverToBoxAdapter(
            child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SizedBox(
              height: 110,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) =>
                    PlaylistCard(audio: audios[index])),
                itemCount: audios.length,
                physics: const BouncingScrollPhysics(),
              ),
            ),
          ))
        : const XStateEmptyWidget();
  }
}
