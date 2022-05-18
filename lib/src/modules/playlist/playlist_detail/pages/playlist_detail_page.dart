import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/routes/coordinator.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/modules/audio_control/pages/player_bottom_bar.dart';
import 'package:zanmelodic/src/modules/playlist/playlist_detail/widgets/appbar_playlist_detail.dart';
import 'package:zanmelodic/src/modules/playlist/playlist_detail/widgets/song_list_in_playlist.dart';

class PlaylistDetailPage extends StatelessWidget {
  const PlaylistDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => XCoordinator.pop(context),
      child: Scaffold(
        floatingActionButton: const PlayerBottomBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: RefreshIndicator(
          color: MyColors.colorPrimary,
          backgroundColor: MyColors.colorWhite,
          onRefresh: () async {},
          child: const CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              AppBarPlaylistDetail(),
              SongListInPlaylist(),
            ],
          ),
        ),
      ),
    );
  }
}
