import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';

class ListFolderWidget extends StatelessWidget {
  const ListFolderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          _buildCard(
              icon: Icons.folder,
              date: '20/12/2021',
              name: 'Cloud',
              capacity: 2),
          _buildCard(
              icon: Icons.folder_delete,
              date: '5/11/2021',
              name: 'Downloads',
              capacity: 1.4),
          _buildCard(
              icon: Icons.folder_shared,
              date: '5/11/2021',
              name: 'My Music',
              capacity: 1),
          _buildCard(
              icon: Icons.folder_special_sharp,
              date: '5/3/2021',
              name: 'My Collection',
              capacity: 1.5),
          _buildCard(icon: Icons.rule_folder, name: 'Browse files...')
        ],
      ),
    );
  }

  Widget _buildCard(
      {required IconData icon,
      String? date,
      required String name,
      double? capacity}) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: MyColors.colorWhite, size: 60),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: RichText(
                text: TextSpan(
                    text: '$name\n',
                    style: Style.textTheme().titleMedium,
                    children: [
                  TextSpan(
                    text: date,
                    style: Style.textTheme()
                        .titleMedium!
                        .copyWith(fontSize: 17, color: MyColors.colorGray),
                  )
                ])),
          ),
          capacity != null
              ? Text(
                  '${capacity}GB',
                  style: Style.textTheme().titleMedium!.copyWith(fontSize: 17),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
