import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/modules/genre/genre_detail/logic/genre_detail_bloc.dart';
import 'package:zanmelodic/src/utils/utils.dart';
import 'package:zanmelodic/src/widgets/image_widget/custom_image.dart';
import 'package:zanmelodic/src/widgets/text/custom_text.dart';

class GenreCard extends StatelessWidget {
  final GenreModel genre;
  const GenreCard({Key? key, required this.genre}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<GenreDetailBloc>().fetchListOfSongsFromGenre(
            context,
            genre: genre,
          ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 9),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomImage(
                id: genre.id,
                height: 120,
                width: 120,
                artworkType: ArtworkType.GENRE),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  XText(
                    title: genre.genre,
                    style: Style.textTheme().titleMedium,
                  ),
                  XText(
                    title: XUtils.formatNumberSong(genre.numOfSongs),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
