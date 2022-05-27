import 'package:auto_route/auto_route.dart';
import 'package:zanmelodic/src/modules/dashboard/router/dashboard_router.dart';
import 'package:zanmelodic/src/modules/type_song/pages/type_song_page.dart';

class TypeSongRouters {}

class TypeSongCoordinator {
  static const autoRoute = AutoRoute(
      path: DashboardTaps.typeSongTab,
      page: EmptyRouterPage,
      name: 'TypeSongTab',
      children: [
        AutoRoute(path: "", page: TypeSongPage, name: "TypeSongRoute"),
        RedirectRoute(path: '*', redirectTo: ''),
      ]);
}
