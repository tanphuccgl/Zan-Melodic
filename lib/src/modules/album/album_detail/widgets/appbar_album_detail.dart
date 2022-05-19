import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/modules/album/album_detail/logic/album_detail_bloc.dart';
import 'package:zanmelodic/src/modules/audio_control/logic/audio_handle_bloc.dart';
import 'package:zanmelodic/src/modules/upper_control/widgets/upper_control_bar.dart';
import 'package:zanmelodic/src/utils/utils.dart';
import 'package:zanmelodic/src/widgets/custom_appbar_sliver/custom_appbar_sliver.dart';

class AppBarAlbumDetail extends StatelessWidget {
  const AppBarAlbumDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlbumDetailBloc, AlbumDetailState>(
        builder: (context, state) {
      return BlocBuilder<AudioHandleBloc, AudioHandleState>(
        builder: (context, audioState) {
          final _items = state.items.data ?? [];
          final _album = state.album;
          return CustomAppBarSliver(
            artworkType: ArtworkType.ALBUM,
            hExpanded: 360.0,
            hToolbar: 330.0,
            id: _album.id,
            subTile:
                '${_album.artist} | ${XUtils.formatNumberSong(_album.numOfSongs)}',
            title: _album.album,
            upperControlBar: UpperControlBar(
              onPressedPlay: () => context
                  .read<AudioHandleBloc>()
                  .skipToQueueItem(items: _items),
            ),
          );
        },
      );
    });
  }
}
