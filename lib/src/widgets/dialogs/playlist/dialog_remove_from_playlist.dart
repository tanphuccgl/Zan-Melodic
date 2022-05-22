import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/modules/playlist/playlist_detail/logic/playlist_detail_bloc.dart';
import 'package:zanmelodic/src/widgets/base/base_dialog.dart';

class DialogRemoveFromPlaylist extends StatelessWidget {
  final SongModel song;
  final PlaylistModel playlist;
  const DialogRemoveFromPlaylist(
      {Key? key, required this.song, required this.playlist})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
        body: RichText(
          text: TextSpan(
              text: 'Do you want to remove ',
              style: Style.textTheme().titleMedium!.copyWith(fontSize: 17),
              children: [
                TextSpan(
                  text: song.title,
                  style: Style.textTheme()
                      .titleMedium!
                      .copyWith(color: MyColors.colorPrimary),
                ),
                const TextSpan(
                  text: '  from the ',
                ),
                TextSpan(
                  text: playlist.playlist,
                  style: Style.textTheme()
                      .titleMedium!
                      .copyWith(color: MyColors.colorPrimary),
                ),
                const TextSpan(
                  text: '  playlist ?',
                ),
              ]),
        ),
        textAccept: 'REMOVE',
        onPressed: () => context
            .read<PlaylistDetailBloc>()
            .removeFromPlaylist(context, playlist: playlist, song: song));
  }
}
