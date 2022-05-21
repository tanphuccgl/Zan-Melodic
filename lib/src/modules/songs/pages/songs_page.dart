import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/constants/my_properties.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/modules/songs/logic/song_list_bloc.dart';
import 'package:zanmelodic/src/modules/songs/widgets/song_list_widget.dart';
import 'package:zanmelodic/src/modules/upper_control/widgets/upper_control_bar.dart';
import 'package:zanmelodic/src/widgets/base/base_screen.dart';

class SongPage extends StatelessWidget {
  const SongPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongListBloc, SongListState>(builder: (context, state) {
      final XHandle<List<SongModel>> _handle = state.items;
      final List<SongModel> songs = _handle.data ?? [];

      return BaseScaffold(
        handle: _handle,
        onRefresh: () => context.read<SongListBloc>().fetchListOfSongs(),
        child: Padding(
          padding: MyProperties.pPage,
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              const SliverToBoxAdapter(child: UpperControlBar()),
              SongListWidget(songs: songs),
            ],
          ),
        ),
      );
    });
  }
}
