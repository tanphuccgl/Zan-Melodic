import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/modules/recently/logic/recently_bloc.dart';
import 'package:zanmelodic/src/widgets/base/base_screen.dart';
import 'package:zanmelodic/src/widgets/base/base_songs.dart';
import 'package:zanmelodic/src/widgets/text/header_title.dart';

class RecentlyPage extends StatelessWidget {
  const RecentlyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _padding = 20.0;

    return BlocBuilder<RecentlyBloc, RecentlyState>(builder: (context, state) {
      final XHandle<List<SongModel>> _handleNewSongs = state.newSongs;
      final List<SongModel> _newSongs = _handleNewSongs.data ?? [];

      final XHandle<List<SongModel>> _handleMostListen = state.mostListen;
      final List<SongModel> _mostlisten = _handleMostListen.data ?? [];

      return BaseScaffold<SongModel>(
        handle: _handleNewSongs,
        handle2: _handleMostListen,
        onRefresh: () async {
          context.read<RecentlyBloc>().getNewSongs();
          context.read<RecentlyBloc>().getMostListenSongs();
        },
        child: Padding(
          padding: const EdgeInsets.only(left: _padding, top: _padding),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              const HeaderTitle(title: 'New'),
              BaseSongs(songs: _newSongs),
              const HeaderTitle(title: 'Most Listen'),
              BaseSongs(songs: _mostlisten, childCount: _mostlisten.length),
            ],
          ),
        ),
      );
    });
  }
}
