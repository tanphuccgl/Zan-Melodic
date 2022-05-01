import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/modules/dashboard/router/dashboard_router.dart';
import 'package:zanmelodic/src/modules/playlist/playlist/pages/playlist_page.dart';
import 'package:zanmelodic/src/modules/playlist/playlist/widgets/dialog_create_playlist.dart';
import 'package:zanmelodic/src/modules/playlist/playlist/widgets/dialog_remove_playlist.dart';

class PlaylistRouters {}

class PlaylistCoordinator {
  static const autoRoute = AutoRoute(
      path: DashboardTaps.playlistTab,
      page: EmptyRouterPage,
      name: 'PlaylistTab',
      children: [
        AutoRoute(
          path: "",
          page: PlaylistPage,
          name: "PlaylistRoute",
        ),
        RedirectRoute(path: '*', redirectTo: ''),
      ]);
  static showDialogCreatePlaylist(BuildContext context) async {
    showDialog<String>(
        barrierDismissible: false,
        context: context,
        builder: (_) => const DialogCreatePlaylist());
  }

  static showDialogRemovePlaylist(BuildContext context,
      {required PlaylistModel playlist}) async {
    showDialog<String>(
        barrierDismissible: false,
        context: context,
        builder: (_) => DialogRemovePlaylist(playlist: playlist));
  }
}
