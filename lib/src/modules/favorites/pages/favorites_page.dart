import 'package:flutter/material.dart';
import 'package:zanmelodic/src/constants/my_padding.dart';
import 'package:zanmelodic/src/modules/favorites/widgets/song_list_in_favorite.dart';
import 'package:zanmelodic/src/modules/upper_control/widgets/upper_control_bar.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: MyPadding.pPage,
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: UpperControlBar()),
            SongListFavoriteWidget(),
          ],
        ),
      ),
    );
  }
}
