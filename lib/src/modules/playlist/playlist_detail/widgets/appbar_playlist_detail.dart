import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/modules/playlist/playlist_detail/logic/playlist_detail_bloc.dart';
import 'package:zanmelodic/src/modules/upper_control/widgets/upper_control_bar.dart';
import 'package:zanmelodic/src/utils/utils.dart';
import 'package:zanmelodic/src/widgets/custom_appbar_sliver/custom_appbar_sliver.dart';

class AppBarPlaylistDetail extends StatelessWidget {
  const AppBarPlaylistDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaylistDetailBloc, PlaylistDetailState>(
      builder: (context, state) {
        final _playlist = state.playlist;
        return CustomAppBarSliver(
          artworkType: ArtworkType.PLAYLIST,
          hExpanded: 360.0,
          hToolbar: 330.0,
          id: _playlist.id,
          subTile:
              'By: ${_playlist.dateAdded} | ${XUtils.formatNumberSong(state.numberSongs)}',
          title: _playlist.playlist,
          upperControlBar: const UpperControlBar(),
        );
      },
    );
  }
}
