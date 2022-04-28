import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/models/folder_model.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/models/result.dart';
import 'package:zanmelodic/src/modules/folder/logic/folder_bloc.dart';
import 'package:zanmelodic/src/modules/folder/router/folder_router.dart';
import 'package:zanmelodic/src/utils/utils.dart';
import 'package:zanmelodic/src/widgets/state/state_error_widget.dart';
import 'package:zanmelodic/src/widgets/state/state_loading_widget.dart';

class ListFolderWidget extends StatelessWidget {
  const ListFolderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FolderBloc, FolderState>(
      builder: (context, state) {
        XHandle<List<XFolder>> _handle = state.items;

        if (_handle.isCompleted) {
          _handle = XHandle.result(XResult.success(state.items.data ?? []));
          final List<XFolder> _items = _handle.data ?? [];

          return SliverToBoxAdapter(
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: _items.map((e) => _buildCard(context, e)).toList(),
                ),
                _cardBrowseFiles(context)
              ],
            ),
          );
        } else if (_handle.isLoading) {
          return const XStateLoadingWidget();
        } else {
          return const XStateErrorWidget();
        }
      },
    );
  }

  Widget _buildCard(BuildContext context, XFolder folder) {
    return GestureDetector(
      onTap: () => FolderCoordinator.showDetailFolderScreen(context, 'aa'),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.folder,
                color: Color(folder.color).withOpacity(1.0), size: 60),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: RichText(
                  text: TextSpan(
                      text: Utils.getNameFolderOfLink(folder.link) + '\n',
                      style: Style.textTheme().titleMedium,
                      children: [
                    TextSpan(
                      text: folder.date,
                      style: Style.textTheme()
                          .titleMedium!
                          .copyWith(fontSize: 17, color: MyColors.colorGray),
                    )
                  ])),
            ),
            Text(
              Utils.formatSize(folder.size),
              style: Style.textTheme().titleMedium!.copyWith(fontSize: 17),
            )
          ],
        ),
      ),
    );
  }

  Widget _cardBrowseFiles(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<FolderBloc>().addItem(),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.rule_folder, color: MyColors.colorWhite, size: 60),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                'Browse files...',
                style: Style.textTheme().titleMedium,
              ),
            )
          ],
        ),
      ),
    );
  }
}
