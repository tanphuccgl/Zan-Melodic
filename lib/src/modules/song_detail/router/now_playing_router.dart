import 'package:auto_route/auto_route.dart';
import 'package:zanmelodic/src/modules/song_detail/info_song/pages/info_song_page.dart';
import 'package:zanmelodic/src/modules/song_detail/lyric/pages/lyric_page.dart';
import 'package:zanmelodic/src/modules/song_detail/now_playing/page/now_playing_page.dart';
import 'package:zanmelodic/src/modules/song_detail/router/detail_song_wrapper_router.dart';

class DetailSongTaps {
  static const String infoTab = 'info';
  static const String nowPlayingTab = 'now_playing';
  static const String lyricTab = 'lyric';
}

class DetailSongCoordinator {
  static const autoRoute = AutoRoute(
      path: DetailSongTaps.nowPlayingTab,
      page: DetailSongWrapperPage,
      name: 'DetailSongWrapperRoute',
      children: [
        AutoRoute(
          initial: true,
          page: NowPlayingPage,
          name: "NowPlayingRoute",
        ),
        AutoRoute(
            path: DetailSongTaps.infoTab,
            page: InfoSongPage,
            name: "InfoSongRoute"),
        AutoRoute(
            path: DetailSongTaps.lyricTab, page: LyricPage, name: "LyricRoute"),
        RedirectRoute(path: '*', redirectTo: ''),
      ]);
}
