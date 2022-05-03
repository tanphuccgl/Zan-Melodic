import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/modules/play_music/logic/play_music_bloc.dart';
import 'package:zanmelodic/src/modules/playlist/router/playlist_router.dart';
import 'package:zanmelodic/src/widgets/image_widget/custom_image_widget.dart';

class SongCard extends StatelessWidget {
  const SongCard(
      {Key? key, required this.song, required this.songList, this.playlist})
      : super(key: key);
  final SongModel song;
  final List<SongModel> songList;
  final PlaylistModel? playlist;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: playlist != null
          ? () => PlaylistCoordinator.showDialogRemoveFromPlaylist(context,
              song: song, playlist: playlist!)
          : () => PlaylistCoordinator.showDialogAddToPlaylist(context,
              songModel: song),
      onTap: () => context
          .read<PlayMusicBloc>()
          .onPlayerItem(songList: songList, song: song),
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
                        child: CustomImageWidget(
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
                            Text(
                              '${song.title}\n',
                              style: Style.textTheme().titleMedium,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(song.artist ?? '',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Style.textTheme().titleMedium!.copyWith(
                                    fontSize: 17, color: MyColors.colorGray))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border,
                      color: MyColors.colorWhite,
                    ),
                    iconSize: 25,
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
