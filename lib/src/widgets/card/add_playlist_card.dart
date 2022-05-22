import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/constants/my_properties.dart';
import 'package:zanmelodic/src/modules/playlist/router/playlist_router.dart';

class AddPlaylistCard extends StatelessWidget {
  const AddPlaylistCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => PlaylistCoordinator.showDialogCreatePlaylist(context),
        child: Padding(
            padding: const EdgeInsets.all(3.5),
            child: Container(
                width: 178.0,
                decoration: BoxDecoration(
                  borderRadius: MyProperties.borderRadius,
                  color: MyColors.colorWhite,
                ),
                height: 162.0,
                child: const Icon(
                  Icons.add,
                  color: MyColors.colorPrimary,
                  size: 60,
                ))));
  }
}
