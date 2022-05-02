import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/config/routes/coordinator.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/modules/playlist/playlist/logic/playlist_bloc.dart';

class DialogRemovePlaylist extends StatelessWidget {
  const DialogRemovePlaylist({Key? key, required this.playlist})
      : super(key: key);
  final PlaylistModel playlist;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: MyColors.colorBlack,
      contentPadding: const EdgeInsets.all(16.0),
      content: RichText(
        text: TextSpan(
            text: 'Do you want to remove playlist ',
            style: Style.textTheme().titleMedium!.copyWith(fontSize: 17),
            children: [
              TextSpan(
                text: playlist.playlist,
                style: Style.textTheme()
                    .titleMedium!
                    .copyWith(color: MyColors.colorPrimary),
              ),
              const TextSpan(
                text: ' ?',
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
                .read<PlaylistBloc>()
                .removePlaylist(context, idPlaylist: playlist.id),
            child: Text('REMOVE',
                style: Style.textTheme()
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w600, fontSize: 17))),
      ],
    );
  }
}
