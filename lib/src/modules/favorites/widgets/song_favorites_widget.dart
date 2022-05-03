import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_room/details/rooms/favorites/favorites_entity.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/models/result.dart';
import 'package:zanmelodic/src/modules/favorites/logic/favorites_bloc.dart';
import 'package:zanmelodic/src/modules/favorites/router/favorites_router.dart';
import 'package:zanmelodic/src/widgets/state/state_empty_widget.dart';
import 'package:zanmelodic/src/widgets/state/state_error_widget.dart';
import 'package:zanmelodic/src/widgets/state/state_loading_widget.dart';

class SongFavotiresWidget extends StatelessWidget {
  const SongFavotiresWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        XHandle<List<FavoritesEntity>> _handle = state.songs;
        if (_handle.isCompleted) {
          _handle = XHandle.result(XResult.success(state.songs.data ?? []));
          final List<FavoritesEntity> _items = _handle.data ?? [];

          return _items.isNotEmpty
              ? SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 6, 20, 6),
                          child: _buildCard(context,
                              favoritesEntity: _items[index]));
                    }, childCount: _items.length),
                  ),
                )
              : const XStateEmptyWidget();
        } else if (_handle.isLoading) {
          return const XStateLoadingWidget();
        } else {
          return const XStateErrorWidget();
        }
      },
    );
  }

  Widget _buildCard(BuildContext context,
      {required FavoritesEntity favoritesEntity}) {
    return GestureDetector(
      onLongPress: () => FavoritesCoordinator.showDialogRemoveFromFavorites(
          context,
          favoritesEntity: favoritesEntity),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.network(
              'https://s3-alpha-sig.figma.com/img/3396/b467/b81be7b8995e49b98686d41bcbe6a1e4?Expires=1652659200&Signature=fOgf7pxYm1UuMRIpqZ0hA6ADz8vIElkgVt29aUbepHjkfu4hvwxyCTdrB-ad1c8m0HLh7NVxc0lkPwIw6tUtgAXGF9ZEUkzSCaMhFBoyFZQFrOiRccvNotdBKmX5M~RkTwpkPVTsNdGyoNGWf0XwNwQsQqdvpCWx-sSY2UEE73cxt-npqwSvD0gvE3jkpn0UIdzrTPN-~mp-UJspICeKhSHq1mVrMNmZh4cBqyaxRzfl3YfmNXIhPHBaMbLL0AX~yw9Grqz-5S~p4BGkBjRZT1HgWlUhmsaggqQBE9nkeQGVG-tM4f1PhJdVzTgJj013b6ZuZ8Fnv8G3RxrtGKbJKg__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
              height: 70.0,
              width: 70.0,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${favoritesEntity.title}\n',
                  style: Style.textTheme().titleMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(favoritesEntity.artist ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Style.textTheme()
                        .titleMedium!
                        .copyWith(fontSize: 17, color: MyColors.colorGray))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
