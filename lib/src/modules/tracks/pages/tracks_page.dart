import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/modules/tracks/logic/tracks_bloc.dart';
import 'package:zanmelodic/src/modules/tracks/widgets/list_tracks_widget.dart';
import 'package:zanmelodic/src/widgets/controll_bar.dart';

class TracksPage extends StatelessWidget {
  const TracksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TracksBloc, TracksState>(
      builder: (context, state) {
        final _items = state.items.data ?? [];
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  ControllBar(listTracks: _items),
                  const ListTracksWidget(),
                ]),
          ),
        );
      },
    );
  }
}
