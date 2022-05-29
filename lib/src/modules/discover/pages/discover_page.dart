import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/models/audio_model.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/modules/discover/logic/discover_bloc.dart';
import 'package:zanmelodic/src/modules/discover/widgets/playlist_discover.dart';
import 'package:zanmelodic/src/modules/discover/widgets/singer_discover.dart';
import 'package:zanmelodic/src/modules/discover/widgets/song_discover.dart';
import 'package:zanmelodic/src/widgets/base/base_screen.dart';
import 'package:zanmelodic/src/widgets/text/header_title.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverBloc, DiscoverState>(builder: (context, state) {
      final XHandle<List<XAudio>> _handle = state.items;
      final List<XAudio> _items = _handle.data ?? [];

      return BaseScaffold<XAudio>(
        handle: _handle,
        onRefresh: () async => context.read<DiscoverBloc>().getAllTracks(),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 20.0),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              const HeaderTitle(title: 'Singer'),
              SingerDiscoverWidget(audios: _items),
              const HeaderTitle(title: 'Playlist'),
              PlaylistDiscoverWidget(audios: _items),
              const HeaderTitle(title: 'Tracks'),
              SongDiscoverWidget(
                audios: _items,
              )
            ],
          ),
        ),
      );
    });
  }
}
