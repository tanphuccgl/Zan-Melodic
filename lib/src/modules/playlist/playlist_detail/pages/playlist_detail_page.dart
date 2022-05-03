import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/routes/coordinator.dart';
import 'package:zanmelodic/src/modules/play_music/pages/player_bottom_bar.dart';
import 'package:zanmelodic/src/modules/playlist/playlist_detail/widgets/appbar_playlist_detail.dart';
import 'package:zanmelodic/src/modules/playlist/playlist_detail/widgets/song_list_in_album.dart';

class PlaylistDetailPage extends StatelessWidget {
  const PlaylistDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => XCoordinator.pop(context),
      child: const Scaffold(
        bottomNavigationBar: PlayerBottomBar(),
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [AppBarPlaylistDetail(), SongListInPlaylist()],
        ),
      ),
    );
  }
}
