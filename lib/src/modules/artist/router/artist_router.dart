import 'package:auto_route/auto_route.dart';
import 'package:zanmelodic/src/modules/artist/pages/artist_page.dart';
import 'package:zanmelodic/src/modules/dashboard/router/dashboard_router.dart';

class ArtistRouters {}

class ArtistCoordinator {
  static const autoRoute = AutoRoute(
      path: DashboardTaps.folderTab,
      page: EmptyRouterPage,
      name: 'ArtistTab',
      children: [
        AutoRoute(path: "", page: ArtistPage, name: "ArtistRoute"),
        RedirectRoute(path: '*', redirectTo: ''),
      ]);
}
