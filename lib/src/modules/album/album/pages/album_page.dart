import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/constants/my_padding.dart';
import 'package:zanmelodic/src/modules/album/album/logic/album_bloc.dart';
import 'package:zanmelodic/src/modules/album/album/widgets/list_album_widget.dart';
import 'package:zanmelodic/src/modules/upper_control/widgets/upper_control_bar.dart';

class AlbumPage extends StatelessWidget {
  const AlbumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlbumBloc, AlbumState>(
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: MyPadding.pPage,
            child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  _upperControlBar(context),
                  const ListAlbumWidget(),
                ]),
          ),
        );
      },
    );
  }

  Widget _upperControlBar(BuildContext context) {
    return BlocBuilder<AlbumBloc, AlbumState>(builder: (context, state) {
      return SliverToBoxAdapter(
        child: UpperControlBar(
          colorOfShuffleIcon: state.shuffleColorIcon,
          colorOfSortIcon: state.sortColorIcon,
          onPressedShuffle: () => context.read<AlbumBloc>().onShuffleToList(),
          onPressedSort: () => context.read<AlbumBloc>().onSortNameToList(),
        ),
      );
    });
  }
}
