import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/modules/album/album_detail/logic/album_detail_bloc.dart';
import 'package:zanmelodic/src/utils/utils.dart';
import 'package:zanmelodic/src/widgets/image_widget/custom_image.dart';
import 'package:zanmelodic/src/widgets/text/custom_text.dart';

class AlbumCard extends StatelessWidget {
  final AlbumModel album;
  const AlbumCard({Key? key, required this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String _numberSong = XUtils.formatNumberSong(album.numOfSongs);

    return GestureDetector(
      onTap: () => context.read<AlbumDetailBloc>().fetchListOfSongsFromAlbum(
            context,
            album: album,
          ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 9),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomImage(
                id: album.id,
                height: 120,
                width: 120,
                artworkType: ArtworkType.ALBUM),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  XText(
                    title: album.album,
                    style: Style.textTheme().titleMedium,
                  ),
                  XText(
                    title: album.artist ?? '',
                  ),
                  XText(title: _numberSong),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
