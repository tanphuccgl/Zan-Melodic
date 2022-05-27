import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/modules/audio_control/logic/audio_handle_bloc.dart';
import 'package:zanmelodic/src/modules/upper_control/widgets/upper_control_bar.dart';
import 'package:zanmelodic/src/utils/utils.dart';
import 'package:zanmelodic/src/widgets/appbar_sliver/custom_appbar_sliver.dart';

class BaseAppBarDetail extends StatelessWidget {
  final int numberSongs;
  final List<SongModel> songs;
  final AlbumModel? album;
  final PlaylistModel? playlist;
  final GenreModel? genre;
  final ArtistModel? artist;
  const BaseAppBarDetail({
    Key? key,
    this.album,
    this.playlist,
    this.artist,
    this.genre,
    required this.numberSongs,
    required this.songs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (album != null) {
      return CustomAppBarSliver(
        artworkType: ArtworkType.ALBUM,
        id: album!.id,
        subTile:
            '${album!.artist} | ${XUtils.formatNumberSong(album!.numOfSongs)}',
        title: album!.album,
        upperControlBar: UpperControlBar(
          onPressedPlay: () => _onPressedPlay(context),
        ),
      );
    } else if (playlist != null) {
      return CustomAppBarSliver(
        artworkType: ArtworkType.PLAYLIST,
        id: playlist!.id,
        subTile:
            'By: ${playlist!.dateAdded} | ${XUtils.formatNumberSong(numberSongs)}',
        title: playlist!.playlist,
        upperControlBar: UpperControlBar(
          onPressedPlay: () => _onPressedPlay(context),
        ),
      );
    } else if (artist != null) {
      return CustomAppBarSliver(
        artworkType: ArtworkType.ARTIST,
        id: artist!.id,
        subTile:
            '${XUtils.formatNumberSong(artist?.numberOfTracks ?? -1)} | ${XUtils.formatNumberAlbum(artist?.numberOfAlbums ?? -1)}',
        title: artist!.artist,
        upperControlBar: UpperControlBar(
          onPressedPlay: () => _onPressedPlay(context),
        ),
      );
    } else if (genre != null) {
      return CustomAppBarSliver(
        artworkType: ArtworkType.GENRE,
        id: genre!.id,
        subTile: XUtils.formatNumberSong(genre?.numOfSongs ?? -1),
        title: genre!.genre,
        upperControlBar: UpperControlBar(
          onPressedPlay: () => _onPressedPlay(context),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  void _onPressedPlay(BuildContext context) =>
      context.read<AudioHandleBloc>().playItem(items: songs);
}
