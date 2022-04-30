import 'package:flutter/material.dart';
import 'package:zanmelodic/src/modules/album/widgets/list_album_widget.dart';
import 'package:zanmelodic/src/widgets/custom_bar/control_bar.dart';

class AlbumPage extends StatelessWidget {
  const AlbumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
          ControlBar(songList: []),
          ListAlbumWidget(),
        ]),
      ),
    );
  }
}
