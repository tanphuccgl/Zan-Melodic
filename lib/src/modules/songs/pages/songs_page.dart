import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/constants/my_padding.dart';
import 'package:zanmelodic/src/modules/songs/logic/song_list_bloc.dart';
import 'package:zanmelodic/src/modules/songs/widgets/song_list_widget.dart';
import 'package:zanmelodic/src/modules/upper_control/widgets/upper_control_bar.dart';

class SongPage extends StatelessWidget {
  const SongPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: MyPadding.pPage,
        child:
            CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
          _upperControlBar(context),
          const SongListWidget(),
        ]),
      ),
    );
  }

  Widget _upperControlBar(BuildContext context) {
    return BlocBuilder<SongListBloc, SongListState>(builder: (context, state) {
      return SliverToBoxAdapter(
        child: UpperControlBar(
            colorOfShuffleIcon: state.shuffleColorIcon,
            colorOfSortIcon: state.sortColorIcon,
            onPressedShuffle: () =>
                context.read<SongListBloc>().onShuffleToList(),
            onPressedSort: () =>
                context.read<SongListBloc>().onSortNameToList()),
      );
    });
  }
}
