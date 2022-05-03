import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_room/details/rooms/favorites/favorites_entity.dart';
import 'package:zanmelodic/src/config/routes/coordinator.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/modules/favorites/logic/favorites_bloc.dart';

class DialogRemoveFromFavorites extends StatelessWidget {
  const DialogRemoveFromFavorites({Key? key, required this.favoritesEntity})
      : super(key: key);
  final FavoritesEntity favoritesEntity;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: MyColors.colorBlack,
      contentPadding: const EdgeInsets.all(16.0),
      content: RichText(
        text: TextSpan(
            text: 'Do you want to unfavorite the ',
            style: Style.textTheme().titleMedium!.copyWith(fontSize: 17),
            children: [
              TextSpan(
                text: favoritesEntity.title,
                style: Style.textTheme()
                    .titleMedium!
                    .copyWith(color: MyColors.colorPrimary),
              ),
              const TextSpan(
                text: ' song ?',
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
                .read<FavoritesBloc>()
                .removeFromFavorites(context, favoritesEntity: favoritesEntity),
            child: Text('REMOVE',
                style: Style.textTheme()
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w600, fontSize: 17))),
      ],
    );
  }
}
