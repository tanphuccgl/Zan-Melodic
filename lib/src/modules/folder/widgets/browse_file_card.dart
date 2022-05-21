import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/modules/folder/logic/folder_bloc.dart';

class BrowseFileCard extends StatelessWidget {
  const BrowseFileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => context.read<FolderBloc>().browseFiles(),
        child: Padding(
            padding: const EdgeInsets.all(4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.rule_folder,
                    color: MyColors.colorWhite, size: 60),
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
            )));
  }
}
