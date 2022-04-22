import 'package:auto_route/auto_route.dart';

import 'package:zanmelodic/src/modules/dashboard/router/dashboard_router.dart';
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
}
