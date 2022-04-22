import 'package:auto_route/auto_route.dart';
import 'package:zanmelodic/src/modules/album/pages/album_page.dart';
import 'package:zanmelodic/src/modules/dashboard/router/dashboard_router.dart';

class AlbumRouters {}

class AlbumCoordinator {
  static const autoRoute = AutoRoute(
      path: DashboardTaps.albumTab,
      page: EmptyRouterPage,
      name: 'AlbumTab',
      children: [
        AutoRoute(path: "", page: AlbumPage, name: "AlbumRoute"),
        RedirectRoute(path: '*', redirectTo: ''),
      ]);
}
