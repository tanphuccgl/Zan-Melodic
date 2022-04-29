import 'package:auto_route/auto_route.dart';
import 'package:zanmelodic/src/modules/dashboard/router/dashboard_router.dart';
import 'package:zanmelodic/src/modules/songs/pages/songs_page.dart';

class SongRouters {}

class SongCoordinator {
  static const autoRoute = AutoRoute(
      path: DashboardTaps.songTab,
      page: EmptyRouterPage,
      name: 'SongTab',
      children: [
        AutoRoute(path: "", page: SongPage, name: "SongRoute"),
        RedirectRoute(path: '*', redirectTo: ''),
      ]);
}
