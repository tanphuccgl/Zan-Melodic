import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zanmelodic/src/modules/album/album/pages/album_page.dart';
import 'package:zanmelodic/src/modules/album/album_detail/pages/album_detail_page.dart';
import 'package:zanmelodic/src/modules/dashboard/router/dashboard_router.dart';

class AlbumRouters {
  static const String detail = 'detail';
}

class AlbumCoordinator {
  static const autoRoute = AutoRoute(
      path: DashboardTaps.albumTab,
      page: EmptyRouterPage,
      name: 'AlbumTab',
      children: [
        AutoRoute(path: "", page: AlbumPage, name: "AlbumRoute"),
        AutoRoute(
            path: AlbumRouters.detail,
            page: AlbumDetailPage,
            name: "AlbumDetailRoute"),
        RedirectRoute(path: '*', redirectTo: ''),
      ]);

  static showAlbumDetailScreen(
    BuildContext context,
  ) {
    context.router.pushWidget(const AlbumDetailPage());
  }
}
