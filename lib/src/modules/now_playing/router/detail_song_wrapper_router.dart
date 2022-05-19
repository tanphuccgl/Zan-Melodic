import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/routes/auto_route.gr.dart';
import 'package:zanmelodic/src/models/enums/tab_index.dart';
import 'package:zanmelodic/src/modules/now_playing/info_song/pages/info_song_page.dart';
import 'package:zanmelodic/src/modules/now_playing/lyric/pages/lyric_page.dart';
import 'package:zanmelodic/src/modules/now_playing/pages/now_playing_page.dart';

class DetailSongWrapperPage extends StatefulWidget {
  const DetailSongWrapperPage({Key? key}) : super(key: key);

  @override
  State<DetailSongWrapperPage> createState() => _DetailSongWrapperPageState();
}

class _DetailSongWrapperPageState extends State<DetailSongWrapperPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [NowPlayingRoute(), InfoSongRoute(), LyricRoute()],
      builder: (context, child, animation) {
        return DefaultTabController(
          length: TabDetailSongIndex.values.length,
          child: Scaffold(
            body: TabBarView(
                controller:
                    TabController(length: 3, vsync: this, initialIndex: 0),
                children: const [
                  InfoSongPage(),
                  NowPlayingPage(),
                  LyricPage(),
                ]),
          ),
        );
      },
    );
  }
}
