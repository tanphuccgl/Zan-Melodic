import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/constants/my_properties.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/modules/audio_control/logic/audio_handle_bloc.dart';
import 'package:zanmelodic/src/modules/favorites/logic/favorites_bloc.dart';
import 'package:zanmelodic/src/modules/favorites/widgets/song_list_in_favorite.dart';
import 'package:zanmelodic/src/modules/upper_control/widgets/upper_control_bar.dart';
import 'package:zanmelodic/src/widgets/base/base_screen.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
      final XHandle<List<SongModel>> _handle = state.items;
      final List<SongModel> _items = _handle.data ?? [];

      return BaseScreen<SongModel>(
        handle: _handle,
        onRefresh: () =>
            context.read<FavoritesBloc>().fetchSongsFromFavorites(),
        child: Padding(
          padding: MyProperties.pPage,
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                  child: UpperControlBar(
                onPressedPlay: () => context
                    .read<AudioHandleBloc>()
                    .skipToQueueItem(items: _items),
              )),
              SongListFavoriteWidget(songs: _items),
            ],
          ),
        ),
      );
    });
  }
}
