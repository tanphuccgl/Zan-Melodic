import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/constants/my_padding.dart';
import 'package:zanmelodic/src/modules/folder/logic/folder_bloc.dart';
import 'package:zanmelodic/src/modules/folder/widgets/list_folder_widget.dart';
import 'package:zanmelodic/src/modules/upper_control/widgets/upper_control_bar.dart';

class FolderPage extends StatelessWidget {
  const FolderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: MyPadding.pPage,
        child: CustomScrollView(
          slivers: [_upperControlBar(context), const ListFolderWidget()],
        ),
      ),
    );
  }

  Widget _upperControlBar(BuildContext context) {
    return BlocBuilder<FolderBloc, FolderState>(builder: (context, state) {
      return SliverToBoxAdapter(
        child: UpperControlBar(
            colorOfShuffleIcon: state.shuffleColorIcon,
            colorOfSortIcon: state.sortColorIcon,
            onPressedShuffle: () =>
                context.read<FolderBloc>().onShuffleToList(),
            onPressedSort: () => context.read<FolderBloc>().onSortNameToList()),
      );
    });
  }
}
