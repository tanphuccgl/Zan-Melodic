import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/modules/dashboard/router/dashboard_router.dart';
import 'package:zanmelodic/src/modules/discover/widgets/dialog_remove_from_favorites.dart';
import 'package:zanmelodic/src/modules/favorites/pages/favorites_page.dart';

class FavoritesRouters {}

class FavoritesCoordinator {
  static const autoRoute = AutoRoute(
      path: DashboardTaps.favoritesTab,
      page: EmptyRouterPage,
      name: 'FavoritesTab',
      children: [
        AutoRoute(path: "", page: FavoritesPage, name: "FavoritesRoute"),
        RedirectRoute(path: '*', redirectTo: ''),
      ]);

  static showDialogRemoveFromFavorites(BuildContext context,
          {required SongModel song}) =>
      showDialog<String>(
          barrierDismissible: false,
          context: context,
          builder: (_) => DialogRemoveFromFavorites(
                song: song,
              ));
}
