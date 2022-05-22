import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/modules/playlist/playlist/logic/playlist_bloc.dart';
import 'package:zanmelodic/src/widgets/base/base_dialog.dart';

class DialogRemovePlaylist extends StatelessWidget {
  final PlaylistModel playlist;
  const DialogRemovePlaylist({Key? key, required this.playlist})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
        body: RichText(
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
        textAccept: 'REMOVE',
        onPressed: () => context
            .read<PlaylistBloc>()
            .removePlaylist(context, idPlaylist: playlist.id));
  }
}
