import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/modules/playlist/router/playlist_router.dart';

class EmptyTextButton extends StatelessWidget {
  const EmptyTextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: TextButton(
            onPressed: () =>
                PlaylistCoordinator.showDialogCreatePlaylist(context),
            child: Text(
              'Click here to create a new playlist',
              textAlign: TextAlign.center,
              style: Style.textTheme()
                  .titleMedium!
                  .copyWith(color: MyColors.colorWhite.withOpacity(0.5)),
            )),
      ),
    );
  }
}
