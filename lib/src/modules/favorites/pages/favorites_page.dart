import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/modules/favorites/widgets/playlist_favorites_widget.dart';
import 'package:zanmelodic/src/modules/favorites/widgets/singer_favorites_widget.dart';
import 'package:zanmelodic/src/modules/favorites/widgets/tracks_favorites_widget.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            _headerTitle('Singer'),
            const SingerFavotiresWidget(),
            _headerTitle('Playlist'),
            const PlaylistFavotiresWidget(),
            _headerTitle('Tracks'),
            const TracksFavotiresWidget()
          ],
        ),
      ),
    );
  }

  Widget _headerTitle(String title) {
    return SliverToBoxAdapter(
      child: Text(
        title,
        style: Style.textTheme().titleLarge,
      ),
    );
  }
}
