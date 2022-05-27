import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/routes/auto_route.gr.dart';
import 'package:zanmelodic/src/config/routes/page_routers.dart';
import 'package:zanmelodic/src/modules/album/router/album_router.dart';
import 'package:zanmelodic/src/modules/artist/router/artist_router.dart';
import 'package:zanmelodic/src/modules/dashboard/pages/dashboard_page.dart';
import 'package:zanmelodic/src/modules/dashboard/router/dashboard_wrapper_router.dart';
import 'package:zanmelodic/src/modules/discover/router/discover_router.dart';
import 'package:zanmelodic/src/modules/favorites/router/favorites_router.dart';
import 'package:zanmelodic/src/modules/folder/router/folder_router.dart';
import 'package:zanmelodic/src/modules/playlist/router/playlist_router.dart';
import 'package:zanmelodic/src/modules/songs/router/songs_router.dart';
import 'package:zanmelodic/src/modules/type_song/router/type_song_router.dart';

class DashboardTaps {
  static const String discoverTab = 'discover';

  static const String favoritesTab = 'favorites';
  static const String songTab = 'song';
  static const String playlistTab = 'playlist';
  static const String albumTab = 'album';
  static const String folderTab = 'folder';
  static const String typeSongTab = 'type_song';
  static const String artistTab = 'artist';
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
            SongCoordinator.autoRoute,
            PlaylistCoordinator.autoRoute,
            AlbumCoordinator.autoRoute,
            ArtistCoordinator.autoRoute,
            FolderCoordinator.autoRoute,
            DiscoverCoordinator.autoRoute,
            TypeSongCoordinator.autoRoute,
            RedirectRoute(path: '*', redirectTo: ''),
          ]),
      RedirectRoute(path: '*', redirectTo: ''),
    ],
  );
  static showNowPlayingScreen(BuildContext context) =>
      context.router.push(const DetailSongWrapperRoute());
}
