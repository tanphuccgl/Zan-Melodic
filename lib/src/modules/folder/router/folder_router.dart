import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zanmelodic/src/modules/dashboard/router/dashboard_router.dart';
import 'package:zanmelodic/src/modules/detail_folder/pages/detail_folder_page.dart';
import 'package:zanmelodic/src/modules/folder/pages/folder_page.dart';

class FolderRouters {
  static const String detail = 'detail';
}

class FolderCoordinator {
  static const autoRoute = AutoRoute(
      path: DashboardTaps.folderTab,
      page: EmptyRouterPage,
      name: 'FolderTab',
      children: [
        AutoRoute(path: "", page: FolderPage, name: "FolderRoute"),
        AutoRoute(
          path: FolderRouters.detail,
          page: DetailFolderPage,
          name: "DetailFolderRoute",
        ),
        RedirectRoute(path: '*', redirectTo: ''),
      ]);

  static showDetailFolderScreen(BuildContext context, String name) =>
      context.router.pushWidget(
        DetailFolderPage(name: name),
      );
}
