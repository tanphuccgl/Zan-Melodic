import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/modules/favorites/logic/favorites_bloc.dart';
import 'package:zanmelodic/src/widgets/custom_dialog/custom_dialog.dart';

class DialogRemoveFromFavorites extends StatelessWidget {
  const DialogRemoveFromFavorites({Key? key, required this.song})
      : super(key: key);
  final SongModel song;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      body: RichText(
        text: TextSpan(
            text: 'Do you want to unfavorite the ',
            style: Style.textTheme()
                .titleMedium!
                .copyWith(fontSize: 17, color: MyColors.colorPrimary),
            children: [
              TextSpan(
                text: song.title,
                style: Style.textTheme()
                    .titleMedium!
                    .copyWith(color: MyColors.colorPrimary),
              ),
              const TextSpan(
                text: ' song ?',
              ),
            ]),
      ),
      onPressed: () => context
          .read<FavoritesBloc>()
          .removeFromFavorites(context, idSong: song.id),
      textAccept: 'REMOVE',
    );
  }
}
