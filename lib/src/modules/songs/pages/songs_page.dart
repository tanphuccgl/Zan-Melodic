import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/modules/songs/logic/song_list_bloc.dart';
import 'package:zanmelodic/src/modules/songs/widgets/song_list_widget.dart';
import 'package:zanmelodic/src/widgets/custom_bar/control_bar.dart';

class SongPage extends StatelessWidget {
  const SongPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongListBloc, SongListState>(
      builder: (context, state) {
        final _items = state.items.data ?? [];
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  ControlBar(songList: _items),
                  const SongListWidget(),
                ]),
          ),
        );
      },
    );
  }
}
