// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i10;

import '../../modules/album/pages/album_page.dart' as _i8;
import '../../modules/dashboard/pages/dashboard_page.dart' as _i3;
import '../../modules/dashboard/router/dashboard_wrapper_router.dart' as _i1;
import '../../modules/favorites/pages/favorites_page.dart' as _i5;
import '../../modules/folder/pages/folder_page.dart' as _i9;
import '../../modules/loading/pages/loading_page.dart' as _i2;
import '../../modules/playlist/pages/playlist_page.dart' as _i7;
import '../../modules/tracks/pages/tracks_page.dart' as _i6;

class XRouter extends _i4.RootStackRouter {
  XRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    DashboardWrapperRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.DashboardWrapperPage());
    },
    LoadingRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoadingPage());
    },
    DashboardRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.DashboardPage());
    },
    FavoritesTab.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.EmptyRouterPage());
    },
    TracksTab.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.EmptyRouterPage());
    },
    PlaylistTab.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.EmptyRouterPage());
    },
    AlbumTab.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.EmptyRouterPage());
    },
    FolderTab.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.EmptyRouterPage());
    },
    FavoritesRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.FavoritesPage());
    },
    TracksRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.TracksPage());
    },
    PlaylistRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.PlaylistPage());
    },
    AlbumRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.AlbumPage());
    },
    FolderRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.FolderPage());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig('/#redirect',
            path: '/', redirectTo: '/dashboard', fullMatch: true),
        _i4.RouteConfig(DashboardWrapperRoute.name,
            path: '/dashboard',
            children: [
              _i4.RouteConfig(DashboardRoute.name,
                  path: '',
                  parent: DashboardWrapperRoute.name,
                  children: [
                    _i4.RouteConfig(FavoritesTab.name,
                        path: 'favorites',
                        parent: DashboardRoute.name,
                        children: [
                          _i4.RouteConfig(FavoritesRoute.name,
                              path: '', parent: FavoritesTab.name),
                          _i4.RouteConfig('*#redirect',
                              path: '*',
                              parent: FavoritesTab.name,
                              redirectTo: '',
                              fullMatch: true)
                        ]),
                    _i4.RouteConfig(TracksTab.name,
                        path: 'tracks',
                        parent: DashboardRoute.name,
                        children: [
                          _i4.RouteConfig(TracksRoute.name,
                              path: '', parent: TracksTab.name),
                          _i4.RouteConfig('*#redirect',
                              path: '*',
                              parent: TracksTab.name,
                              redirectTo: '',
                              fullMatch: true)
                        ]),
                    _i4.RouteConfig(PlaylistTab.name,
                        path: 'playlist',
                        parent: DashboardRoute.name,
                        children: [
                          _i4.RouteConfig(PlaylistRoute.name,
                              path: '', parent: PlaylistTab.name),
                          _i4.RouteConfig('*#redirect',
                              path: '*',
                              parent: PlaylistTab.name,
                              redirectTo: '',
                              fullMatch: true)
                        ]),
                    _i4.RouteConfig(AlbumTab.name,
                        path: 'album',
                        parent: DashboardRoute.name,
                        children: [
                          _i4.RouteConfig(AlbumRoute.name,
                              path: '', parent: AlbumTab.name),
                          _i4.RouteConfig('*#redirect',
                              path: '*',
                              parent: AlbumTab.name,
                              redirectTo: '',
                              fullMatch: true)
                        ]),
                    _i4.RouteConfig(FolderTab.name,
                        path: 'folder',
                        parent: DashboardRoute.name,
                        children: [
                          _i4.RouteConfig(FolderRoute.name,
                              path: '', parent: FolderTab.name),
                          _i4.RouteConfig('*#redirect',
                              path: '*',
                              parent: FolderTab.name,
                              redirectTo: '',
                              fullMatch: true)
                        ]),
                    _i4.RouteConfig('*#redirect',
                        path: '*',
                        parent: DashboardRoute.name,
                        redirectTo: '',
                        fullMatch: true)
                  ]),
              _i4.RouteConfig('*#redirect',
                  path: '*',
                  parent: DashboardWrapperRoute.name,
                  redirectTo: '',
                  fullMatch: true)
            ]),
        _i4.RouteConfig(LoadingRoute.name, path: ''),
        _i4.RouteConfig('*#redirect',
            path: '*', redirectTo: '', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.DashboardWrapperPage]
class DashboardWrapperRoute extends _i4.PageRouteInfo<void> {
  const DashboardWrapperRoute({List<_i4.PageRouteInfo>? children})
      : super(DashboardWrapperRoute.name,
            path: '/dashboard', initialChildren: children);

  static const String name = 'DashboardWrapperRoute';
}

/// generated route for
/// [_i2.LoadingPage]
class LoadingRoute extends _i4.PageRouteInfo<void> {
  const LoadingRoute() : super(LoadingRoute.name, path: '');

  static const String name = 'LoadingRoute';
}

/// generated route for
/// [_i3.DashboardPage]
class DashboardRoute extends _i4.PageRouteInfo<void> {
  const DashboardRoute({List<_i4.PageRouteInfo>? children})
      : super(DashboardRoute.name, path: '', initialChildren: children);

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class FavoritesTab extends _i4.PageRouteInfo<void> {
  const FavoritesTab({List<_i4.PageRouteInfo>? children})
      : super(FavoritesTab.name, path: 'favorites', initialChildren: children);

  static const String name = 'FavoritesTab';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class TracksTab extends _i4.PageRouteInfo<void> {
  const TracksTab({List<_i4.PageRouteInfo>? children})
      : super(TracksTab.name, path: 'tracks', initialChildren: children);

  static const String name = 'TracksTab';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class PlaylistTab extends _i4.PageRouteInfo<void> {
  const PlaylistTab({List<_i4.PageRouteInfo>? children})
      : super(PlaylistTab.name, path: 'playlist', initialChildren: children);

  static const String name = 'PlaylistTab';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class AlbumTab extends _i4.PageRouteInfo<void> {
  const AlbumTab({List<_i4.PageRouteInfo>? children})
      : super(AlbumTab.name, path: 'album', initialChildren: children);

  static const String name = 'AlbumTab';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class FolderTab extends _i4.PageRouteInfo<void> {
  const FolderTab({List<_i4.PageRouteInfo>? children})
      : super(FolderTab.name, path: 'folder', initialChildren: children);

  static const String name = 'FolderTab';
}

/// generated route for
/// [_i5.FavoritesPage]
class FavoritesRoute extends _i4.PageRouteInfo<void> {
  const FavoritesRoute() : super(FavoritesRoute.name, path: '');

  static const String name = 'FavoritesRoute';
}

/// generated route for
/// [_i6.TracksPage]
class TracksRoute extends _i4.PageRouteInfo<void> {
  const TracksRoute() : super(TracksRoute.name, path: '');

  static const String name = 'TracksRoute';
}

/// generated route for
/// [_i7.PlaylistPage]
class PlaylistRoute extends _i4.PageRouteInfo<void> {
  const PlaylistRoute() : super(PlaylistRoute.name, path: '');

  static const String name = 'PlaylistRoute';
}

/// generated route for
/// [_i8.AlbumPage]
class AlbumRoute extends _i4.PageRouteInfo<void> {
  const AlbumRoute() : super(AlbumRoute.name, path: '');

  static const String name = 'AlbumRoute';
}

/// generated route for
/// [_i9.FolderPage]
class FolderRoute extends _i4.PageRouteInfo<void> {
  const FolderRoute() : super(FolderRoute.name, path: '');

  static const String name = 'FolderRoute';
}
