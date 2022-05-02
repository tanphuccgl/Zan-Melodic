import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/modules/album/album/logic/album_bloc.dart';
import 'package:zanmelodic/src/modules/album/album_detail/logic/album_detail_bloc.dart';
import 'package:zanmelodic/src/modules/play_music/logic/play_music_bloc.dart';
import 'package:zanmelodic/src/modules/songs/logic/song_list_bloc.dart';
import 'package:zanmelodic/src/repositories/audio_query.dart';

class DashboardWrapperPage extends StatefulWidget {
  const DashboardWrapperPage({Key? key}) : super(key: key);

  @override
  State<DashboardWrapperPage> createState() => _DashboardWrapperPageState();
}

class _DashboardWrapperPageState extends State<DashboardWrapperPage> {
  @override
  void initState() {
    super.initState();
    XAudioQuery.permissionsRequest();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SongListBloc()),
        BlocProvider(create: (_) => PlayMusicBloc()),
        BlocProvider(create: (_) => AlbumBloc()),
        BlocProvider(create: (_) => AlbumDetailBloc()),
      ],
      child: WillPopScope(
          onWillPop: () async => false,
          child: const Scaffold(body: AutoRouter())),
    );
  }
}
