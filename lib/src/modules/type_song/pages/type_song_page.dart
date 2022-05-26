import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/modules/type_song/logic/type_song_bloc.dart';
import 'package:zanmelodic/src/widgets/base/base_screen.dart';
import 'package:zanmelodic/src/widgets/base/base_songs.dart';

class TypeSongPage extends StatelessWidget {
  const TypeSongPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TypeSongBloc, TypeSongState>(builder: (context, state) {
      final XHandle<List<SongModel>> _handleNewList = state.newList;
      final List<SongModel> _newList = _handleNewList.data ?? [];

      final XHandle<List<SongModel>> _handleMoreListenList =
          state.mostListenList;
      final List<SongModel> _moreListenList = _handleMoreListenList.data ?? [];

      return BaseScaffold<SongModel>(
        handle: _handleNewList,
        handle2: _handleMoreListenList,
        onRefresh: () async {
          context.read<TypeSongBloc>().getNewSongs();
          context.read<TypeSongBloc>().getMostListenSongs();
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 20.0),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              _headerTitle('New'),
              BaseSongs(songs: _newList),
              _headerTitle('Most Listen'),
              BaseSongs(
                  songs: _moreListenList,
                  childCount:
                      _moreListenList.length < 3 ? _moreListenList.length : 3),
            ],
          ),
        ),
      );
    });
  }

  Widget _headerTitle(String title) {
    return SliverToBoxAdapter(
      child: Text(
        title,
        style: Style.textTheme().titleLarge,
      ),
    );
  }
}
