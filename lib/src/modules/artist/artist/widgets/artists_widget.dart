import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/widgets/card/artist_card.dart';
import 'package:zanmelodic/src/widgets/state/state_empty_widget.dart';

class ArtistsWidget extends StatelessWidget {
  final List<ArtistModel> artist;
  const ArtistsWidget({Key? key, required this.artist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return artist.isNotEmpty
        ? SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => ArtistCard(artist: artist[index]),
                childCount: artist.length),
          )
        : const XStateEmptyWidget();
  }
}
