import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/modules/album/album_detail/logic/album_detail_bloc.dart';
import 'package:zanmelodic/src/modules/play_music/logic/play_music_bloc.dart';
import 'package:zanmelodic/src/utils/utils.dart';
import 'package:zanmelodic/src/widgets/custom_bar/upper_control_bar.dart';
import 'package:zanmelodic/src/widgets/image_widget/custom_image_widget.dart';

class AppBarAlbumDetail extends StatelessWidget {
  const AppBarAlbumDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hStatusBar = MediaQuery.of(context).viewPadding.top;
    const hExpanded = 350.0;
    const hToolbar = 320.0;

    return BlocBuilder<AlbumDetailBloc, AlbumDetailState>(
      builder: (context, state) {
        final _album = state.album;
        return SliverAppBar(
            backgroundColor: MyColors.colorBlack,
            stretch: true,
            pinned: true,
            elevation: 0,
            automaticallyImplyLeading: false,
            toolbarHeight: hToolbar,
            expandedHeight: hExpanded,
            flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              bool isCollapsed = constraints.maxHeight < hExpanded + hStatusBar;
              return SafeArea(
                child: Container(
                  color: isCollapsed
                      ? MyColors.colorBackground
                      : MyColors.colorBlack,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5, top: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          _album.album,
                          style: Style.textTheme()
                              .displaySmall!
                              .copyWith(fontSize: 25),
                        ),
                        Text(
                          '${_album.artist} | ${XUtil.formatNumberSong(_album.numOfSongs)}',
                          style: Style.textTheme().titleMedium!.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                              color: MyColors.colorGray),
                        ),
                        isCollapsed
                            ? CustomImageWidget(
                                id: _album.id,
                                height: 190,
                                width: double.infinity,
                                artworkType: ArtworkType.ALBUM,
                                isShadow: true,
                              )
                            : CustomImageWidget(
                                id: _album.id,
                                height: 220,
                                width: 220,
                                artworkType: ArtworkType.ALBUM,
                                isShadow: true,
                              ),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                            child: UpperControlBar(
                              colorIconShuffle: state.shuffleColorIcon,
                              colorIconSort: state.sortColorIcon,
                              onPressedSort: () => context
                                  .read<AlbumDetailBloc>()
                                  .onSortNameToList(),
                              onPressedShuffle: () => context
                                  .read<AlbumDetailBloc>()
                                  .onShuffleToList(),
                              onPressedPlayer: () => context
                                  .read<PlayMusicBloc>()
                                  .onPlayerItem(
                                      songList: state.items.data ?? []),
                            ))
                      ],
                    ),
                  ),
                ),
              );
            }));
      },
    );
  }
}
