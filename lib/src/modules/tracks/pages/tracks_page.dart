import 'package:flutter/material.dart';
import 'package:zanmelodic/src/widgets/controll_bar.dart';
import 'package:zanmelodic/src/modules/tracks/widgets/list_tracks_widget.dart';

class TracksPage extends StatelessWidget {
  const TracksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
          ControllBar(),
          ListTracksWidget(),
        ]),
      ),
    );
  }
}
