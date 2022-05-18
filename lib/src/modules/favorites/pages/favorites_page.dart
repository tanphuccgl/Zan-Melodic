import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/constants/my_padding.dart';
import 'package:zanmelodic/src/modules/favorites/logic/favorites_bloc.dart';
import 'package:zanmelodic/src/modules/favorites/widgets/song_list_in_favorite.dart';
import 'package:zanmelodic/src/modules/upper_control/widgets/upper_control_bar.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: MyColors.colorPrimary,
        backgroundColor: MyColors.colorWhite,
        onRefresh: () async =>
            context.read<FavoritesBloc>().fetchSongsFromFavorites(),
        child: const Padding(
          padding: MyPadding.pPage,
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(child: UpperControlBar()),
              SongListFavoriteWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
