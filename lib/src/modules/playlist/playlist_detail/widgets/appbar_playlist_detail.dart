import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/modules/audio_control/logic/audio_handle_bloc.dart';
import 'package:zanmelodic/src/modules/upper_control/widgets/upper_control_bar.dart';
import 'package:zanmelodic/src/utils/utils.dart';
import 'package:zanmelodic/src/widgets/custom_appbar_sliver/custom_appbar_sliver.dart';

class AppBarPlaylistDetail extends StatelessWidget {
  const AppBarPlaylistDetail({
    Key? key,
    required this.songs,
    required this.playlist,
    required this.numberSongs,
  }) : super(key: key);
  final List<SongModel> songs;
  final PlaylistModel playlist;
  final int numberSongs;

  @override
  Widget build(BuildContext context) {
    return CustomAppBarSliver(
      artworkType: ArtworkType.PLAYLIST,
      hExpanded: 360.0,
      hToolbar: 330.0,
      id: playlist.id,
      subTile:
          'By: ${playlist.dateAdded} | ${XUtils.formatNumberSong(numberSongs)}',
      title: playlist.playlist,
      upperControlBar: UpperControlBar(
        onPressedPlay: () =>
            context.read<AudioHandleBloc>().skipToQueueItem(items: songs),
      ),
    );
  }
}
