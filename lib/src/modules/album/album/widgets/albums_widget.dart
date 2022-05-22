import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/widgets/card/album_card.dart';
import 'package:zanmelodic/src/widgets/state/state_empty_widget.dart';

class AlbumsWidget extends StatelessWidget {
  final List<AlbumModel> albums;
  const AlbumsWidget({Key? key, required this.albums}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return albums.isNotEmpty
        ? SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => AlbumCard(album: albums[index]),
                childCount: albums.length),
          )
        : const XStateEmptyWidget();
  }
}
