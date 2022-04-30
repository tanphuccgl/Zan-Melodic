import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/config/routes/auto_route.gr.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/modules/album/album/pages/album_page.dart';
import 'package:zanmelodic/src/modules/favorites/pages/favorites_page.dart';
import 'package:zanmelodic/src/modules/folder/pages/folder_page.dart';
import 'package:zanmelodic/src/modules/play_music/logic/play_music_bloc.dart';
import 'package:zanmelodic/src/modules/play_music/pages/player_bottom_bar.dart';
import 'package:zanmelodic/src/modules/playlist/pages/playlist_page.dart';
import 'package:zanmelodic/src/modules/songs/pages/songs_page.dart';
import 'package:zanmelodic/src/utils/enums/tab_index.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        FavoritesTab(),
        SongTab(),
        PlaylistTab(),
        AlbumTab(),
        FolderTab(),
      ],
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
      
            return DefaultTabController(
              length: TabIndex.values.length,
              child: Scaffold(
                bottomNavigationBar:const  PlayerBottomBar()
                  ,
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
                          if (index == tabsRouter.activeIndex) {
                            tabsRouter
                                .stackRouterOfIndex(index)
                                ?.popUntilRoot();
                          } else {
                            tabsRouter.setActiveIndex(index);
                          }
                        },
                        tabs: <Tab>[
                          for (final item in TabIndex.values)
                            Tab(text: item.lableOf()),
                        ])),
                body: const TabBarView(children: [
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
     
  }
}
