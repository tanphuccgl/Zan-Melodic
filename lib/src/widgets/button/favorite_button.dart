import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/modules/favorites/logic/favorites_bloc.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({Key? key, required this.song}) : super(key: key);
  final SongModel song;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () => state.isFavorites(song.id)
              ? context
                  .read<FavoritesBloc>()
                  .removeFromFavorites(context, idSong: song.id)
              : context.read<FavoritesBloc>().addToFavorites(song),
          icon: Icon(
            state.isFavorites(song.id) ? Icons.favorite : Icons.favorite_border,
            color: MyColors.colorWhite,
          ),
          iconSize: 25,
        );
      },
    );
  }
}
