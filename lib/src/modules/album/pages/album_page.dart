import 'package:flutter/material.dart';
import 'package:zanmelodic/src/modules/album/widgets/list_album_widget.dart';
import 'package:zanmelodic/src/widgets/controll_bar.dart';

class AlbumPage extends StatelessWidget {
  const AlbumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [ControllBar(), ListAlbumWidget()]),
    );
  }
}
