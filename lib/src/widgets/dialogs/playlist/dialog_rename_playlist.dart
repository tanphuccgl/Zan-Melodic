import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/modules/playlist/playlist/logic/playlist_bloc.dart';
import 'package:zanmelodic/src/widgets/base/base_dialog.dart';
import 'package:zanmelodic/src/widgets/text/custom_text_field.dart';

class DialogRenamePlaylist extends StatelessWidget {
  const DialogRenamePlaylist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaylistBloc, PlaylistState>(
      builder: (context, state) {
        return BaseDialog(
            body: CutomTextField(
              label: 'New Name',
              value: state.namePlaylist,
              error: state.isValidName,
              onChanged: (value) =>
                  context.read<PlaylistBloc>().changedName(value),
            ),
            textAccept: 'RENAME',
            onPressed: () {});
      },
    );
  }
}
