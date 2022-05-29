import 'package:flutter/material.dart';
import 'package:zanmelodic/src/models/folder_model.dart';

import 'package:zanmelodic/src/widgets/card/browse_file_card.dart';
import 'package:zanmelodic/src/widgets/card/folder_card.dart';

class ListFolderWidget extends StatelessWidget {
  const ListFolderWidget({Key? key, required this.folders}) : super(key: key);
  final List<XFolder> folders;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: folders.map((e) => FolderCard(folder: e)).toList(),
          ),
          const BrowseFileCard()
        ],
      ),
    );
  }
}
