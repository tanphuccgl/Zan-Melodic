import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/modules/album/album_detail/logic/album_detail_bloc.dart';
import 'package:zanmelodic/src/utils/utils.dart';
import 'package:zanmelodic/src/widgets/custom_text/custom_text.dart';
import 'package:zanmelodic/src/widgets/image_widget/custom_image_widget.dart';
import 'package:zanmelodic/src/widgets/state/state_empty_widget.dart';

Widget _buildCard(BuildContext context, {required AlbumModel album}) {
  final String _numberSong = XUtils.formatNumberSong(album.numOfSongs);

  return GestureDetector(
    onTap: () => context.read<AlbumDetailBloc>().fetchListOfSongsFromAlbum(
          context,
          album: album,
        ),
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
}

class ListAlbumWidget extends StatelessWidget {
  const ListAlbumWidget({Key? key, required this.albums}) : super(key: key);
  final List<AlbumModel> albums;

  @override
  Widget build(BuildContext context) {
    return albums.isNotEmpty
        ? SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => _buildCard(context, album: albums[index]),
                childCount: albums.length),
          )
        : const XStateEmptyWidget();
  }
}
