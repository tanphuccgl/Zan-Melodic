import 'package:auto_route/auto_route.dart';
import 'package:zanmelodic/src/modules/dashboard/router/dashboard_router.dart';
import 'package:zanmelodic/src/modules/folder/pages/folder_page.dart';

class FolderRouters {}

class FolderCoordinator {
  static const autoRoute = AutoRoute(
      path: DashboardTaps.folderTab,
      page: EmptyRouterPage,
      name: 'FolderTab',
      children: [
        AutoRoute(path: "", page: FolderPage, name: "FolderRoute"),
        RedirectRoute(path: '*', redirectTo: ''),
      ]);
}
