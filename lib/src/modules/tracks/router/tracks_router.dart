import 'package:auto_route/auto_route.dart';
import 'package:zanmelodic/src/modules/dashboard/router/dashboard_router.dart';
import 'package:zanmelodic/src/modules/tracks/pages/tracks_page.dart';

class TracksRouters {}

class TracksCoordinator {
  static const autoRoute = AutoRoute(
      path: DashboardTaps.tracksTab,
      page: EmptyRouterPage,
      name: 'TracksTab',
      children: [
        AutoRoute(path: "", page: TracksPage, name: "TracksRoute"),
        RedirectRoute(path: '*', redirectTo: ''),
      ]);
}
