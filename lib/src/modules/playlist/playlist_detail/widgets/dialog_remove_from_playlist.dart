import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/config/routes/coordinator.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/modules/playlist/playlist_detail/logic/playlist_detail_bloc.dart';

class DialogRemoveFromPlaylist extends StatelessWidget {
  const DialogRemoveFromPlaylist(
      {Key? key, required this.song, required this.playlist})
      : super(key: key);
  final SongModel song;
  final PlaylistModel playlist;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: MyColors.colorBlack,
      contentPadding: const EdgeInsets.all(16.0),
      content: RichText(
        text: TextSpan(
            text: 'Do you want to remove ',
            style: Style.textTheme().titleMedium!.copyWith(fontSize: 17),
            children: [
              TextSpan(
                text: song.title,
                style: Style.textTheme()
                    .titleMedium!
                    .copyWith(color: MyColors.colorGreen),
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
      actions: <Widget>[
        TextButton(
            onPressed: () => XCoordinator.pop(context),
            child: Text(
              'CANCEL',
              style: Style.textTheme()
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.w600, fontSize: 17),
            )),
        TextButton(
            onPressed: () => context
                .read<PlaylistDetailBloc>()
                .removeFromPlaylist(context,
                    playlist: playlist, idSong: song.id),
            child: Text('REMOVE',
                style: Style.textTheme()
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w600, fontSize: 17))),
      ],
    );
  }
}
