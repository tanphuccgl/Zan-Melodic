import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/modules/folder/logic/folder_bloc.dart';
import 'package:zanmelodic/src/modules/folder/widgets/list_folder_widget.dart';
import 'package:zanmelodic/src/widgets/custom_bar/control_bar.dart';

class FolderPage extends StatelessWidget {
  const FolderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FolderBloc(),
    
      child: const Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: CustomScrollView(
            slivers: [ControlBar(), ListFolderWidget()],
          ),
        ),
      ),
    );
  }
}
