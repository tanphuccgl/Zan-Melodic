import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/modules/album/album/logic/album_list_bloc.dart';
import 'package:zanmelodic/src/modules/album/album_detail/logic/album_detail_bloc.dart';
import 'package:zanmelodic/src/modules/play_music/logic/play_music_bloc.dart';
import 'package:zanmelodic/src/modules/songs/logic/song_list_bloc.dart';

class DashboardWrapperPage extends StatelessWidget {
  const DashboardWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SongListBloc()),
        BlocProvider(create: (_) => PlayMusicBloc()),
        BlocProvider(create: (_) => AlbumListBloc()),
        BlocProvider(create: (_) => AlbumDetailBloc()),
      ],
      child: WillPopScope(
          onWillPop: () async => false,
          child: const Scaffold(body: AutoRouter())),
    );
  }
}
