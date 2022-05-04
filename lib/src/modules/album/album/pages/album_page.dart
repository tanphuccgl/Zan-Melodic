import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/modules/album/album/logic/album_bloc.dart';
import 'package:zanmelodic/src/modules/album/album/widgets/list_album_widget.dart';
import 'package:zanmelodic/src/widgets/custom_bar/upper_control_bar.dart';

class AlbumPage extends StatelessWidget {
  const AlbumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlbumBloc, AlbumState>(
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: UpperControlBar(
                      colorIconShuffle: state.shuffleColorIcon,
                      colorIconSort: state.sortColorIcon,
                      onPressedShuffle: () =>
                          context.read<AlbumBloc>().onShuffleToList(),
                      onPressedSort: () =>
                          context.read<AlbumBloc>().onSortNameToList(),
                    ),
                  ),
                  const ListAlbumWidget(),
                ]),
          ),
        );
      },
    );
  }
}
