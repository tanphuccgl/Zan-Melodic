import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/modules/discover/logic/discover_bloc.dart';
import 'package:zanmelodic/src/modules/discover/widgets/playlist_discover.dart';
import 'package:zanmelodic/src/modules/discover/widgets/singer_discover.dart';
import 'package:zanmelodic/src/modules/discover/widgets/song_discover.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: MyColors.colorPrimary,
        backgroundColor: MyColors.colorWhite,
        onRefresh: () async => context.read<DiscoverBloc>().getAllTracks(),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              _headerTitle('Singer'),
              const SingerDiscoverWidget(),
              _headerTitle('Playlist'),
              const PlaylistDiscoverWidget(),
              _headerTitle('Tracks'),
              const SongDiscoverWidget()
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerTitle(String title) {
    return SliverToBoxAdapter(
      child: Text(
        title,
        style: Style.textTheme().titleLarge,
      ),
    );
  }
}
