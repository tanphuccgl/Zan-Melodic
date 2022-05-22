import 'package:auto_route/auto_route.dart';
import 'package:zanmelodic/src/config/routes/page_routers.dart';
import 'package:zanmelodic/src/modules/dashboard/router/dashboard_router.dart';
import 'package:zanmelodic/src/modules/loading/pages/loading_page.dart';
import 'package:zanmelodic/src/modules/song_detail/router/now_playing_router.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    DashboardCoordinator.autoRoute,
    AutoRoute(
      path: XRoutes.loading,
      page: LoadingPage,
    ),
    DetailSongCoordinator.autoRoute,
    // redirect all other paths
    RedirectRoute(path: '*', redirectTo: ''),
  ],
)
class $XRouter {}
