import 'package:auto_route/auto_route.dart';
import 'package:zanmelodic/src/modules/dashboard/router/dashboard_router.dart';
import 'package:zanmelodic/src/modules/discover/pages/discover_page.dart';

class DiscoverRouters {}

class DiscoverCoordinator {
  static const autoRoute = AutoRoute(
      path: DashboardTaps.folderTab,
      page: EmptyRouterPage,
      name: 'DiscoverTab',
      children: [
        AutoRoute(path: "", page: DiscoverPage, name: "DiscoverRoute"),
        RedirectRoute(path: '*', redirectTo: ''),
      ]);
}
