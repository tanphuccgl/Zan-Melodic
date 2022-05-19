import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/modules/audio_control/logic/audio_handle_bloc.dart';
import 'package:zanmelodic/src/modules/playlist/playlist_detail/logic/playlist_detail_bloc.dart';
import 'package:zanmelodic/src/modules/songs/logic/song_list_bloc.dart';
import 'package:zanmelodic/src/modules/upper_control/widgets/upper_control_bar.dart';
import 'package:zanmelodic/src/utils/utils.dart';
import 'package:zanmelodic/src/widgets/custom_appbar_sliver/custom_appbar_sliver.dart';

class AppBarPlaylistDetail extends StatelessWidget {
  const AppBarPlaylistDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaylistDetailBloc, PlaylistDetailState>(
        builder: (context, playlistState) {
      return BlocBuilder<SongListBloc, SongListState>(
          builder: (context, songState) {
        return BlocBuilder<AudioHandleBloc, AudioHandleState>(
          builder: (context, state) {
            List<SongModel> _items = playlistState.items.data ?? [];
            List<SongModel> songs = songState.songs.data ?? [];
            List<SongModel> a = [];
            for (var item in _items) {
              for (var item1 in songs) {
                if (item.title == item1.title) {
                  a.add(item1);
                }
              }
            }

            final _playlist = playlistState.playlist;
            return CustomAppBarSliver(
              artworkType: ArtworkType.PLAYLIST,
              hExpanded: 360.0,
              hToolbar: 330.0,
              id: _playlist.id,
              subTile:
                  'By: ${_playlist.dateAdded} | ${XUtils.formatNumberSong(playlistState.numberSongs)}',
              title: _playlist.playlist,
              upperControlBar: UpperControlBar(
                onPressed: () => context
                    .read<AudioHandleBloc>()
                    .skipToQueueItem(items: _items),
              ),
            );
          },
        );
      });
    });
  }
}
