import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/modules/audio_control/logic/audio_handle_bloc.dart';
import 'package:zanmelodic/src/modules/upper_control/widgets/upper_control_bar.dart';
import 'package:zanmelodic/src/utils/utils.dart';
import 'package:zanmelodic/src/widgets/custom_appbar_sliver/custom_appbar_sliver.dart';

class AppBarAlbumDetail extends StatelessWidget {
  const AppBarAlbumDetail({
    Key? key,
    required this.album,
    required this.numberSongs,
    required this.songs,
  }) : super(key: key);
  final int numberSongs;
  final List<SongModel> songs;
  final AlbumModel album;

  @override
  Widget build(BuildContext context) {
    return CustomAppBarSliver(
      artworkType: ArtworkType.ALBUM,
      hExpanded: 360.0,
      hToolbar: 330.0,
      id: album.id,
      subTile: '${album.artist} | ${XUtils.formatNumberSong(album.numOfSongs)}',
      title: album.album,
      upperControlBar: UpperControlBar(
        onPressedPlay: () =>
            context.read<AudioHandleBloc>().skipToQueueItem(items: songs),
      ),
    );
  }
}
