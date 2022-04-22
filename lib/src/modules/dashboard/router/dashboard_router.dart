import 'package:auto_route/auto_route.dart';
import 'package:zanmelodic/src/config/routes/page_routers.dart';
import 'package:zanmelodic/src/modules/album/router/album_router.dart';
import 'package:zanmelodic/src/modules/dashboard/pages/dashboard_page.dart';
import 'package:zanmelodic/src/modules/dashboard/router/dashboard_wrapper_router.dart';
import 'package:zanmelodic/src/modules/favorites/router/favorites_router.dart';
import 'package:zanmelodic/src/modules/folder/router/folder_router.dart';
import 'package:zanmelodic/src/modules/playlist/router/playlist_router.dart';
import 'package:zanmelodic/src/modules/tracks/router/tracks_router.dart';

class DashboardTaps {
  static const String favoritesTab = 'favorites';
  static const String tracksTab = 'tracks';
  static const String playlistTab = 'playlist';
  static const String albumTab = 'album';
  static const String folderTab = 'folder';
}

class DashboardCoordinator {
  static const autoRoute = AutoRoute(
    path: XRoutes.dashboard,
    name: "DashboardWrapperRoute",
    page: DashboardWrapperPage,
    initial: true,
    children: [
      AutoRoute(
          name: "DashboardRoute",
          page: DashboardPage,
          initial: true,
          children: [
            FavoritesCoordinator.autoRoute,
            TracksCoordinator.autoRoute,
            PlaylistCoordinator.autoRoute,
            AlbumCoordinator.autoRoute,
            FolderCoordinator.autoRoute,
            RedirectRoute(path: '*', redirectTo: ''),
          ]),
      RedirectRoute(path: '*', redirectTo: ''),
    ],
  );
}
