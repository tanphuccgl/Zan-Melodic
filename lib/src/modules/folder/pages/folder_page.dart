import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/constants/my_properties.dart';
import 'package:zanmelodic/src/modules/folder/logic/folder_bloc.dart';
import 'package:zanmelodic/src/modules/folder/widgets/list_folder_widget.dart';
import 'package:zanmelodic/src/modules/upper_control/widgets/upper_control_bar.dart';

class FolderPage extends StatelessWidget {
  const FolderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: MyColors.colorPrimary,
        backgroundColor: MyColors.colorWhite,
        onRefresh: () async => context.read<FolderBloc>().fetchListFolder(),
        child: const Padding(
          padding: MyProperties.pPage,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: UpperControlBar()),
              ListFolderWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
