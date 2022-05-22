import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/modules/playlist/router/playlist_router.dart';
import 'package:zanmelodic/src/widgets/button/favorite_button.dart';
import 'package:zanmelodic/src/widgets/image_widget/custom_image.dart';
import 'package:zanmelodic/src/widgets/text/custom_text.dart';

class SongCard extends StatelessWidget {
  final SongModel song;
  final VoidCallback? onTap;
  final PlaylistModel? playlistModel;
  const SongCard({
    Key? key,
    required this.song,
    this.onTap,
    this.playlistModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: playlistModel != null
          ? () => PlaylistCoordinator.showDialogRemoveFromPlaylist(context,
              song: song, playlist: playlistModel!)
          : () =>
              PlaylistCoordinator.showDialogAddToPlaylist(context, song: song),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13),
        child: SizedBox(
          height: 70,
          width: 70,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 8,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 70,
                        child: CustomImage(
                          id: song.id,
                          height: 70.0,
                          width: 70.0,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            XText(
                              title: '${song.title}\n',
                              style: Style.textTheme().titleMedium,
                            ),
                            XText(
                                title: song.artist ?? '',
                                style: Style.textTheme().titleMedium!.copyWith(
                                    fontSize: 17, color: MyColors.colorGray))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(flex: 2, child: FavoriteButton(song: song))
              ]),
        ),
      ),
    );
  }
}
