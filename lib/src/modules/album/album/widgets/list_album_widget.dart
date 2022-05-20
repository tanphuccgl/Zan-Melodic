import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/modules/album/album/logic/album_bloc.dart';
import 'package:zanmelodic/src/modules/album/album_detail/logic/album_detail_bloc.dart';
import 'package:zanmelodic/src/modules/songs/logic/song_list_bloc.dart';
import 'package:zanmelodic/src/utils/utils.dart';
import 'package:zanmelodic/src/widgets/custom_text/custom_text.dart';
import 'package:zanmelodic/src/widgets/image_widget/custom_image_widget.dart';
import 'package:zanmelodic/src/widgets/state/state_empty_widget.dart';
import 'package:zanmelodic/src/widgets/state/state_error_widget.dart';
import 'package:zanmelodic/src/widgets/state/state_loading_widget.dart';

Widget _buildCard(BuildContext context, {required AlbumModel album}) {
  final String _numberSong = XUtils.formatNumberSong(album.numOfSongs);
  return BlocBuilder<SongListBloc, SongListState>(builder: (context, state) {
    return GestureDetector(
      onTap: () => context.read<AlbumDetailBloc>().fetchListOfSongsFromAlbum(
          context,
          album: album,
          songs: state.items.data ?? []),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 9),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomImageWidget(
                id: album.id,
                height: 120,
                width: 120,
                artworkType: ArtworkType.ALBUM),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CusText(
                    title: album.album,
                    style: Style.textTheme().titleMedium,
                  ),
                  CusText(
                    title: album.artist ?? '',
                  ),
                  CusText(title: _numberSong),
                ],
              ),
            )
          ],
        ),
      ),
    );
  });
}

class ListAlbumWidget extends StatelessWidget {
  const ListAlbumWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlbumBloc, AlbumState>(
      builder: (context, state) {
        XHandle<List<AlbumModel>> _handle = state.items;
        if (_handle.isCompleted) {
          final List<AlbumModel> _items = _handle.data ?? [];
          state.isSortName
              ? state.sortListByName(reverse: true)
              : state.sortListByName();
          state.isShuffle ? _items.shuffle() : null;
          return _items.isNotEmpty
              ? SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (context, index) =>
                          _buildCard(context, album: _items[index]),
                      childCount: _items.length),
                )
              : const XStateEmptyWidget();
        } else if (_handle.isLoading) {
          return const XStateLoadingWidget();
        } else {
          return const XStateErrorWidget();
        }
      },
    );
  }
}
