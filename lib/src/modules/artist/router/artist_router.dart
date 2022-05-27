import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zanmelodic/src/modules/artist/artist/pages/artist_page.dart';
import 'package:zanmelodic/src/modules/artist/artist_detail/pages/artist_detail_page.dart';
import 'package:zanmelodic/src/modules/dashboard/router/dashboard_router.dart';

class ArtistRouters {
  static const String detail = 'detail';
}

class ArtistCoordinator {
  static const autoRoute = AutoRoute(
      path: DashboardTaps.folderTab,
      page: EmptyRouterPage,
      name: 'ArtistTab',
      children: [
        AutoRoute(path: "", page: ArtistPage, name: "ArtistRoute"),
        AutoRoute(
            path: ArtistRouters.detail,
            page: ArtistDetailPage,
            name: "ArtistDetailRoute"),
        RedirectRoute(path: '*', redirectTo: ''),
      ]);
  static showArtistDetailScreen(
    BuildContext context,
  ) =>
      context.router.pushWidget(const ArtistDetailPage());
}
