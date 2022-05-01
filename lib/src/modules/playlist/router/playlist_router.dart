import 'package:auto_route/auto_route.dart';
import 'package:zanmelodic/src/modules/dashboard/router/dashboard_router.dart';
import 'package:zanmelodic/src/modules/playlist/playlist/pages/playlist_page.dart';

class PlaylistRouters {}

class PlaylistCoordinator {
  static const autoRoute = AutoRoute(
      path: DashboardTaps.playlistTab,
      page: EmptyRouterPage,
      name: 'PlaylistTab',
      children: [
        AutoRoute(path: "", page: PlaylistPage, name: "PlaylistRoute"),
        RedirectRoute(path: '*', redirectTo: ''),
      ]);
}
