import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/models/handle.dart';
import 'package:zanmelodic/src/models/result.dart';
import 'package:zanmelodic/src/modules/album/album/logic/album_bloc.dart';
import 'package:zanmelodic/src/modules/album/album_detail/logic/album_detail_bloc.dart';
import 'package:zanmelodic/src/utils/utils.dart';
import 'package:zanmelodic/src/widgets/image_widget/custom_image_widget.dart';
import 'package:zanmelodic/src/widgets/state/state_empty_widget.dart';
import 'package:zanmelodic/src/widgets/state/state_error_widget.dart';
import 'package:zanmelodic/src/widgets/state/state_loading_widget.dart';

class ListAlbumWidget extends StatelessWidget {
  const ListAlbumWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlbumBloc, AlbumState>(
      builder: (context, state) {
        XHandle<List<AlbumModel>> _handle = state.items;
        if (_handle.isCompleted) {
          _handle = XHandle.result(XResult.success(state.items.data ?? []));
          final List<AlbumModel> _items = _handle.data ?? [];
          state.isSortName ? state.sortListByNameReverse : state.sortListByName;
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

Widget _buildCard(BuildContext context, {required AlbumModel album}) {
  final String numberSong = XUtils.formatNumberSong(album.numOfSongs);
  return GestureDetector(
    onTap: () => context
        .read<AlbumDetailBloc>()
        .fetchListOfSongsFromAlbum(context, album: album),
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
                _customText(
                  title: album.album,
                  style: Style.textTheme().titleMedium,
                ),
                _customText(
                  title: album.artist ?? '',
                ),
                _customText(title: numberSong),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Text _customText({required String title, TextStyle? style}) {
  return Text(title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: style ??
          Style.textTheme()
              .titleMedium!
              .copyWith(color: MyColors.colorGray, fontSize: 17, height: 1.23));
}
