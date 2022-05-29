import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/constants/my_properties.dart';
import 'package:zanmelodic/src/models/folder_model.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/modules/dashboard/logic/access_permission.dart';
import 'package:zanmelodic/src/modules/folder/logic/folder_bloc.dart';
import 'package:zanmelodic/src/modules/folder/widgets/list_folder_widget.dart';
import 'package:zanmelodic/src/modules/upper_control/widgets/upper_control_bar.dart';
import 'package:zanmelodic/src/widgets/base/base_screen.dart';

class FolderPage extends StatelessWidget {
  const FolderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FolderBloc, FolderState>(builder: (context, state) {
      final XHandle<List<XFolder>> _handle = state.items;
      final List<XFolder> _items = _handle.data ?? [];
      return BaseScaffold(
        handle: _handle,
        onRefresh: () async => context.read<FolderBloc>().fetchListFolder(),
        child: Padding(
          padding: MyProperties.pPage,
          child: AccessPermission(
            widget: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(child: UpperControlBar()),
                ListFolderWidget(folders: _items),
              ],
            ),
          ),
        ),
      );
    });
  }
}
