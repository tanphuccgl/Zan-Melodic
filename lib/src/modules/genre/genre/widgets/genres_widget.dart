import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/widgets/card/genre_card.dart';
import 'package:zanmelodic/src/widgets/state/state_empty_widget.dart';

class GenresWidget extends StatelessWidget {
  final List<GenreModel> genre;
  const GenresWidget({Key? key, required this.genre}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return genre.isNotEmpty
        ? SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => GenreCard(genre: genre[index]),
                childCount: genre.length),
          )
        : const XStateEmptyWidget();
  }
}
