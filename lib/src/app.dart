import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:zanmelodic/src/config/routes/auto_route.gr.dart';
import 'package:zanmelodic/src/config/themes/themes.dart';
import 'package:zanmelodic/src/localization/localization_util.dart';
import 'package:zanmelodic/src/modules/album/album/logic/album_bloc.dart';
import 'package:zanmelodic/src/modules/album/album_detail/logic/album_detail_bloc.dart';
import 'package:zanmelodic/src/modules/artist/artist/logic/artist_bloc.dart';
import 'package:zanmelodic/src/modules/audio_control/logic/audio_handle_bloc.dart';
import 'package:zanmelodic/src/modules/discover/logic/discover_bloc.dart';
import 'package:zanmelodic/src/modules/favorites/logic/favorites_bloc.dart';
import 'package:zanmelodic/src/modules/folder/logic/folder_bloc.dart';
import 'package:zanmelodic/src/modules/playlist/playlist/logic/playlist_bloc.dart';
import 'package:zanmelodic/src/modules/playlist/playlist_detail/logic/playlist_detail_bloc.dart';
import 'package:zanmelodic/src/modules/songs/logic/songs_bloc.dart';
import 'package:zanmelodic/src/modules/type_song/logic/type_song_bloc.dart';
import 'package:zanmelodic/src/modules/upper_control/logic/upper_control_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appRouter = GetIt.I<XRouter>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AudioHandleBloc()),
        BlocProvider(
            create: (_) => UpperControlBloc(const UpperControlState())),
        BlocProvider(create: (_) => SongsBloc()),
        BlocProvider(create: (_) => AlbumBloc()),
        BlocProvider(create: (_) => AlbumDetailBloc()),
        BlocProvider(create: (_) => FolderBloc()),
        BlocProvider(create: (_) => DiscoverBloc()),
        BlocProvider(create: (_) => PlaylistBloc()),
        BlocProvider(create: (_) => PlaylistDetailBloc()),
        BlocProvider(create: (_) => FavoritesBloc()),
        BlocProvider(create: (_) => TypeSongBloc()),
        BlocProvider(create: (_) => ArtistBloc()),
      ],
      child: MaterialApp.router(
        theme: XTheme.light(),
        builder: BotToastInit(),
        debugShowCheckedModeBanner: false,
        darkTheme: XTheme.dark(),
        themeMode: ThemeMode.light,
        title: 'Zan Melodic',
        restorationScopeId: 'Zan Melodic',
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
        ],
        onGenerateTitle: (BuildContext context) => S.of(context).appTitle,
        routeInformationParser: appRouter.defaultRouteParser(
          includePrefixMatches: true,
        ),
        routerDelegate: AutoRouterDelegate(appRouter),
      ),
    );
  }
}
