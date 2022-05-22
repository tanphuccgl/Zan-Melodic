import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/modules/playlist/playlist_detail/logic/playlist_detail_bloc.dart';
import 'package:zanmelodic/src/modules/playlist/router/playlist_router.dart';
import 'package:zanmelodic/src/utils/utils.dart';
import 'package:zanmelodic/src/widgets/image_widget/custom_image_widget.dart';

class PlaylistCard extends StatelessWidget {
  const PlaylistCard({Key? key, required this.playlist}) : super(key: key);
  final PlaylistModel playlist;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => context
            .read<PlaylistDetailBloc>()
            .fetchListOfSongsFromPlaylist(context, playlist: playlist),
        onLongPress: () => PlaylistCoordinator.showDialogRemovePlaylist(context,
            playlist: playlist),
        child: Padding(
            padding: const EdgeInsets.all(3.5),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomImageWidget(
                  id: playlist.id,
                  height: 162.0,
                  width: 178.0,
                  artworkType: ArtworkType.PLAYLIST,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(playlist.playlist,
                        style: Style.textTheme().titleMedium),
                    Text(XUtils.formatNumberSong(playlist.numOfSongs),
                        style: Style.textTheme().titleMedium),
                  ],
                ),
              ],
            )));
  }
}
