import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/modules/playlist/playlist/logic/playlist_bloc.dart';
import 'package:zanmelodic/src/modules/playlist/playlist/widgets/playlist_widget.dart';
import 'package:zanmelodic/src/widgets/custom_bar/upper_control_bar.dart';

class PlaylistPage extends StatelessWidget {
  const PlaylistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaylistBloc, PlaylistState>(
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: UpperControlBar(
                      iconShuffle: state.shuffleIcon,
                      iconSort: state.sortIcon,
                      onPressedShuffle: () =>
                          context.read<PlaylistBloc>().onShuffleToList(),
                      onPressedSort: () =>
                          context.read<PlaylistBloc>().onSortNameToList(),
                    ),
                  ),
                  const PlaylistWidget(),
                ]),
          ),
        );
      },
    );
  }
}
