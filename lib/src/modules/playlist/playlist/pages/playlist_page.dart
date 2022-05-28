import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/constants/my_properties.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/modules/playlist/playlist/logic/playlist_bloc.dart';
import 'package:zanmelodic/src/modules/playlist/playlist/widgets/playlist_widget.dart';
import 'package:zanmelodic/src/modules/upper_control/widgets/upper_control_bar.dart';
import 'package:zanmelodic/src/widgets/base/base_screen.dart';

class PlaylistPage extends StatelessWidget {
  const PlaylistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaylistBloc, PlaylistState>(builder: (context, state) {
      final XHandle<List<PlaylistModel>> _handle = state.items;
      final List<PlaylistModel> _items = _handle.data ?? [];
      return BaseScaffold<PlaylistModel>(
        onRefresh: () async => context.read<PlaylistBloc>().fetchPlaylists(),
        handle: _handle,
        child: Padding(
          padding: MyProperties.pPage,
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: UpperControlBar(),
              ),
              PlaylistWidget(
                playlists: _items,
              ),
            ],
          ),
        ),
      );
    });
  }
}
