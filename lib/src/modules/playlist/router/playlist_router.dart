import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/modules/dashboard/router/dashboard_router.dart';
import 'package:zanmelodic/src/modules/playlist/playlist/logic/playlist_bloc.dart';
import 'package:zanmelodic/src/modules/playlist/playlist/pages/playlist_page.dart';
import 'package:zanmelodic/src/modules/playlist/playlist/widgets/dialog_add_to_playlist.dart';
import 'package:zanmelodic/src/modules/playlist/playlist/widgets/dialog_create_playlist.dart';
import 'package:zanmelodic/src/modules/playlist/playlist/widgets/dialog_remove_playlist.dart';
import 'package:zanmelodic/src/modules/playlist/playlist_detail/pages/playlist_detail_page.dart';
import 'package:zanmelodic/src/modules/playlist/playlist_detail/widgets/dialog_remove_from_playlist.dart';
import 'package:zanmelodic/src/modules/playlist/playlist_detail/widgets/dialog_rename_playlist.dart';

class PlaylistRouters {
  static const String detail = 'detail';
}

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
        AutoRoute(
            path: PlaylistRouters.detail,
            page: PlaylistDetailPage,
            name: "PlaylistDetailRoute"),
        RedirectRoute(path: '*', redirectTo: ''),
      ]);

  static showDialogCreatePlaylist(BuildContext context) {
    context.read<PlaylistBloc>().initialNamePlaylist();
    showDialog<String>(
        barrierDismissible: false,
        context: context,
        builder: (_) => const DialogCreatePlaylist());
  }

  static showDialogRemovePlaylist(BuildContext context,
          {required PlaylistModel playlist}) =>
      showDialog<String>(
          barrierDismissible: false,
          context: context,
          builder: (_) => DialogRemovePlaylist(playlist: playlist));

  static showPlaylistDetailScreen(BuildContext context) =>
      context.router.pushWidget(const PlaylistDetailPage());

  static showDialogRenamePlaylist(BuildContext context,
      {required String namePlaylist}) {
    context.read<PlaylistBloc>().changedName(namePlaylist);

    showDialog<String>(
        barrierDismissible: false,
        context: context,
        builder: (_) => const DialogRenamePlaylist());
  }

  static showDialogAddToPlaylist(BuildContext context,
      {required SongModel songModel}) {
    context
        .read<PlaylistBloc>()
        .fetchPlaylistToDialog(context, songModel: songModel);

    showDialog<String>(
        barrierDismissible: false,
        context: context,
        builder: (_) => DialogAddToPlaylist(
              idSong: songModel.id,
            ));
  }

  static showDialogRemoveFromPlaylist(BuildContext context,
          {required PlaylistModel playlist, required SongModel song}) =>
      showDialog<String>(
          barrierDismissible: false,
          context: context,
          builder: (_) => DialogRemoveFromPlaylist(
                song: song,
                playlist: playlist,
              ));
}
