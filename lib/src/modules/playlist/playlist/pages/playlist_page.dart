import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/constants/my_padding.dart';
import 'package:zanmelodic/src/modules/playlist/playlist/logic/playlist_bloc.dart';
import 'package:zanmelodic/src/modules/playlist/playlist/widgets/playlist_widget.dart';
import 'package:zanmelodic/src/modules/upper_control/widgets/upper_control_bar.dart';

class PlaylistPage extends StatelessWidget {
  const PlaylistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: MyPadding.pPage,
        child:
            CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
          _upperControlbar(context),
          const PlaylistWidget(),
        ]),
      ),
    );
  }

  Widget _upperControlbar(BuildContext context) {
    return BlocBuilder<PlaylistBloc, PlaylistState>(builder: (context, state) {
      return SliverToBoxAdapter(
        child: UpperControlBar(
          colorOfShuffleIcon: state.shuffleColorIcon,
          colorOfSortIcon: state.sortColorIcon,
          onPressedShuffle: () =>
              context.read<PlaylistBloc>().onShuffleToList(),
          onPressedSort: () => context.read<PlaylistBloc>().onSortNameToList(),
        ),
      );
    });
  }
}
