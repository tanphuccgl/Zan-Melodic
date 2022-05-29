import 'package:auto_route/auto_route.dart';
import 'package:zanmelodic/src/modules/dashboard/router/dashboard_router.dart';
import 'package:zanmelodic/src/modules/recently/pages/recently_page.dart';

class RecentlyRouters {}

class RecentlyCoordinator {
  static const autoRoute = AutoRoute(
      path: DashboardTaps.recentlyTab,
      page: EmptyRouterPage,
      name: 'RecentlyTab',
      children: [
        AutoRoute(path: "", page: RecentlyPage, name: "RecentlyRoute"),
        RedirectRoute(path: '*', redirectTo: ''),
      ]);
}
