import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/modules/play_music/logic/play_music_bloc.dart';
import 'package:zanmelodic/src/modules/tracks/logic/tracks_bloc.dart';

class DashboardWrapperPage extends StatelessWidget {
  const DashboardWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TracksBloc()),
        BlocProvider(
            create: (_) => PlayMusicBloc(PlayMusicState(
                tracks: SongModel({}), audioPlayer: AudioPlayer()))),
      ],
      child: WillPopScope(
          onWillPop: () async => false,
          child: const Scaffold(body: AutoRouter())),
    );
  }
}
