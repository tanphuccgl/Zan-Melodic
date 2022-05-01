// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i12;

import '../../modules/album/album/pages/album_page.dart' as _i9;
import '../../modules/album/album_detail/pages/album_detail_page.dart' as _i10;
import '../../modules/dashboard/pages/dashboard_page.dart' as _i3;
import '../../modules/dashboard/router/dashboard_wrapper_router.dart' as _i1;
import '../../modules/favorites/pages/favorites_page.dart' as _i6;
import '../../modules/folder/pages/folder_page.dart' as _i11;
import '../../modules/loading/pages/loading_page.dart' as _i2;
import '../../modules/now_playing/pages/now_playing_page.dart' as _i4;
import '../../modules/playlist/playlist/pages/playlist_page.dart' as _i8;
import '../../modules/songs/pages/songs_page.dart' as _i7;

class XRouter extends _i5.RootStackRouter {
  XRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    DashboardWrapperRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.DashboardWrapperPage());
    },
    LoadingRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoadingPage());
    },
    DashboardRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.DashboardPage());
    },
    NowPlayingRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.NowPlayingPage());
    },
    FavoritesTab.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    SongTab.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    PlaylistTab.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    AlbumTab.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    FolderTab.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    FavoritesRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.FavoritesPage());
    },
    SongRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.SongPage());
    },
    PlaylistRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.PlaylistPage());
    },
    AlbumRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.AlbumPage());
    },
    AlbumDetailRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.AlbumDetailPage());
    },
    FolderRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.FolderPage());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig('/#redirect',
            path: '/', redirectTo: '/dashboard', fullMatch: true),
        _i5.RouteConfig(DashboardWrapperRoute.name,
            path: '/dashboard',
            children: [
              _i5.RouteConfig(DashboardRoute.name,
                  path: '',
                  parent: DashboardWrapperRoute.name,
                  children: [
                    _i5.RouteConfig(FavoritesTab.name,
                        path: 'favorites',
                        parent: DashboardRoute.name,
                        children: [
                          _i5.RouteConfig(FavoritesRoute.name,
                              path: '', parent: FavoritesTab.name),
                          _i5.RouteConfig('*#redirect',
                              path: '*',
                              parent: FavoritesTab.name,
                              redirectTo: '',
                              fullMatch: true)
                        ]),
                    _i5.RouteConfig(SongTab.name,
                        path: 'song',
                        parent: DashboardRoute.name,
                        children: [
                          _i5.RouteConfig(SongRoute.name,
                              path: '', parent: SongTab.name),
                          _i5.RouteConfig('*#redirect',
                              path: '*',
                              parent: SongTab.name,
                              redirectTo: '',
                              fullMatch: true)
                        ]),
                    _i5.RouteConfig(PlaylistTab.name,
                        path: 'playlist',
                        parent: DashboardRoute.name,
                        children: [
                          _i5.RouteConfig(PlaylistRoute.name,
                              path: '', parent: PlaylistTab.name),
                          _i5.RouteConfig('*#redirect',
                              path: '*',
                              parent: PlaylistTab.name,
                              redirectTo: '',
                              fullMatch: true)
                        ]),
                    _i5.RouteConfig(AlbumTab.name,
                        path: 'album',
                        parent: DashboardRoute.name,
                        children: [
                          _i5.RouteConfig(AlbumRoute.name,
                              path: '', parent: AlbumTab.name),
                          _i5.RouteConfig(AlbumDetailRoute.name,
                              path: 'detail', parent: AlbumTab.name),
                          _i5.RouteConfig('*#redirect',
                              path: '*',
                              parent: AlbumTab.name,
                              redirectTo: '',
                              fullMatch: true)
                        ]),
                    _i5.RouteConfig(FolderTab.name,
                        path: 'folder',
                        parent: DashboardRoute.name,
                        children: [
                          _i5.RouteConfig(FolderRoute.name,
                              path: '', parent: FolderTab.name),
                          _i5.RouteConfig('*#redirect',
                              path: '*',
                              parent: FolderTab.name,
                              redirectTo: '',
                              fullMatch: true)
                        ]),
                    _i5.RouteConfig('*#redirect',
                        path: '*',
                        parent: DashboardRoute.name,
                        redirectTo: '',
                        fullMatch: true)
                  ]),
              _i5.RouteConfig(NowPlayingRoute.name,
                  path: 'now-playing', parent: DashboardWrapperRoute.name),
              _i5.RouteConfig('*#redirect',
                  path: '*',
                  parent: DashboardWrapperRoute.name,
                  redirectTo: '',
                  fullMatch: true)
            ]),
        _i5.RouteConfig(LoadingRoute.name, path: ''),
        _i5.RouteConfig('*#redirect',
            path: '*', redirectTo: '', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.DashboardWrapperPage]
