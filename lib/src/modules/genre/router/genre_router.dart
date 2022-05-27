import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zanmelodic/src/modules/dashboard/router/dashboard_router.dart';
import 'package:zanmelodic/src/modules/genre/genre/pages/genre_page.dart';
import 'package:zanmelodic/src/modules/genre/genre_detail/pages/genre_detail_page.dart';

class GenreRouters {
  static const String detail = 'detail';
}

class GenreCoordinator {
  static const autoRoute = AutoRoute(
      path: DashboardTaps.genreTab,
      page: EmptyRouterPage,
      name: 'GenreTab',
      children: [
        AutoRoute(path: "", page: GenrePage, name: "GenreRoute"),
        AutoRoute(
            path: GenreRouters.detail,
            page: GenreDetailPage,
            name: "GenreDetailRoute"),
        RedirectRoute(path: '*', redirectTo: ''),
      ]);

  static showGenreDetailScreen(
    BuildContext context,
  ) =>
      context.router.pushWidget(const GenreDetailPage());
}
