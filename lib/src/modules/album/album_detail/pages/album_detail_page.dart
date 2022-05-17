import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/routes/coordinator.dart';
import 'package:zanmelodic/src/modules/album/album_detail/widgets/appbar_album_detail.dart';
import 'package:zanmelodic/src/modules/album/album_detail/widgets/song_list_in_album.dart';
import 'package:zanmelodic/src/modules/audio_control/pages/player_bottom_bar.dart';

class AlbumDetailPage extends StatelessWidget {
  const AlbumDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => XCoordinator.pop(context),
      child: const Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: PlayerBottomBar(),
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            AppBarAlbumDetail(),
            SongListInAlbum(),
          ],
        ),
      ),
    );
  }
}
