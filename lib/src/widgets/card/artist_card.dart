import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/modules/artist/artist_detail/logic/artist_detail_bloc.dart';
import 'package:zanmelodic/src/widgets/image_widget/custom_image.dart';
import 'package:zanmelodic/src/widgets/text/custom_text.dart';

class ArtistCard extends StatelessWidget {
  final ArtistModel artist;
  const ArtistCard({Key? key, required this.artist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<ArtistDetailBloc>().fetchListOfSongsFromArtist(
            context,
            artist: artist,
          ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 9),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomImage(
                id: artist.id,
                height: 120,
                width: 120,
                artworkType: ArtworkType.ARTIST),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  XText(
                    title: artist.artist,
                    style: Style.textTheme().titleMedium,
                  ),
                  XText(
                    title: artist.numberOfAlbums.toString(),
                  ),
                  XText(
                    title: artist.numberOfTracks.toString(),
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
