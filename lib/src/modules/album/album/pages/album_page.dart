import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/constants/my_padding.dart';
import 'package:zanmelodic/src/modules/album/album/logic/album_bloc.dart';
import 'package:zanmelodic/src/modules/album/album/widgets/list_album_widget.dart';
import 'package:zanmelodic/src/modules/audio_control/logic/audio_handle_bloc.dart';
import 'package:zanmelodic/src/modules/songs/logic/song_list_bloc.dart';
import 'package:zanmelodic/src/modules/upper_control/widgets/upper_control_bar.dart';

class AlbumPage extends StatelessWidget {
  const AlbumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongListBloc, SongListState>(builder: (context, state) {
      List<SongModel> _items = state.songs.data ?? [];
      return BlocBuilder<AlbumBloc, AlbumState>(
        builder: (context, state) {
          return Scaffold(
            body: RefreshIndicator(
              color: MyColors.colorPrimary,
              backgroundColor: MyColors.colorWhite,
              onRefresh: () async =>
                  context.read<AlbumBloc>().fetchListOfAlbums(),
              child: Padding(
                padding: MyProperties.pPage,
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(
                        child: UpperControlBar(
                      onPressedSort: () =>
                          context.read<AlbumBloc>().onSortNameToList(),
                      onPressedPlay: () => context
                          .read<AudioHandleBloc>()
                          .skipToQueueItem(items: _items),
                    )),
                    const ListAlbumWidget(),
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
