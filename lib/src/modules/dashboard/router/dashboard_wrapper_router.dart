import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/modules/album/album/logic/album_bloc.dart';
import 'package:zanmelodic/src/modules/album/album_detail/logic/album_detail_bloc.dart';
import 'package:zanmelodic/src/modules/folder/logic/folder_bloc.dart';
import 'package:zanmelodic/src/modules/songs/logic/songs_bloc.dart';
import 'package:zanmelodic/src/repositories/audio_query/base_audio_query.dart';

class DashboardWrapperPage extends StatefulWidget {
  const DashboardWrapperPage({Key? key}) : super(key: key);

  @override
  State<DashboardWrapperPage> createState() => _DashboardWrapperPageState();
}

class _DashboardWrapperPageState extends State<DashboardWrapperPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SongsBloc()),
        BlocProvider(create: (_) => AlbumBloc()),
        BlocProvider(create: (_) => AlbumDetailBloc()),
        BlocProvider(create: (_) => FolderBloc()),
      ],
      child: WillPopScope(
          onWillPop: () async => false,
          child: const Scaffold(body: AutoRouter())),
    );
  }

  @override
  void initState() {
    super.initState();
    BaseAudioQuery().permissionsRequest();
  }
}
