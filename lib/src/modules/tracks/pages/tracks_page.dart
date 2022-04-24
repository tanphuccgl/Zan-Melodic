import 'package:flutter/material.dart';
import 'package:zanmelodic/src/widgets/controll_bar.dart';
import 'package:zanmelodic/src/modules/tracks/widgets/list_tracks_widget.dart';

class TracksPage extends StatelessWidget {
  const TracksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
        ControllBar(),
        ListTracksWidget(),
      ]),
    );
  }
}
