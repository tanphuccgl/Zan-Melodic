import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:zanmelodic/src/config/routes/auto_route.gr.dart';
import 'package:zanmelodic/src/repositories/audio_query/base_audio_query.dart';

import 'src/app.dart';
import 'src/repositories/audio_query/favorite_audio_room.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BaseAudioQuery().audioQuery;
  FavoriteAudioRoom().init();
  GetIt.I.registerLazySingleton(() => XRouter());
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    //  blocObserver: XBlocObserver()
  );
}
