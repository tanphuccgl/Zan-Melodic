import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/models/folder_model.dart';
import 'package:zanmelodic/src/modules/folder/logic/folder_bloc.dart';
import 'package:zanmelodic/src/utils/utils.dart';

class FolderCard extends StatelessWidget {
  const FolderCard({Key? key, required this.folder}) : super(key: key);
  final XFolder folder;

  @override
  Widget build(BuildContext context) {
    int bytes = 0;
    for (var item in folder.songs) {
      bytes = bytes + item.size;
    }
    return GestureDetector(
      onTap: () => context.read<FolderBloc>().pickFolder(),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.folder, color: Colors.amber, size: 60),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: RichText(
                  text: TextSpan(
                      text: XUtils.getNameFolderOfLink(folder.name) + '\n',
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
              XUtils.formatBytes(bytes),
              style: Style.textTheme().titleMedium!.copyWith(fontSize: 17),
            )
          ],
        ),
      ),
    );
  }
}
