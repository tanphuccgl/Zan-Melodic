import 'package:flutter/material.dart';
import 'package:zanmelodic/src/constants/my_padding.dart';
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
          slivers: [
            SliverToBoxAdapter(
                child: UpperControlBar(
              onPressedShuffle: () {},
              onPressedSort: () {},
            )),
            const ListFolderWidget()
          ],
        ),
      ),
    );
  }
}
