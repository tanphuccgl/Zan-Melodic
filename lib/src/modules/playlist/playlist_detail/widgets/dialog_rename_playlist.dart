import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/config/routes/coordinator.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/modules/playlist/playlist/logic/playlist_bloc.dart';
import 'package:zanmelodic/src/modules/playlist/playlist/widgets/custom_text_field.dart';
import 'package:zanmelodic/src/modules/playlist/playlist_detail/logic/playlist_detail_bloc.dart';

class DialogRenamePlaylist extends StatelessWidget {
  const DialogRenamePlaylist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaylistBloc, PlaylistState>(
      builder: (context, state) {
        return BlocBuilder<PlaylistDetailBloc, PlaylistDetailState>(
          builder: (context, playlistDetailState) {
            return AlertDialog(
              backgroundColor: MyColors.colorBlack,
              contentPadding: const EdgeInsets.all(16.0),
              content: CutomTextField(
                label: 'New Name',
                value: state.namePlaylist,
                error: state.isValidName,
                onChanged: (value) =>
                    context.read<PlaylistBloc>().changedName(value),
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
                    onPressed: () {},
                    child: Text('RENAME',
                        style: Style.textTheme().titleMedium!.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 17))),
              ],
            );
          },
        );
      },
    );
  }
}
