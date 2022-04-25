import 'package:flutter/material.dart';
import 'package:zanmelodic/src/modules/playlist/widgets/playlist_widget.dart';
import 'package:zanmelodic/src/widgets/controll_bar.dart';

class PlaylistPage extends StatelessWidget {
  const PlaylistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [ControllBar(), PlaylistWidget()]),
    );
  }
}
