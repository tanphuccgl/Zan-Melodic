import 'package:audio_service/audio_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/config/routes/auto_route.gr.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/modules/album/album/pages/album_page.dart';
import 'package:zanmelodic/src/modules/audio_control/pages/player_bottom_bar.dart';
import 'package:zanmelodic/src/modules/discover/pages/discover_page.dart';
import 'package:zanmelodic/src/modules/favorites/pages/favorites_page.dart';
import 'package:zanmelodic/src/modules/folder/pages/folder_page.dart';
import 'package:zanmelodic/src/modules/playlist/playlist/pages/playlist_page.dart';
import 'package:zanmelodic/src/modules/songs/logic/song_list_bloc.dart';
import 'package:zanmelodic/src/modules/songs/pages/songs_page.dart';
import 'package:zanmelodic/src/utils/enums/tab_index.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
        routes: const [
          DiscoverTab(),
          FavoritesTab(),
          SongTab(),
          PlaylistTab(),
          AlbumTab(),
          FolderTab(),
        ],
        builder: (context, child, animation) {
          final _tabsRouter = AutoTabsRouter.of(context);
          return BlocBuilder<SongListBloc, SongListState>(
            builder: (context, state) {
              return DefaultTabController(
                length: TabIndex.values.length,
                child: Scaffold(
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerFloat,
                  floatingActionButton: const PlayerBottomBar(),
                  appBar: AppBar(
                      elevation: 0,
                      toolbarHeight: 20,
                      backgroundColor: MyColors.colorBlack,
                      bottom: TabBar(
                          indicatorColor: Colors.transparent,
                          isScrollable: true,
                          labelStyle: Style.textTheme().labelMedium,
                          unselectedLabelStyle: Style.textTheme()
                              .labelMedium!
                              .copyWith(fontSize: 21),
                          onTap: (index) {
                            if (index == _tabsRouter.activeIndex) {
                              _tabsRouter
                                  .stackRouterOfIndex(index)
                                  ?.popUntilRoot();
                            } else {
                              _tabsRouter.setActiveIndex(index);
                            }
                            if (index == 1) {
                              context
                                  .read<SongListBloc>()
                                  .fetchMediaItems(context);
                            }
                          },
                          tabs: <Tab>[
                            for (final item in TabIndex.values)
                              Tab(text: item.lableOf()),
                          ])),
                  body: const TabBarView(children: [
                    DiscoverPage(),
                    FavoritesPage(),
                    SongPage(),
                    PlaylistPage(),
                    AlbumPage(),
                    FolderPage(),
                  ]),
                ),
              );
            },
          );
        });
  }
}

MediaItem converSongToModel(SongModel song) {
  final result = MediaItem(
    id: song.id.toString(),
    album: song.album,
    title: song.title,
    artUri: Uri.parse(song.uri ?? ''),
    genre: song.genre,
    duration: Duration(microseconds: song.duration ?? -1),
    artist: song.artist,
    extras: {'data': song.data},
  );
  return result;
}