class DashboardWrapperRoute extends _i5.PageRouteInfo<void> {
  const DashboardWrapperRoute({List<_i5.PageRouteInfo>? children})
      : super(DashboardWrapperRoute.name,
            path: '/dashboard', initialChildren: children);

  static const String name = 'DashboardWrapperRoute';
}

/// generated route for
/// [_i2.LoadingPage]
class LoadingRoute extends _i5.PageRouteInfo<void> {
  const LoadingRoute() : super(LoadingRoute.name, path: '');

  static const String name = 'LoadingRoute';
}

/// generated route for
/// [_i3.DashboardPage]
class DashboardRoute extends _i5.PageRouteInfo<void> {
  const DashboardRoute({List<_i5.PageRouteInfo>? children})
      : super(DashboardRoute.name, path: '', initialChildren: children);

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i4.NowPlayingPage]
class NowPlayingRoute extends _i5.PageRouteInfo<void> {
  const NowPlayingRoute() : super(NowPlayingRoute.name, path: 'now-playing');

  static const String name = 'NowPlayingRoute';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class FavoritesTab extends _i5.PageRouteInfo<void> {
  const FavoritesTab({List<_i5.PageRouteInfo>? children})
      : super(FavoritesTab.name, path: 'favorites', initialChildren: children);

  static const String name = 'FavoritesTab';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class SongTab extends _i5.PageRouteInfo<void> {
  const SongTab({List<_i5.PageRouteInfo>? children})
      : super(SongTab.name, path: 'song', initialChildren: children);

  static const String name = 'SongTab';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class PlaylistTab extends _i5.PageRouteInfo<void> {
  const PlaylistTab({List<_i5.PageRouteInfo>? children})
      : super(PlaylistTab.name, path: 'playlist', initialChildren: children);

  static const String name = 'PlaylistTab';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class AlbumTab extends _i5.PageRouteInfo<void> {
  const AlbumTab({List<_i5.PageRouteInfo>? children})
      : super(AlbumTab.name, path: 'album', initialChildren: children);

  static const String name = 'AlbumTab';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class FolderTab extends _i5.PageRouteInfo<void> {
  const FolderTab({List<_i5.PageRouteInfo>? children})
      : super(FolderTab.name, path: 'folder', initialChildren: children);

  static const String name = 'FolderTab';
}

/// generated route for
/// [_i6.FavoritesPage]
class FavoritesRoute extends _i5.PageRouteInfo<void> {
  const FavoritesRoute() : super(FavoritesRoute.name, path: '');

  static const String name = 'FavoritesRoute';
}

/// generated route for
/// [_i7.SongPage]
class SongRoute extends _i5.PageRouteInfo<void> {
  const SongRoute() : super(SongRoute.name, path: '');

  static const String name = 'SongRoute';
}

/// generated route for
/// [_i8.PlaylistPage]
class PlaylistRoute extends _i5.PageRouteInfo<void> {
  const PlaylistRoute() : super(PlaylistRoute.name, path: '');

  static const String name = 'PlaylistRoute';
}

/// generated route for
/// [_i9.AlbumPage]
class AlbumRoute extends _i5.PageRouteInfo<void> {
  const AlbumRoute() : super(AlbumRoute.name, path: '');

  static const String name = 'AlbumRoute';
}

/// generated route for
/// [_i10.AlbumDetailPage]
class AlbumDetailRoute extends _i5.PageRouteInfo<void> {
  const AlbumDetailRoute() : super(AlbumDetailRoute.name, path: 'detail');

  static const String name = 'AlbumDetailRoute';
}

/// generated route for
/// [_i11.FolderPage]
class FolderRoute extends _i5.PageRouteInfo<void> {
  const FolderRoute() : super(FolderRoute.name, path: '');

  static const String name = 'FolderRoute';
}
